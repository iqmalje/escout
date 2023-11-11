import 'package:escout/pages/homepage/profilepage.dart';
import 'package:escout/pages/homepage/temppage.dart';
import 'package:escout/pages/signin/signinpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

bool isSignedIn = false;
void main() async {
  await dotenv.load(fileName: '2.env');
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_AUTH_KEY']!,
  );

  if (Supabase.instance.client.auth.currentUser == null) {
    isSignedIn = false;
  } else {
    isSignedIn = true;
  }

  runApp(const MyApp());
}

//we are in sprint-1
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 13, 63, 214)),
        useMaterial3: true,
      ),
      routes: {
        '/signin': (context) => const SignInPage(),
      },
      home: isSignedIn ? const TempPage() : const SignInPage(),
    );
  }
}
