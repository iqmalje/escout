import 'package:escout/model/account.dart';
import 'package:escout/model/activity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseB {
  var supabase = Supabase.instance.client;

  static bool isAdminToggled = false;

  /// Returns a list of attended activities that has been attended
  /// by the user that is logged in.
  ///
  /// May return an empty list if there is no activity attended.
  Future<List<Activity>> getAttendedActivities(String filter) async {
    var data = await supabase.rpc('filter_attended_activities',
        params: {'filter': filter, 'aid': supabase.auth.currentUser!.id});

    List<Activity> activities = [];
    for (var activity in data) {
      activities.add(Activity(activity));
    }
    return activities;
  }

  /// Set the status of the activity to done
  Future<void> updateActivityDone(String activityid) async {
    await supabase
        .from('activities')
        .update({'status': 'DONE'}).eq('activityid', activityid);
  }

  Future<List<dynamic>> getAttendance(String activityid) async {
    var data = await supabase.from('attendance').select('*').match(
        {'activityid': activityid, 'accountid': supabase.auth.currentUser!.id});

    return data;
  }

  /// Sign in the user to the application, will auto login
  /// So the user wont have to login everytime.
  Future<bool> signIn(String email, String password) async {
    try {
      await supabase.auth.signInWithPassword(password: password, email: email);
      //on sign in, just set the var to false
      isAdminToggled = false;
      return true;
    } catch (e) {
      if (e.toString().contains('login credentials')) {
        throw Exception("Invalid login credentials");
      }

      rethrow;
    }
  }

  /// Send an OTP to user's email for forgot password
  Future<void> sendPasswordOTP(String email) async {
    await supabase.auth.resetPasswordForEmail(email);
  }

  /// Will sign out user, and the user will have to relogin
  /// when opening the app again later.
  Future<void> signout() async {
    await supabase.auth.signOut();
  }

  /// It will return the model Account, this is based on user's login info
  /// If user is not logged in to the application, an error will be thrown out!
  Future<Account> getProfileInfo() async {
    var userid = supabase.auth.currentUser!.id;
    var data =
        await supabase.from('accounts').select('*').eq('accountid', userid);

    return Account(data[0]);
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
      if (cardid[0] == 'J') {
        await addAttendanceByScoutID(activityid, cardid);
        return;
      }
      var accid = await supabase
          .from('accounts')
          .select('accountid, fullname')
          .match({'cardid': cardid}).single();
      print(accid);
      await supabase.from('attendance').insert({
        'activityid': activityid,
        'accountid': accid['accountid'],
        'fullname': accid['fullname'],
        'attendancekey':
            '${accid['accountid']}.${DateTime.now().day}${DateTime.now().month}${DateTime.now().year}.$activityid'
      });
    } catch (e) {
      print(e);
    }
  }

  /// Since adding an event requires many params, it is better
  /// for developers to send out a Map instead, below is the required info
  /// for a map.
  ///
  /// Map<String, dynamic>
  /// {
  ///   name, category, location, startdate, enddate, file (FOR IMAGE)
  /// }
  ///
  /// TODO: Update this function to receive class Activity instead.
  Future<void> addEvent(Map<String, dynamic> items) async {
    var accid = supabase.auth.currentUser!.id;

    var activity = await supabase
        .from('activities')
        .insert({
          'name': items['name'],
          'category': items['category'].toString().toUpperCase(),
          'location': items['location'],
          'startdate': items['startdate'],
          'enddate': items['enddate'],
          'is_show_activity': true,
          'created_by': accid,
          'is_show_feed': false,
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

  /// Get a list of feed for the user
  Future<List<Activity>> getFeed() async {
    var feed = await supabase
        .from('activities')
        .select('*')
        .match({'is_show_feed': true}).order('created_at');

    List<Activity> activities = [];

    for (var data in feed) {
      activities.add(Activity(data));
    }
    return activities;
  }

  Future<List<Activity>> getActivities({Map<String, dynamic>? filters}) async {
    print(filters);
    List<dynamic> rawData = [];
    List<Activity> activities = [];
    if (filters == null) {
      var activities = await supabase.from('activities').select('*');

      rawData = activities;
    } else {
      var activities = await supabase.rpc('filter_activities',
          params: {'filter': '${filters['year']}-${filters['month']}-%'});

      rawData = activities;
    }

    for (var activity in rawData) {
      activities.add(Activity(activity));
    }

    return activities;
  }

  Future<void> createFeed(Map<String, dynamic> items) async {
    var accid = supabase.auth.currentUser!.id;
    var activity = await supabase
        .from('activities')
        .insert({
          'name': items['name'],
          'category': items['category'].toString().toUpperCase(),
          'location': items['location'],
          'startdate': items['startdate'],
          'enddate': items['enddate'],
          'is_show_activity': items['is_show_activity'],
          'created_by': accid,
          'fee': items['fee'],
          'registrationenddate': items['registrationenddate'],
          'description': items['description'],
          'is_show_feed': true,
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
            '${accid['accountid']}.${DateTime.now().day}${DateTime.now().month}${DateTime.now().year}.$activityid'
      });
    } catch (e) {
      print(e);
    }
  }
}
