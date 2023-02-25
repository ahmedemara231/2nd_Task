import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:notes_app/notes_app/Database.db.dart';
import 'package:notes_app/notes_app/edit_notes.dart';

class NotesScreen extends StatefulWidget {

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: HexColor('4d6d53'),
        titleTextStyle: const TextStyle(
          fontSize: 25,
        ),
        title: const Text('Notes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FutureBuilder(
          future: getDataFromDatabase(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) => Stack(
                        children: [
                          Card(
                            elevation: 2,
                            child: ListTile(

                              // subtitle:
                              //     Text(
                              //         '${snapshot.data?[index]['date']}'),
                              title: Text(
                                '${snapshot.data?[index]['note']}',
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () async
                                      {
                                       // int response= await updataData(
                                       //     '''
                                       //     UPDATE Notes SET
                                       //     note = "${snapshot.data?[index]['note']}"
                                       //     WHERE id= ${snapshot.data?[index]['id']}
                                       //     ''');
                                       // if(response > 0)
                                       //   {
                                           Navigator.push(
                                               context, MaterialPageRoute(
                                             builder: (context) => EditNotes(
                                               note: snapshot.data?[index]['note'],
                                               id: snapshot.data?[index]['id'],
                                             ),
                                           ));
                                         //}

                                      }, icon: const Icon(Icons.edit)),
                                  IconButton(
                                      onPressed: ()
                                      {
                                        setState(() {
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              actions: [
                                                MaterialButton(
                                                  onPressed: ()
                                                  {
                                                    Navigator.pop(context);
                                                    print('Cancel');
                                                  },
                                                  child: const Text('Cancel'),
                                                  color: Colors.grey,),
                                                MaterialButton(
                                                  onPressed: ()
                                                  {
                                                    setState(() {
                                                      deleteData("DELETE FROM Notes WHERE id = ${snapshot.data?[index]['id']}").then((value)
                                                      {
                                                        print('Value= $value');
                                                        print('Deleted');
                                                      });
                                                      Navigator.pop(context);
                                                    });
                                                  },
                                                  child: const Text('Delete'),
                                                  color: Colors.redAccent,),
                                              ],
                                              elevation: 2,
                                              title: const Text('Are you sure to delete this ?'),
                                              backgroundColor: Colors.white,
                                            ),);
                                        });
                                      }, icon: const Icon(Icons.delete)),
                                ],
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 320, top: 20),
                          //   child: IconButton(
                          //     onPressed: ()
                          //     {
                          //       setState(() {
                          //          showDialog(
                          //              context: context,
                          //              builder: (context) => AlertDialog(
                          //                actions: [
                          //                  MaterialButton(
                          //                    onPressed: ()
                          //                  {
                          //                    Navigator.pop(context);
                          //                    print('Cancel');
                          //                  },
                          //                    child: Text('Cancel'),
                          //                    color: Colors.grey,),
                          //                  MaterialButton(
                          //                    onPressed: ()
                          //                    {
                          //                      deleteData("DELETE FROM Notes WHERE id = 1").then((value)
                          //                      {
                          //                        print('Value= $value');
                          //                        print('Deleted');
                          //                      });
                          //                    },
                          //                    child: Text('Delete'),
                          //                    color: Colors.redAccent,),
                          //                ],
                          //                elevation: 2,
                          //                title: const Text('Are you sure to delete this ?'),
                          //                backgroundColor: Colors.white70,
                          //              ),);
                          //       });
                          //     },
                          //     icon: const Icon(
                          //       Icons.remove,
                          //     ),
                          //   ),
                          // )
                        ],
                      ));
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}