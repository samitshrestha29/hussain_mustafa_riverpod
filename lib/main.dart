import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hussain_mustafa_riverpod/pages/home_page.dart';
import 'package:hussain_mustafa_riverpod/services/http_services.dart';

void main() async {
  await _setupService();
  runApp(const ProviderScope(child: MyApp()));
}

Future<void> _setupService() async {
  GetIt.instance.registerSingleton(
    HTTPService(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PokeDex',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
        textTheme: GoogleFonts.quattrocentoSansTextTheme(),
      ),
      home: const MyHomePage(),
    );
  }
}
