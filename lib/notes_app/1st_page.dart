import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:notes_app/notes_app/2nd_page.dart';
import 'package:notes_app/notes_app/Database.db.dart';


class Home2 extends StatefulWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  @override
  void initState() {
    // TODO: implement initState
    createDatabase('notesDatabase.db');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('4d6d53'),
        title: const Text('Notes App'),
        titleTextStyle: const TextStyle(
         fontSize: 25,
        ),
      ),
      body: const Center(
          child: Text(
              'Press to create a note',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>  NoteArea(),));
        },
        child: const Icon(Icons.add),
        backgroundColor: HexColor('4d6d53'),

      ),
    );
  }
}
