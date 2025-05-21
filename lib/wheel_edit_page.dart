import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:glueksrad/wheel/wheel_config.dart';
import 'package:glueksrad/wheel/wheel_of_fortune.dart';

class WheelEditPage extends StatefulWidget {
  const WheelEditPage({super.key, required this.config});

  final WheelConfig config;

  @override
  State<WheelEditPage> createState() => _WheelEditPageState();
}

class _WheelEditPageState extends State<WheelEditPage> {
  var _builder = ConfigBuilder();
  int? _selectedSection;

  final nameEditingController = TextEditingController();

  @override
  void initState() {
    _builder = ConfigBuilder(widget.config);
    super.initState();
  }

  @override
  void didUpdateWidget(WheelEditPage oldWidget) {
    if (oldWidget.config != widget.config) {
      _builder = ConfigBuilder(widget.config);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Glücksrad bearbeiten'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Änderungen speichern?'),
                content: const Text('Möchtest du die Änderungen speichern?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: const Text('Nicht speichern'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context, _builder.build());
                    },
                    child: const Text('Speichern'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Abbrechen'),
                  ),
                ],
              ),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              Navigator.pop(context, _builder.build());
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox.square(
                    dimension: 300,
                    child: WheelPaint(
                      selectedSection: _selectedSection,
                      config: _builder.build(),
                      angle: 0,
                      onSectionPressed: (section) {
                        setState(() {
                          _selectedSection = section;
                          nameEditingController.text = _builder.getSectionName(
                            section,
                          );
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          _builder.addSection();
                        });
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Neuer Bereich'),
                    ),
                  ),
                ],
              ),

              AnimatedSize(
                duration: const Duration(milliseconds: 200),
                child: _selectedSection != null
                    ? IntrinsicWidth(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ConstrainedBox(
                              constraints: const BoxConstraints(minWidth: 100),
                              child: TextField(
                                controller: nameEditingController,
                                decoration: const InputDecoration(
                                  hintText: 'Name',
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _builder.setSectionName(
                                      _selectedSection!,
                                      value,
                                    );
                                  });
                                },
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 16),
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      content: SingleChildScrollView(
                                        child: Wrap(
                                          spacing: 8,
                                          runSpacing: 8,
                                          children: Colors.primaries.map((
                                            paletteColor,
                                          ) {
                                            return GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _builder.setSectionColor(
                                                    _selectedSection!,
                                                    paletteColor,
                                                  );
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                width: 36,
                                                height: 36,
                                                decoration: BoxDecoration(
                                                  color: paletteColor,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color:
                                                        paletteColor ==
                                                            _builder.getSectionColor(
                                                              _selectedSection!,
                                                            )
                                                        ? Colors.black
                                                        : Colors.transparent,
                                                    width: 2,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text('Abbrechen'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    color: _builder.getSectionColor(
                                      _selectedSection!,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed:
                                        _selectedSection != null &&
                                            _builder
                                                    ._sections[_selectedSection!]
                                                    .size >
                                                1
                                        ? () {
                                            setState(() {
                                              int currentSize = _builder
                                                  ._sections[_selectedSection!]
                                                  .size;
                                              _builder.setSectionSize(
                                                _selectedSection!,
                                                currentSize - 1,
                                              );
                                            });
                                          }
                                        : null,
                                  ),
                                  Text(
                                    'Größe: ${_builder._sections[_selectedSection!].size}',
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: _selectedSection != null
                                        ? () {
                                            setState(() {
                                              int currentSize = _builder
                                                  ._sections[_selectedSection!]
                                                  .size;
                                              _builder.setSectionSize(
                                                _selectedSection!,
                                                currentSize + 1,
                                              );
                                            });
                                          }
                                        : null,
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: ElevatedButton.icon(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    _builder.removeSection(_selectedSection!);
                                    _selectedSection = null;
                                  });
                                },
                                label: const Text('Entfernen'),
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  dispose() {
    nameEditingController.dispose();
    super.dispose();
  }
}

class _Section {
  int size;
  Color color;
  String name;

  _Section({required this.size, required this.color, required this.name});
}

class ConfigBuilder {
  final List<_Section> _sections = [];
  late Duration _spinDuration;

  ConfigBuilder([WheelConfig? config]) {
    if (config != null) {
      _sections.addAll(
        config.sections
            .map(
              (section) => _Section(
                size: section.size,
                color: config.events[section.eventId].color,
                name: config.events[section.eventId].name,
              ),
            )
            .toList(),
      );
      _spinDuration = config.spinDuration;
    } else {
      _spinDuration = const Duration(seconds: 5);
    }
  }

  void addSection() {
    _sections.add(
      _Section(
        size: max(_sections.fold(0, (p, s) => p + s.size), 4) ~/ 4,
        color: Colors.primaries[_sections.length % Colors.primaries.length],
        name: '${_sections.length + 1}',
      ),
    );
  }

  void removeSection(int index) {
    if (_sections.length > 1) {
      _sections.removeAt(index);
    }
  }

  void setSectionSize(int index, int size) {
    if (_sections.length > 1) {
      _sections[index].size = size;
    }
  }

  void setSectionColor(int index, Color color) {
    if (_sections.length > 1) {
      _sections[index].color = color;
    }
  }

  void setSectionName(int index, String name) {
    if (_sections.length > 1) {
      _sections[index].name = name;
    }
  }

  void setSpinDuration(Duration duration) {
    _spinDuration = duration;
  }

  WheelConfig build() {
    final events = _sections
        .map((section) => Event(name: section.name, color: section.color))
        .toSet()
        .toList();

    final config = WheelConfig(
      events: events,
      sections: _sections
          .map(
            (e) => Section(
              eventId: events.indexOf(Event(name: e.name, color: e.color)),
              size: e.size,
            ),
          )
          .toList(),
      spinDuration: _spinDuration,
    );

    assert(
      config.sections.every((s) => s.size > 0),
      'All sections must have a size greater than 0',
    );
    assert(
      config.sections.every((s) => s.eventId >= 0 && s.eventId < events.length),
      'All sections must have a valid eventId',
    );

    return config;
  }

  String getSectionName(int section) {
    return _sections[section].name;
  }

  Color getSectionColor(int section) {
    return _sections[section].color;
  }
}
