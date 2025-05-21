import 'package:flutter/material.dart';
import 'package:glueksrad/wheel/wheel_config.dart';
import 'package:glueksrad/wheel/wheel_of_fortune.dart';

class WheelPage extends StatelessWidget {
  const WheelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: WheelOfFortune(
            config: WheelConfig(
              events: [
                Event(name: 'Event 1', color: Colors.red),
                Event(name: 'Event 2', color: Colors.green),
                Event(name: 'Event 3', color: Colors.blue),
              ],
              sections: [
                Section(eventId: 0, size: 1),
                Section(eventId: 1, size: 2),
                Section(eventId: 2, size: 3),
              ],
            ),
            onResult: (event, section) {
              print('Selected event: ${event.name}, section: $section');
            },
          ),
        ),
      ),
    );
  }
}
