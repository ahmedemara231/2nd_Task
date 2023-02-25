import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:notes_app/notes_app/2.0_screens/addingNote_screen.dart';
import 'package:notes_app/notes_app/2.0_screens/notes_screen.dart';


class NoteArea extends StatefulWidget {
  @override
  State<NoteArea> createState() => _NoteAreaState();
}

class _NoteAreaState extends State<NoteArea> {
  int currentIndex= 0;
  final screens=
    [
      AddingScreen(),
      NotesScreen(),
    ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.white,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex= index;
              });
            },
            selectedLabelStyle: const TextStyle(
              fontSize: 20
            ),
            backgroundColor: HexColor('4d6d53'),
             unselectedItemColor: Colors.white,
             items:
            [
               BottomNavigationBarItem(icon: Icon(Icons.add),label: 'add a note'),
               BottomNavigationBarItem(icon: Icon(Icons.notes),label: 'Notes'),
            ],
          ),
           body: screens[currentIndex] ,

        ),
      ),
    );
  }
}
