import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseB {
  var supabase = Supabase.instance.client;

  static String? _accid;

  Future<dynamic> _runrpc(String fnname, {Map<String, dynamic>? args}) async {
    if (_accid == null) return;
    if (args == null) {
      args = {'accid': _accid};
    } else {
      args['accid'] = _accid;
    }
    var data = await supabase.rpc(fnname, params: args);
  }

  Future<void> test() async {
    await supabase.auth
        .signUp(password: 'iqmalpassword', email: 'iqmal@gmail.com');
  }

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
