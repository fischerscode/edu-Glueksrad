import 'dart:async';
import 'dart:convert';

import 'package:download/download.dart';
import 'package:flutter/material.dart';
import 'package:glueksrad/wheel/wheel_of_fortune.dart';
import 'package:glueksrad/wheel_edit_page.dart';
import 'package:http/http.dart' as http;

import 'wheel/page_config.dart';
import 'wheel/wheel_config.dart';
import 'wheel_page.dart';

const initSpinDuration = Duration(seconds: 3);

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final bool isTeacher;
  PageConfig? __pageConfig;
  final List<List<int>> wheelResults = [];
  final List<WheelConfig> customWheels = [];
  final List<List<int>> customWheelsResults = [];
  Object? error;

  PageConfig? get _pageConfig => __pageConfig;
  set _pageConfig(PageConfig? value) {
    if (mounted) {
      setState(() {
        __pageConfig = value;
      });
    } else {
      __pageConfig = value;
    }
  }

  @override
  void initState() {
    final fragmentParams = Uri.base.fragment.isNotEmpty
        ? Uri.splitQueryString(Uri.base.fragment)
        : <String, String>{};
    isTeacher = fragmentParams['teacher'] == 'true';
    final initConfig = fragmentParams['config'];

    if (initConfig != null) {
      http.get(Uri.parse(initConfig)).then((response) {
        if (response.statusCode == 200) {
          final config = PageConfig.fromJson(jsonDecode(response.body));
          _pageConfig = config;
        } else {
          error = 'Failed to load config';
        }
      });
    } else {
      final config = PageConfig(wheels: [], allowCustomWheels: true);
      _pageConfig = config;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Glücksrad${isTeacher ? ' (Lehrer)' : ''}'),
        actions: [
          if (isTeacher)
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                download(
                  Stream.fromIterable(utf8.encode(jsonEncode(_pageConfig))),
                  'glueksrad.json',
                );
              },
            ),
        ],
      ),
      body: SafeArea(
        child: Builder(
          builder: (context) {
            final data = _pageConfig;
            if (error != null) {
              return Center(
                child: Text(
                  'Error: $error',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else if (data != null) {
              return ListView(
                children: [
                  Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      for (int i = 0; i < data.wheels.length; i++)
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WheelPage(
                                  config: data.wheels[i],
                                  onEdited: isTeacher
                                      ? (config) {
                                          _pageConfig = data.copyWith(
                                            wheels: data.wheels.toList()
                                              ..[i] = config,
                                          );
                                        }
                                      : null,
                                  initResults: wheelResults[i],
                                  saveResults: (results) {
                                    wheelResults[i] = results.toList();
                                  },
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox.square(
                              dimension: 200,
                              child: WheelPaint(
                                config: data.wheels[i],
                                angle: 0,
                              ),
                            ),
                          ),
                        ),
                      if (isTeacher)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FloatingActionButton(
                            onPressed: () async {
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WheelEditPage(
                                    config: WheelConfig(
                                      events: [],
                                      sections: [],
                                      spinDuration: initSpinDuration,
                                    ),
                                  ),
                                ),
                              );
                              if (result != null) {
                                _pageConfig = data.copyWith(
                                  wheels: [...data.wheels, result],
                                );
                                wheelResults.add([]);
                              }
                            },
                            child: Icon(Icons.add),
                          ),
                        ),
                    ],
                  ),
                  if (isTeacher)
                    SwitchListTile(
                      title: const Text('Eigene Glücksräder erlauben'),
                      value: data.allowCustomWheels,
                      onChanged: (bool value) {
                        final config = PageConfig(
                          wheels: data.wheels,
                          allowCustomWheels: value,
                        );
                        _pageConfig = config;
                      },
                    ),
                  if (!isTeacher && data.allowCustomWheels)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Eigene Glücksräder',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  if (!isTeacher && data.allowCustomWheels)
                    Wrap(
                      alignment: WrapAlignment.spaceEvenly,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        for (int i = 0; i < customWheels.length; i++)
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WheelPage(
                                    config: customWheels[i],
                                    onEdited: (config) {
                                      setState(() {
                                        customWheels[i] = config;
                                      });
                                    },
                                    initResults: customWheelsResults[i],
                                    saveResults: (results) {
                                      customWheelsResults[i] = results.toList();
                                    },
                                  ),
                                ),
                              );
                            },
                            child: SizedBox.square(
                              dimension: 150,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: WheelPaint(
                                  config: customWheels[i],
                                  angle: 0,
                                ),
                              ),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FloatingActionButton(
                            child: const Icon(Icons.add),
                            onPressed: () async {
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WheelEditPage(
                                    config: WheelConfig(
                                      events: [],
                                      sections: [],
                                      spinDuration: initSpinDuration,
                                    ),
                                  ),
                                ),
                              );

                              if (result != null) {
                                setState(() {
                                  customWheels.add(result);
                                  customWheelsResults.add([]);
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
