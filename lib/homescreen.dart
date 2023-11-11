import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/horizontalCards.dart';
import 'package:notes_app/model/Note.dart';
import 'package:http/http.dart' as http;
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Note> notesList = [];
  Future<void> fetchData() async {
    final response = await http
        .get(Uri.parse("https://notesapp-i6yf.onrender.com/user/getAllNotes"));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body)['data'];
      setState(() {
        notesList = responseData.map((data) => Note.fromJson(data)).toList();
        print(notesList);
      });
    } else {
      throw Exception('failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    if (notesList.isEmpty) {
      return const Center(
          child: CupertinoActivityIndicator(   
        color: Colors.deepPurpleAccent,
        radius: 20,
      ));
    } else {
return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Expanded(
          child: ListView(
        children: [
          HorizontalCardsList(
            notes: notesList,
            heading: "To Do",
          ),
          HorizontalCardsList(
            notes: notesList,
            heading: "Notes",
          ),
          HorizontalCardsList(
            notes: notesList,
            heading: "Diary",
          ),
        ],
      )),
    );
    }
    
  }
}

// class entirecolumn extends StatelessWidget {
//   const entirecolumn({
//     super.key,
//     required this.notesList,
//   });

//   final List<Note> notesList;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text("To Do ",
//             textAlign: TextAlign.end,
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 20,
//             )),
//         HorizontalCardsList(
//           notes: notesList,
//           heading: "To Do",
//         )
//         // SingleChildScrollView(
//         //   scrollDirection: Axis.horizontal,
//         //   child: Row(
//         //     children: [
//         //     ListView.builder(
//         //         itemCount: notes.length,
//         //         itemBuilder: (context, index) {
//         //           return NotesCard(
//         //               title: notes[index].title,
//         //               description: notes[index].description);
//         //         })
//         //   ]
//         //   ),
//         // ),
//         ,
//         Text("Notes ",
//             textAlign: TextAlign.end,
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 20,
//             )),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: [
//               NotesCard(
//                 title: "Things to do fsdff fsdfasd sadfasdf",
//                 description: "sdrfsdfa",
//               ),
//               NotesCard(
//                 title: "Things to do",
//                 description:
//                     "sdrfsdfa lorem23 kjfklasdf fslkadfjakalksdkjfklasdf fslkadfjakalksdfasfklasflkasfjlkasfklasfjklafdsfasfklasflkasfjlkasfklasfjklasfjklafds  fjsadlkfjalsdfk asflkjaslkdfjasl",
//               ),
//               NotesCard(
//                 title: "Things to do",
//                 description:
//                     "sdrfsdfa lorem23 kjfklasdf fslkadfjakalksdkjfklasdf fslkadfjakalksdfasfklasflkasfjlkasfklasfjklafdsfasfklasflkasfjlkasfklasfjklasfjklafds  fjsadlkfjalsdfk asflkjaslkdfjasl",
//               ),
//             ],
//           ),
//         ),
//         Text("Diary",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 20,
//             )),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: [
//               NotesCard(
//                 title: "Things to do fsdff fsdfasd sadfasdf",
//                 description: "sdrfsdfa",
//               ),
//               NotesCard(
//                 title: "Things to do",
//                 description:
//                     "sdrfsdfa lorem23 kjfklasdf fslkadfjakalksdkjfklasdf fslkadfjakalksdfasfklasflkasfjlkasfklasfjklafdsfasfklasflkasfjlkasfklasfjklasfjklafds  fjsadlkfjalsdfk asflkjaslkdfjasl",
//               ),
//               NotesCard(
//                 title: "Things to do",
//                 description:
//                     "sdrfsdfa lorem23 kjfklasdf fslkadfjakalksdkjfklasdf fslkadfjakalksdfasfklasflkasfjlkasfklasfjklafdsfasfklasflkasfjlkasfklasfjklasfjklafds  fjsadlkfjalsdfk asflkjaslkdfjasl",
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

