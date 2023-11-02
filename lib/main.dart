import 'package:flutter/material.dart';
import 'workoutSession.dart';

void main() => runApp(const GymBuddyApp());

class GymBuddyApp extends StatefulWidget {
  const GymBuddyApp({Key? key}) : super(key: key);

  @override
  _GymBuddyAppState createState() => _GymBuddyAppState();
}

class _GymBuddyAppState extends State<GymBuddyApp> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    WorkoutSession(
      timeAndDate: '13-10-2023, 4pm - 6pm',
      place: 'Cityfitness, Wairua branch',
      description: 'Leg day, meet at the front door',
      numberOfPeople: 3,
      isOwner: true,
    ),
    const Text(
      'Me',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Gym buddy',
        home: Scaffold(
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.fitness_center),
                label: 'Workout',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Me',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
          ),
        ));
  }
}
