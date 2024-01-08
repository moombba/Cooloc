
import 'package:cooloc/pages/main_page.dart';
import 'package:cooloc/theme/dark_theme.dart';
import 'package:cooloc/theme/light_theme.dart';
import 'package:dotenv/dotenv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // var env = DotEnv(includePlatformEnvironment: true)..load();

  // // await Supabase.initialize(
  // //   url: env['supabaseUrl']!,
  // //   anonKey: env['supabaseAnonKey']!,
  // // );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
     runApp(const ProviderScope(child: MyApp()));
  });

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      home:  MainPage(),
    );
  }
}

