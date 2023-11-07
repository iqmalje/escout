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
      if (e.toString().contains('login credentials')) {
        throw Exception("Invalid login credentials");
      }

      throw e;
    }
  }

  Future<void> sendPasswordOTP(String email) async {
    await supabase.auth.resetPasswordForEmail(email);
  }

  Future<bool> verifyPasswordOTP(String email, String OTP) async {
    try {
      var data = await supabase.auth
          .verifyOTP(email: email, token: OTP, type: OtpType.recovery);

      if (data.session != null) {
        return true;
      } else
        return false;
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
}
