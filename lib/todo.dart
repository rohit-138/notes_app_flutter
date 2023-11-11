import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/Custom/CustomRadioButton.dart';
import 'package:notes_app/controller/TextController.dart';
import 'package:notes_app/utils/utility.dart';

import 'Custom/CustomChipButton.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  @override
  Widget build(BuildContext context) {
    return const MyCustomWidget();
  }
}

class MyCustomWidget extends StatefulWidget {
  const MyCustomWidget({super.key});

  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  DateTime today = DateTime.now();
  String title = '';
  String description = '';
  Color selectedColorDescription = Colors.blue;
  double fontSizeTitle = 16.0; // Default font size
  double fontSizeDescription = 16.0;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool editTitle = true; // Indicates whether to edit title or description
  double fontsize = 16.0;
  int currentTextField = 1;
  int? selectedValue = 1;

  final TextController controller = Get.put(TextController());

  void _showCustomizationOptions() {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.expand_more,
                        size: 50.0,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Text(
                      "Fonts",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
                    ),
                    (currentTextField == 1
                        ? Obx(() => Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CustomRadioButton(
                                        color: Colors.red,
                                        value: Colors.red,
                                        groupValue:
                                            controller.getTextStyle.color,
                                        onChanged: (value) {
                                          controller.setTextStyle(
                                              color: Colors.red);
                                        },
                                      ),
                                      CustomRadioButton(
                                        color: Colors.blue,
                                        value: Colors.blue,
                                        groupValue:
                                            controller.getTextStyle.color,
                                        onChanged: (value) {
                                          controller.setTextStyle(
                                              color: Colors.blue);
                                        },
                                      ),
                                      CustomRadioButton(
                                        color: Colors.purple,
                                        value: Colors.purple,
                                        groupValue:
                                            controller.getTextStyle.color,
                                        onChanged: (value) {
                                          controller.setTextStyle(
                                              color: Colors.purple);
                                        },
                                      ),
                                      CustomRadioButton(
                                        color: Colors.black,
                                        value: Colors.black,
                                        groupValue:
                                            controller.getTextStyle.color,
                                        onChanged: (value) {
                                          controller.setTextStyle(
                                              color: Colors.black);
                                        },
                                      ),
                                      CustomRadioButton(
                                        color: Colors.white,
                                        value: Colors.white,
                                        groupValue:
                                            controller.getTextStyle.color,
                                        onChanged: (value) {
                                          controller.setTextStyle(
                                              color: Colors.white);
                                          controller.update();
                                        },
                                      ),
                                      CustomRadioButton(
                                        color: Colors.yellow,
                                        value: Colors.yellow,
                                        groupValue:
                                            controller.getTextStyle.color,
                                        onChanged: (value) {
                                          controller.setTextStyle(
                                              color: Colors.yellow);
                                          controller.update();
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Container(
                                        width: 300,
                                        child: Slider(
                                          value: controller
                                                  .getTextStyle.fontSize ??
                                              20.0,
                                          min: 20.0,
                                          max: 65.0,
                                          onChanged: (value) {
                                            controller.setTextStyle(
                                                fontSize: value.ceilToDouble());
                                          },
                                        ),
                                      ),
                                      // Spacer(),
                                      Center(
                                        child: Text(
                                            "${controller.getTextStyle.fontSize?.ceil()}"),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            controller.setTextStyle(
                                                fontStyle: FontStyle.italic);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.grey[50],
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          child: const Text(
                                            "Italic",
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic),
                                          )),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            controller.setTextStyle(
                                                // fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.normal);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.grey[50],
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          child: const Text(
                                            "Regular",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontStyle: FontStyle.normal),
                                          )),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            controller.setTextStyle(
                                                fontWeight: FontWeight.bold);
                                            // controller
                                            //     .setFontStyle(FontStyle.normal);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.grey[50],
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          child: const Text(
                                            "bold",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Wrap(
                                    spacing: 16.0, // Space between children
                                    runSpacing: 8.0, // Space between lines
                                    children: [
                                      CustomChipButton(
                                          value: 'serif',
                                          groupValue: controller
                                              .getTextStyle.fontFamily,
                                          fontFamily: 'Serif',
                                          onChanged: (value) {
                                            controller.setTextStyle(
                                                fontFamily: value);
                                          }),
                                      CustomChipButton(
                                          value: 'monospace',
                                          groupValue: controller
                                              .getTextStyle.fontFamily,
                                          fontFamily: 'monospace',
                                          onChanged: (value) {
                                            controller.setTextStyle(
                                                fontFamily: value);
                                          }),
                                      CustomChipButton(
                                          value: 'roboto',
                                          groupValue: controller
                                              .getTextStyle.fontFamily,
                                          fontFamily: 'Roboto',
                                          onChanged: (value) {
                                            controller.setTextStyle(
                                                fontFamily: value);
                                          }),
                                      CustomChipButton(
                                          value: 'sans-serif',
                                          groupValue: controller
                                              .getTextStyle.fontFamily,
                                          fontFamily: 'Sans-Serif',
                                          onChanged: (value) {
                                            controller.setTextStyle(
                                                fontFamily: value);
                                          }),
                                      CustomChipButton(
                                          value: 'cursive',
                                          groupValue: controller
                                              .getTextStyle.fontFamily,
                                          fontFamily: 'Cursive',
                                          onChanged: (value) {
                                            controller.setTextStyle(
                                                fontFamily: value);
                                          }),
                                      CustomChipButton(
                                          value: 'fantasy',
                                          groupValue: controller
                                              .getTextStyle.fontFamily,
                                          fontFamily: 'fantasy',
                                          onChanged: (value) {
                                            controller.setTextStyle(
                                                fontFamily: value);
                                          }),

                                      //
                                    ],
                                  )
                                ],
                              ),
                            ))
                        : const Text("2"))
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ' ${Utility.getCurrentDate()}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Obx(
            () => TextFormField(
              onTap: () {
                setState(() {
                  currentTextField = 1;
                });
              },
              controller: titleController,
              style: controller.getTextStyle,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter text',
                fillColor: Colors.transparent,
                filled: true,
                // contentPadding: EdgeInsets.all(10.0),
              ),
              onChanged: (value) {
                setState(() {
                  title = value;
                });
              },
            ),
          ),
          const SizedBox(height: 16),
          Obx(
            () => TextFormField(
              onTap: () {
                setState(() {
                  currentTextField = 2;
                });
              },
              controller: descriptionController,
              style: controller.getTextStyle,
              decoration: const InputDecoration(
                hintText: 'Enter description',
                labelText: 'Description',
              ),
              onChanged: (value) {
                setState(() {
                  description = value;
                });
              },
            ),
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              Text('Color:'),
              SizedBox(width: 8),
            ],
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            clipBehavior: Clip.hardEdge,
            onPressed: _showCustomizationOptions,
            child: const Icon(Icons.palette),
          ),
        ],
      ),
    );
  }
}
