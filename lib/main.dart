import 'package:escout/pages/signin/signin.dart';
import 'package:escout/pages/signin/testpage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_AUTH_KEY']!,
  );
  runApp(const MyApp());
}

//we are in sprint-1
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 13, 63, 214)),
        useMaterial3: true,
      ),
      home: const TestPage(),
    );
  }
}
