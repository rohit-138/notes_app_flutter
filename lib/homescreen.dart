import 'package:flutter/material.dart';
import 'package:notes_app/notescard.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.vertical,

      child: Padding(
        padding: EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("To Do ",
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  NotesCard(
                    title: "Things to do fsdff fsdfasd sadfasdf",
                    description: "sdrfsdfa",
                  ),
                  NotesCard(
                    title: "Things to do",
                    description:
                        "sdrfsdfa lorem23 kjfklasdf fslkadfjakalksdkjfklasdf fslkadfjakalksdfasfklasflkasfjlkasfklasfjklafdsfasfklasflkasfjlkasfklasfjklasfjklafds  fjsadlkfjalsdfk asflkjaslkdfjasl",
                  ),
                  NotesCard(
                    title: "Things to do",
                    description:
                        "sdrfsdfa lorem23 kjfklasdf fslkadfjakalksdkjfklasdf fslkadfjakalksdfasfklasflkasfjlkasfklasfjklafdsfasfklasflkasfjlkasfklasfjklasfjklafds  fjsadlkfjalsdfk asflkjaslkdfjasl",
                  ),
                ],
              ),
            ),
            Text("Notes ",
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  NotesCard(
                    title: "Things to do fsdff fsdfasd sadfasdf",
                    description: "sdrfsdfa",
                  ),
                  NotesCard(
                    title: "Things to do",
                    description:
                        "sdrfsdfa lorem23 kjfklasdf fslkadfjakalksdkjfklasdf fslkadfjakalksdfasfklasflkasfjlkasfklasfjklafdsfasfklasflkasfjlkasfklasfjklasfjklafds  fjsadlkfjalsdfk asflkjaslkdfjasl",
                  ),
                  NotesCard(
                    title: "Things to do",
                    description:
                        "sdrfsdfa lorem23 kjfklasdf fslkadfjakalksdkjfklasdf fslkadfjakalksdfasfklasflkasfjlkasfklasfjklafdsfasfklasflkasfjlkasfklasfjklasfjklafds  fjsadlkfjalsdfk asflkjaslkdfjasl",
                  ),
                ],
              ),
            ),
            Text("Diary",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  NotesCard(
                    title: "Things to do fsdff fsdfasd sadfasdf",
                    description: "sdrfsdfa",
                  ),
                  NotesCard(
                    title: "Things to do",
                    description:
                        "sdrfsdfa lorem23 kjfklasdf fslkadfjakalksdkjfklasdf fslkadfjakalksdfasfklasflkasfjlkasfklasfjklafdsfasfklasflkasfjlkasfklasfjklasfjklafds  fjsadlkfjalsdfk asflkjaslkdfjasl",
                  ),
                  NotesCard(
                    title: "Things to do",
                    description:
                        "sdrfsdfa lorem23 kjfklasdf fslkadfjakalksdkjfklasdf fslkadfjakalksdfasfklasflkasfjlkasfklasfjklafdsfasfklasflkasfjlkasfklasfjklasfjklafds  fjsadlkfjalsdfk asflkjaslkdfjasl",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

