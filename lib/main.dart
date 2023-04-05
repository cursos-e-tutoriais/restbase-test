import 'package:flutter/material.dart';
import 'package:restbase_test/src/repository.dart';
import 'package:restbase_test/src/star_wars_character.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF272b31),
      ),
      home: const MyHomePage(title: 'Personagens do Star Wars'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final repository = TestApi();
  List<String> starWarsCharactersName = [];
  bool isLoading = false;

  void _translateText() async {
    setState(() {
      starWarsCharactersName.clear();
      isLoading = true;
    });
    final List<StarWarsCharacter> characters =
        await repository.getAllSWCharacters();

    for (final c in characters) {
      setState(() {
        starWarsCharactersName.add(c.name ?? "");
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const Text(
              'Meu personagem preferido do Star Wars é:',
            ),
            const SizedBox(height: 16.0),
            if (starWarsCharactersName.isEmpty && !isLoading)
              const Text(
                "Clique no botão abaixo para buscar os personagens",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.0,
                ),
              )
            else if (starWarsCharactersName.isEmpty && isLoading)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              )
            else
              for (final c in starWarsCharactersName) Text(c),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _translateText();
        },
        tooltip: 'Buscar',
        child: const Icon(Icons.local_fire_department),
      ),
    );
  }
}
