import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:notes_app/notes_app/Database.db.dart';


class EditNotes extends StatefulWidget {

  var note;
  var id;

  EditNotes({
    required this.note,
    required this.id,
  });

  @override
  State<EditNotes> createState() => _EditNotesState();
}

class _EditNotesState extends State<EditNotes> {
  var notecont = TextEditingController();

  @override
  void initState() {
    notecont.text = widget.note;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('4d6d53'),
        title : const Text('Edit a Note'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child:  TextFormField(
              onFieldSubmitted: (note)
              {

              setState(()
              {
               Future<dynamic> response= updataData('''
                UPDATE Notes SET 
                note= "${note}"    
                WHERE id= ${widget.id}
                ''',
                ).then((value)
                {
                  if(value > 0)
                    {
                      setState(() {
                        Navigator.pop(context);
                        print('response = $value');
                      });
                    }
                  return const CircularProgressIndicator();
                });


              });
              },
              controller: notecont ,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.edit),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// (
// 'UPDATE Test SET'
// ' name = ?,'
// ' value = ? WHERE name = ?',
// ['updated name', '9876', 'some name']);