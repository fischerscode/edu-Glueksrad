import 'dart:math';

import 'package:flutter/material.dart';
import 'package:glueksrad/utils/maybe_hero.dart';
import 'package:glueksrad/wheel/wheel_config.dart';
import 'package:glueksrad/wheel/wheel_of_fortune.dart';

import 'wheel_edit_page.dart';

class WheelPage extends StatefulWidget {
  const WheelPage({
    super.key,
    required this.config,
    this.onEdited,
    this.initResults = const [],
    this.saveResults,
    this.heroTag,
  });

  final WheelConfig config;
  final Function(WheelConfig config)? onEdited;
  final List<int> initResults;
  final Function(List<int> results)? saveResults;
  final String? heroTag;

  @override
  State<WheelPage> createState() => _WheelPageState();
}

class _WheelPageState extends State<WheelPage> {
  List<int> results = [];

  late WheelConfig config;
  final Random _random = Random();

  @override
  void initState() {
    config = widget.config;
    results = widget.initResults.toList();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant WheelPage oldWidget) {
    if (oldWidget.config != widget.config) {
      config = widget.config;
      results = widget.initResults.toList();
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
        title: const Text('Glücksrad drehen'),
        actions: [
          if (widget.onEdited != null)
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () async {
                final result = await Navigator.push<WheelConfig>(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        WheelEditPage(heroTag: widget.heroTag, config: config),
                  ),
                );
                if (result != null) {
                  widget.onEdited?.call(result);
                  if (mounted) {
                    setState(() {
                      config = result;
                      results.clear();
                      widget.saveResults?.call(results);
                    });
                  } else {
                    config = result;
                    results.clear();
                    widget.saveResults?.call(results);
                  }
                }
              },
            ),
        ],
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IntrinsicWidth(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
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
                      IconButton(
                        onPressed: () {
                          setState(() {
                            results.clear();
                            widget.saveResults?.call(results);
                          });
                        },
                        icon: Icon(Icons.restart_alt_rounded),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: 300,
                height: 300,
                // child: WheelPaint(
                //   config: config,
                //   angle: 1,
                //   onSectionPressed: (section) {
                //     // print(config.events[config.sections[section].eventId].name);
                //   },
                // ),
                child: maybeHero(
                  heroTag: widget.heroTag,
                  child: WheelOfFortune(
                    config: config,
                    onResult: (event, eventId, section) {
                      if (mounted) {
                        setState(() {
                          results.add(eventId);
                          widget.saveResults?.call(results);
                        });
                      } else {
                        results.add(eventId);
                        widget.saveResults?.call(results);
                      }
                    },
                    randomModifier: () {
                      final totalSize = config.totalSize;
                      final eventSections = config.events
                          .map(((e) => <({double start, double end})>[]))
                          .toList();
                      var start = 0.0;
                      for (final section in config.sections) {
                        final sectionSize = section.size / totalSize;
                        eventSections[section.eventId].add((
                          start: start,
                          end: start + sectionSize,
                        ));
                        start += sectionSize;
                      }

                      final propabilities = eventSections
                          .map(
                            (sections) => sections
                                .map((section) => section.end - section.start)
                                .reduce((a, b) => a + b),
                          )
                          .toList();

                      final totalSpins = results.length;
                      final expected = propabilities
                          .map((e) => e * totalSpins)
                          .toList();
                      final actual = List.generate(
                        expected.length,
                        (index) => results.where((r) => r == index).length,
                      );

                      // print('Expected: $expected');
                      // print('Actual: $actual');

                      // final tooFew = expected.indexed
                      //     .where(
                      //       (expection) => expection.$2 - actual[expection.$1] >= 1,
                      //     )
                      //     .map((e) => e.$1)
                      //     .toList();
                      final tooFew = expected.indexed
                          .where(
                            (expection) =>
                                expection.$2 - actual[expection.$1] >=
                                0.7, // too few
                          )
                          .map((e) => e.$1)
                          .toList();
                      final notTooMany = expected.indexed
                          .where(
                            (expection) =>
                                actual[expection.$1] - expection.$2 <=
                                1.5, // not too many
                          )
                          .map((e) => e.$1)
                          .toList();
                      final candidates = [...tooFew, ...tooFew, ...notTooMany];
                      if (candidates.isNotEmpty) {
                        // print('Too few: $tooFew');
                        // print('Candidates: $candidates');
                        final candidatesTotalAngle = candidates
                            .map(
                              (e) => eventSections[e]
                                  .map((section) => section.end - section.start)
                                  .reduce((a, b) => a + b),
                            )
                            .reduce((a, b) => a + b);

                        var forceAngle =
                            _random.nextDouble() * candidatesTotalAngle;
                        int? force;
                        for (int i = 0; i < candidates.length; i++) {
                          final candidateAngle = eventSections[candidates[i]]
                              .map((section) => section.end - section.start)
                              .reduce((a, b) => a + b);
                          if (forceAngle <= candidateAngle) {
                            force = candidates[i];
                            break;
                          }
                          forceAngle -= candidateAngle;
                        }
                        // print('Force: $force');
                        force ??= candidates[0];

                        final targetSection =
                            eventSections[force][_random.nextInt(
                              eventSections[force].length,
                            )];
                        // print('targetSection: $targetSection');
                        final targetAngle =
                            -(targetSection.start +
                                (targetSection.end - targetSection.start) *
                                    _random.nextDouble()) +
                            3;
                        // print('targetAngle: $targetAngle');
                        return targetAngle;
                      } else {
                        return Random().nextDouble() + 2;
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
