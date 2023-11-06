import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseB {
  var supabase = Supabase.instance.client;

  //Any backend function goes here
  Future<bool> signIn(String email, String password) async {
    try {
      var data = await supabase.auth
          .signInWithPassword(password: password, email: email);
      return true;
    } catch (e) {
      throw Exception(e);
    }
  }
}
