import 'package:flutter/material.dart';
import 'package:restbase_test/src/repository.dart';
import 'package:restbase_test/src/star_wars_character.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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

  void getSWCharacters() async {
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
              'Meus personagens preferidos do StarWars são:',
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
                  padding: EdgeInsets.all(16.0),
                  child: CircularProgressIndicator())
            else
              for (final c in starWarsCharactersName) Text(c),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getSWCharacters();
        },
        tooltip: 'Buscar',
        child: const Icon(Icons.local_fire_department),
      ),
    );
  }
}
