import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseB {
  var supabase = Supabase.instance.client;

  static String? _accid;

  //Any backend function goes here
  Future<bool> signIn(String email, String password) async {
    _accid =
        await supabase.rpc('sign_in', params: {'em': email, 'pa': password});

    if (_accid == null) {
      throw Exception('Incorrect credential!');
    }
    return true;
  }
}
