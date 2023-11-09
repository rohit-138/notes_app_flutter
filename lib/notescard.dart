import 'package:flutter/material.dart';
import './utils/utility.dart';

class NotesCard extends StatelessWidget {
  final String title;
  final String description;
  final String? updatedAt;
  const NotesCard(
      {required this.title,
      required this.description,
      required this.updatedAt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 200,
        width: 150,
        child: Card(
          clipBehavior: Clip.hardEdge,
          elevation: 8.0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      description,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Utility.timeRemainingWidget(updatedAt)
            ],
          ),
        ),
      ),
    );
  }
}
