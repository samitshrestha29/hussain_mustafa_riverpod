// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:get_it/get_it.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hussain_mustafa_riverpod/pages/home_page.dart';
// import 'package:hussain_mustafa_riverpod/services/http_services.dart';

// void main() async {
//   await _setupService();
//   runApp(const ProviderScope(child: MyApp()));
// }

// Future<void> _setupService() async {
//   GetIt.instance.registerSingleton(
//     HttpService(),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'PokeDex',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
//         useMaterial3: true,
//         textTheme: GoogleFonts.quattrocentoSansTextTheme(),
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Pokemon> _pokemon = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPokemon();
    _pokemon;
  }

  Future<void> fetchPokemon() async {
    final response = await http
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=20&offset=0'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _pokemon = data['results'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Home Page'),
      ),
      body: _pokemon.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _pokemon.length,
              itemBuilder: (context, index) {
                final imageUrl =
                    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png';

                return ListTile(
                  leading: Image.network(imageUrl),
                  title: Text('$index'),
                  subtitle: Text(_pokemon[index].name),
                );
              }),
    );
  }
}

class Pokemon {
  String name;

  Pokemon({required this.name});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(name: json['name']);
  }
}
