import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utility {
  static calculateTimeDifference(String inputTime) {
    DateTime inputDateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
        .parse(inputTime, true)
        .toLocal();
    DateTime currentDateTime = DateTime.now();

    Duration difference = currentDateTime.difference(inputDateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else {
      return 'Just now';
    }
  }

  static timeRemainingWidget(String? inputTime) {
    if (inputTime == null) return Container();
    return Container(
      height: 30, // Height of the bottom container
      color: Colors.deepPurpleAccent,
      child: Center(
          child: Text(
        calculateTimeDifference(inputTime),
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}
