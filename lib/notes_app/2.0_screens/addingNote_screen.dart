import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/notes_app/Database.db.dart';


class AddingScreen extends StatelessWidget {
  AddingScreen({Key? key}) : super(key: key);

  var noteCont= TextEditingController();
  var dataCont= TextEditingController();
  var formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('4d6d53'),
        title: const Text(
          'Add a Note',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column (
            children: [
              TextFormField(
                validator: (value) {
                  if(value!.isEmpty)
                  {
                    return 'please this field is required';
                  }
                },
                controller: noteCont,
                decoration: const InputDecoration(
                    labelText: 'Add a note',
                    hintText: 'Add a Note',
                    prefixIcon: Icon(Icons.notes),
                    border: OutlineInputBorder()
                ),
              ),
              const SizedBox(height: 15,),
              TextFormField(
                validator: (value) {
                  if(value!.isEmpty)
                  {
                    return 'please this field is required';
                  }
                },

                controller: dataCont,
                decoration: const InputDecoration(
                    labelText: 'Date',
                    hintText: 'Date',
                    prefixIcon: Icon(Icons.date_range_outlined),
                    border: OutlineInputBorder()
                ),
                onTap: ()
                {
                  showDatePicker(
                    context: context,
                    initialDate:  DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now(),
                  ).then((value)
                  {
                    dataCont.text= DateFormat.yMMMd().format(value!);
                    print(dataCont.text);
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 250, top: 20),
                child: MaterialButton(
                  color: Colors.white60,
                  onPressed: ()
                  {
                    if(formKey.currentState!.validate())
                    {
                      insertToDatabase(noteCont.text , dataCont.text);

                      noteCont.clear();
                      dataCont.clear();
                    }
                  },
                  child: const Text('Add'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
