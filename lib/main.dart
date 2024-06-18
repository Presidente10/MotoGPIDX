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
      home: MyHomePage(title: 'Welcome to IDX'),
    );
  }
}

class MyHomePage extends StatelessWidget {
   MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  // Definisci le categorie
  final List<Category> categories = [
    Category(title: 'Category 1', icon: Icons.book),
    Category(title: 'Category 2', icon: Icons.movie),
    Category(title: 'Category 3', icon: Icons.music_note),
    Category(title: 'Category 4', icon: Icons.sports),
    Category(title: 'Category 5', icon: Icons.restaurant),
    Category(title: 'Category 6', icon: Icons.shopping_cart),
    Category(title: 'Category 7', icon: Icons.airplanemode_active),
    Category(title: 'Category 8', icon: Icons.people),
    Category(title: 'Category 9', icon: Icons.work),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: GridView.count(
        crossAxisCount: 3, // 3 colonne nella griglia
        children: categories.map((Category category) {
          return InkWell(
            onTap: () {
              // Aggiungi l'azione per gestire il tap sulla categoria
              // Per esempio, navigare verso una nuova pagina
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoryPage(category)),
              );
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(category.icon, size: 50),
                  const SizedBox(height: 8),
                  Text(category.title),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class Category {
  final String title;
  final IconData icon;

  Category({required this.title, required this.icon});
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

