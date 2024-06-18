import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IDX Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(title: 'Welcome to IDX'),
    );
  }
}

class MyHomePage extends StatelessWidget {
   MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  // Definisci le categorie
  final List<Category> categories = [
    Category(title: 'MotoGp'),
    Category(title: 'Moto2'),
    Category(title: 'Moto3'),
    Category(title: 'MotoE'),
    Category(title: '350cc'),
    Category(title: '250cc'),
    Category(title: '125cc'),
    Category(title: '80cc'),
    Category(title: '50cc'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Spazio vuoto per separare l'app bar dalle categorie
          const SizedBox(height: 20),
          // ListView orizzontale per le categorie
          SizedBox(
            height: 120, // Altezza desiderata delle categorie
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CategoryPage(categories[index])),
                      );
                    },
                    child: Text(categories[index].title),
                    style: TextButton.styleFrom(
      
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      textStyle: const TextStyle(fontSize: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Category {
  final String title;

  Category({required this.title});
}

// Esempio di pagina per la singola categoria
class CategoryPage extends StatelessWidget {
  final Category category;

  const CategoryPage(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: Text('Contenuto per ${category.title}'),
      ),
    );
  }
}
