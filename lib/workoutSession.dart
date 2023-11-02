import 'package:flutter/material.dart';

class WorkoutSession extends StatefulWidget {
  final String timeAndDate;
  final String place;
  final String description;
  final int numberOfPeople;
  final bool isOwner;

  WorkoutSession({
    required this.timeAndDate,
    required this.place,
    required this.description,
    required this.numberOfPeople,
    required this.isOwner,
  });

  @override
  _WorkoutSessionState createState() => _WorkoutSessionState();
}

class _WorkoutSessionState extends State<WorkoutSession> {
  String buttonText = "Join";

  void _onJoinButtonPressed() {
    setState(() {
      buttonText = buttonText == "Join" ? "Waiting response" : "Join";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 400,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[100] ?? Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.access_time, color: Colors.deepOrange),
                SizedBox(width: 10),
                Text(widget.timeAndDate),
              ],
            ),
            Row(
              children: <Widget>[
                Icon(Icons.place, color: Colors.deepOrange),
                SizedBox(width: 10),
                Text(widget.place),
              ],
            ),
            Row(
              children: <Widget>[
                Icon(Icons.description, color: Colors.deepOrange),
                SizedBox(width: 10),
                Text(widget.description),
              ],
            ),
            if (widget.isOwner)
              Row(
                children: <Widget>[
                  Icon(Icons.people, color: Colors.deepOrange),
                  SizedBox(width: 10),
                  Text(widget.numberOfPeople.toString()),
                ],
              ),
            TextButton(
              onPressed: _onJoinButtonPressed,
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }
}
