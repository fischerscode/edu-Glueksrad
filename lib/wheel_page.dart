import 'package:flutter/material.dart';
import 'package:glueksrad/wheel/wheel_config.dart';
import 'package:glueksrad/wheel/wheel_of_fortune.dart';

import 'wheel_edit_page.dart';

class WheelPage extends StatefulWidget {
  const WheelPage({super.key, required this.config, this.onEdited});

  final WheelConfig config;
  final Function(WheelConfig config)? onEdited;

  @override
  State<WheelPage> createState() => _WheelPageState();
}

class _WheelPageState extends State<WheelPage> {
  final List<int> results = [];

  late WheelConfig config;

  @override
  void initState() {
    config = widget.config;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant WheelPage oldWidget) {
    if (oldWidget.config != widget.config) {
      config = widget.config;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    // final config = WheelConfig(
    //   spinDuration: const Duration(milliseconds: 200),
    //   events: [
    //     Event(name: '😊', color: Colors.red),
    //     Event(name: 'Event 2', color: Colors.green),
    //     Event(name: 'Event 3', color: Colors.blue),
    //   ],
    //   sections: [
    //     Section(eventId: 0, size: 1),
    //     Section(eventId: 1, size: 2),
    //     Section(eventId: 2, size: 3),
    //   ],
    // );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Glücksrad'),
        actions: [
          if (widget.onEdited != null)
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () async {
                final result = await Navigator.push<WheelConfig>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WheelEditPage(config: config),
                  ),
                );
                if (result != null) {
                  widget.onEdited?.call(result);
                  if (mounted) {
                    setState(() {
                      config = result;
                      results.clear();
                    });
                  } else {
                    config = result;
                    results.clear();
                  }
                }
              },
            ),
        ],
      ),
      body: Row(
        children: [
          IntrinsicWidth(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (int i = 0; i < config.events.length; i++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${config.events[i].name}: ',
                        style: TextStyle(
                          color: config.events[i].color,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '${results.where((eventId) => eventId == i).length}',
                        style: TextStyle(
                          color: config.events[i].color,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: SizedBox(
                width: 300,
                height: 300,
                // child: WheelPaint(
                //   config: config,
                //   angle: 1,
                //   onSectionPressed: (section) {
                //     print(config.events[config.sections[section].eventId].name);
                //   },
                // ),
                child: WheelOfFortune(
                  config: config,
                  onResult: (event, eventId, section) {
                    setState(() {
                      results.add(eventId);
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
