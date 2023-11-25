import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseB {
  var supabase = Supabase.instance.client;

  //Any backend function goes here
  Future<bool> signIn(String email, String password) async {
    try {
      await supabase.auth.signInWithPassword(password: password, email: email);
      return true;
    } catch (e) {
      if (e.toString().contains('login credentials')) {
        throw Exception("Invalid login credentials");
      }

      rethrow;
    }
  }

  Future<void> sendPasswordOTP(String email) async {
    await supabase.auth.resetPasswordForEmail(email);
  }

  Future<void> signout() async {
    await supabase.auth.signOut();
  }

  Future<dynamic> getProfileInfo() async {
    var userid = supabase.auth.currentUser!.id;
    print("USERID = ${userid}");
    var data =
        await supabase.from('accounts').select('*').eq('accountid', userid);

    return data[0];
  }

  Future<bool> verifyPasswordOTP(String email, String OTP) async {
    try {
      var data = await supabase.auth
          .verifyOTP(email: email, token: OTP, type: OtpType.recovery);

      if (data.session != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception("Token has expired or is invalid");
    }
  }

  Future<void> updatePassword(String email, String password) async {
    try {
      await supabase.auth
          .updateUser(UserAttributes(email: email, password: password));
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> addAttendance(String activityid, String cardid) async {
    //get accountid from cardid
    try {
      var accid = await supabase
          .from('accounts')
          .select('accountid, fullname')
          .eq('cardid', cardid)
          .single();
      print(accid);
      await supabase.from('attendance').insert({
        'activityid': activityid,
        'accountid': accid['accountid'],
        'fullname': accid['fullname'],
        'attendancekey':
            '${accid['accountid']}.${DateTime.now().day}${DateTime.now().month}${DateTime.now().year}'
      });
    } catch (e) {
      print(e);
      print('no acc found');
    }
  }

  Future<void> addEvent(Map<String, dynamic> items) async {
    var accid = supabase.auth.currentUser!.id;

    var activity = await supabase
        .from('activities')
        .insert({
          'name': items['name'],
          'category': items['category'],
          'location': items['location'],
          'startdate': items['startdate'],
          'enddate': items['enddate'],
          'is_feed': false,
          'created_by': accid
        })
        .select('activityid')
        .single();

    //upload to db
    //{activityid: blabla}
    await supabase.storage
        .from('activities')
        .upload('${activity['activityid']}/cover.png', items['file']);

    //update activity db

    await supabase.from('activities').update({
      'imageurl': supabase.storage
          .from('activities')
          .getPublicUrl('${activity['activityid']}/cover.png')
    }).eq('activityid', activity['activityid']);
  }

  Future<List<dynamic>> getFeed() async {
    var feed =
        await supabase.from('activities').select('*').match({'is_feed': true});

    return feed;
  }

  Future<List<dynamic>> getActivities({Map<String, dynamic>? filters}) async {
    if (filters == null) {
      var activities = await supabase.from('activities').select('*');

      return activities;
    } else {
      var activities = await supabase.rpc('filter_activities',
          params: {'filter': '${filters['year']}-${filters['month']}%'});

      return activities;
    }
  }

  Future<void> createFeed(Map<String, dynamic> items) async {
    var accid = supabase.auth.currentUser!.id;
    var activity = await supabase
        .from('activities')
        .insert({
          'name': items['name'],
          'category': items['category'],
          'location': items['location'],
          'startdate': items['startdate'],
          'enddate': items['enddate'],
          'is_feed': items['is_feed'],
          'created_by': accid,
          'fee': items['fee'],
          'registrationenddate': items['registrationenddate'],
          'description': items['description'],
        })
        .select('activityid')
        .single();

    //upload to storage

    await supabase.storage
        .from('activities')
        .upload('${activity['activityid']}/cover.png', items['file']);

    await supabase.from('activities').update({
      'imageurl': supabase.storage
          .from('activities')
          .getPublicUrl('${activity['activityid']}/cover.png')
    }).eq('activityid', activity['activityid']);
  }

  Future<void> addAttendanceByScoutID(String activityid, String scoutID) async {
    try {
      var accid = await supabase
          .from('accounts')
          .select('accountid, fullname')
          .eq('no_ahli', scoutID)
          .single();
      print(accid);
      await supabase.from('attendance').insert({
        'activityid': activityid,
        'accountid': accid['accountid'],
        'fullname': accid['fullname'],
        'attendancekey':
            '${accid['accountid']}.${DateTime.now().day}${DateTime.now().month}${DateTime.now().year}'
      });
    } catch (e) {
      print(e);
      print('no acc found');
    }
  }
}
