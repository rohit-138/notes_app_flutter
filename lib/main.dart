import 'package:flutter/material.dart';
import 'package:notes_app/diary.dart';
import 'package:notes_app/homescreen.dart';
import 'package:notes_app/notes.dart';
import 'package:notes_app/todo.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyBottomNavigationBar(),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0; // Index of the selected tab
  List<BottomNavigationBarItem> bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.list_alt),
      label: 'ToDo',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.note_alt_outlined),
      label: 'Notes',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.my_library_books_outlined),
      label: 'Diary',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: _buildPage(_currentIndex), // Content of the selected tab
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // Offset of the shadow
              ),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0), // Adjust the radius as needed
              topRight: Radius.circular(20.0), // Adjust the radius as needed
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0), // Same radius as the Container
              topRight: Radius.circular(20.0), // Same radius as the Container
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: bottomNavBarItems,
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              showUnselectedLabels: true,

              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors
                  .deepPurpleAccent, // Customize the color of the selected item here
              backgroundColor:
                  Colors.white, // Background color of the navigation bar
            ),
          ),
        ));
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const ToDo();
      case 2:
        return const Notes();
      case 3:
        return const Diary();
      default:
        return Container(); // Return an empty container for unknown index
    }
  }
}
