import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/Custom/CustomAlignbutton.dart';
import 'package:notes_app/Custom/CustomChipButton.dart';
import 'package:notes_app/Custom/CustomRadioButton.dart';
import 'package:notes_app/Custom/fontOption.dart';
import 'package:notes_app/controller/TextController.dart';
import 'package:http/http.dart' as http;
import 'utils/utility.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  DateTime today = DateTime.now();
  String title = '';
  String description = '';
  Color selectedColor = Colors.blue;
  FontWeight selectedFontWeight = FontWeight.normal;
  FontStyle selectedFontStyle = FontStyle.normal;
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
  bool isLoading = false;

  final TextController controller = Get.put(TextController());

  Future<void> createPost(String title, String description) async {
    String apiUrl = 'https://notesapp-i6yf.onrender.com/user/createNotes';
    Map<String, dynamic> data = {
      'title': title,
      'description': description,
      'isFalse': "false",
      "attachment": []
    };
    String jsonBody = json.encode(data);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    try {
      setState(() {
        isLoading = true;
      });
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonBody,
      );
      if (response.statusCode == 200) {
        setState(() {
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        print(
            'Failed to make POST request. Status code: ${response.statusCode}');
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print('Error making POST request: $error');
    }
  }

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
                        ? Obx(() {
                            return Container(
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
                                          min: 16.0,
                                          max: 40.0,
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
                                  Wrap(
                                    spacing: 5,
                                    runSpacing: 5,
                                    children: [
                                      FontOptionChip(
                                          value: FontOption.regular,
                                          groupValue: controller.getFontOption,
                                          onChanged: (value) {
                                            controller.setFontOption(
                                                FontOption.regular);
                                          },
                                          fontWeight: FontWeight.normal,
                                          fontStyle: FontStyle.normal),
                                      FontOptionChip(
                                          value: FontOption.italic,
                                          groupValue: controller.getFontOption,
                                          onChanged: (value) {
                                            controller.setFontOption(
                                                FontOption.italic);
                                          },
                                          fontWeight: FontWeight.normal,
                                          fontStyle: FontStyle.italic),
                                      FontOptionChip(
                                          value: FontOption.bold,
                                          groupValue: controller.getFontOption,
                                          onChanged: (value) {
                                            controller
                                                .setFontOption(FontOption.bold);
                                          },
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal),

                                      // const SizedBox(
                                      //   width: 10,
                                      // ),

                                      CustomAlignButton(
                                        value: TextAlign.left,
                                        groupValue:
                                            controller.getTitleAlignment,
                                        onChanged: (value) {
                                          controller.setTitleAlignment(
                                              TextAlign.left);
                                        },
                                        icondata: Icon(Icons.format_align_left),
                                      ),
                                      CustomAlignButton(
                                        value: TextAlign.center,
                                        groupValue:
                                            controller.getTitleAlignment,
                                        onChanged: (value) {
                                          controller.setTitleAlignment(
                                              TextAlign.center);
                                        },
                                        icondata:
                                            Icon(Icons.format_align_center),
                                      ),
                                      CustomAlignButton(
                                        value: TextAlign.right,
                                        groupValue:
                                            controller.getTitleAlignment,
                                        onChanged: (value) {
                                          controller.setTitleAlignment(
                                              TextAlign.right);
                                        },
                                        icondata:
                                            Icon(Icons.format_align_right),
                                      ),
                                    ],
                                  ),
                                  Wrap(
                                    spacing: 16.0, // Space between children
                                    runSpacing: 8.0, // Space between lines
                                    children: [
                                      CustomChipButton(
                                          value: 'Default',
                                          groupValue: controller
                                              .getTextStyle.fontFamily,
                                          fontFamily: 'Default',
                                          onChanged: (value) {
                                            controller.setTextStyle(
                                                fontFamily: value,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle: FontStyle.normal);
                                          }),
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
                                          value: 'fantasy',
                                          groupValue: controller
                                              .getTextStyle.fontFamily,
                                          fontFamily: 'Fantasy',
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

                                      //
                                    ],
                                  )
                                ],
                              ),
                            );
                          })
                        : Obx(() {
                            return Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CustomRadioButton(
                                        color: Colors.red,
                                        value: Colors.red,
                                        groupValue: controller
                                            .getTextDescriptionStyle.color,
                                        onChanged: (value) {
                                          controller.setTextDescriptionStyle(
                                              color: Colors.red);
                                        },
                                      ),
                                      CustomRadioButton(
                                        color: Colors.blue,
                                        value: Colors.blue,
                                        groupValue: controller
                                            .getTextDescriptionStyle.color,
                                        onChanged: (value) {
                                          controller.setTextDescriptionStyle(
                                              color: Colors.blue);
                                        },
                                      ),
                                      CustomRadioButton(
                                        color: Colors.purple,
                                        value: Colors.purple,
                                        groupValue: controller
                                            .getTextDescriptionStyle.color,
                                        onChanged: (value) {
                                          controller.setTextDescriptionStyle(
                                              color: Colors.purple);
                                        },
                                      ),
                                      CustomRadioButton(
                                        color: Colors.black,
                                        value: Colors.black,
                                        groupValue: controller
                                            .getTextDescriptionStyle.color,
                                        onChanged: (value) {
                                          controller.setTextDescriptionStyle(
                                              color: Colors.black);
                                        },
                                      ),
                                      CustomRadioButton(
                                        color: Colors.white,
                                        value: Colors.white,
                                        groupValue: controller
                                            .getTextDescriptionStyle.color,
                                        onChanged: (value) {
                                          controller.setTextDescriptionStyle(
                                              color: Colors.white);
                                          controller.update();
                                        },
                                      ),
                                      CustomRadioButton(
                                        color: Colors.yellow,
                                        value: Colors.yellow,
                                        groupValue: controller
                                            .getTextDescriptionStyle.color,
                                        onChanged: (value) {
                                          controller.setTextDescriptionStyle(
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
                                                  .getTextDescriptionStyle
                                                  .fontSize ??
                                              20.0,
                                          min: 16.0,
                                          max: 40.0,
                                          onChanged: (value) {
                                            controller.setTextDescriptionStyle(
                                                fontSize: value.ceilToDouble());
                                          },
                                        ),
                                      ),
                                      // Spacer(),
                                      Center(
                                        child: Text(
                                            "${controller.getTextDescriptionStyle.fontSize?.ceil()}"),
                                      )
                                    ],
                                  ),
                                  Wrap(
                                    spacing: 5,
                                    runSpacing: 5,
                                    children: [
                                      FontOptionChip(
                                          value: FontOption.regular,
                                          groupValue:
                                              controller.getDescFontOption,
                                          onChanged: (value) {
                                            controller.setDescFontOption(
                                                FontOption.regular);
                                          },
                                          fontWeight: FontWeight.normal,
                                          fontStyle: FontStyle.normal),
                                      FontOptionChip(
                                          value: FontOption.italic,
                                          groupValue:
                                              controller.getDescFontOption,
                                          onChanged: (value) {
                                            controller.setDescFontOption(
                                                FontOption.italic);
                                          },
                                          fontWeight: FontWeight.normal,
                                          fontStyle: FontStyle.italic),
                                      FontOptionChip(
                                          value: FontOption.bold,
                                          groupValue:
                                              controller.getDescFontOption,
                                          onChanged: (value) {
                                            controller.setDescFontOption(
                                                FontOption.bold);
                                          },
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal),

                                      // const SizedBox(
                                      //   width: 10,
                                      // ),

                                      CustomAlignButton(
                                        value: TextAlign.left,
                                        groupValue:
                                            controller.getDescriptionAlignment,
                                        onChanged: (value) {
                                          controller.setDescriptionAlignment(
                                              TextAlign.left);
                                        },
                                        icondata: Icon(Icons.format_align_left),
                                      ),
                                      CustomAlignButton(
                                        value: TextAlign.center,
                                        groupValue:
                                            controller.getDescriptionAlignment,
                                        onChanged: (value) {
                                          controller.setDescriptionAlignment(
                                              TextAlign.center);
                                        },
                                        icondata:
                                            Icon(Icons.format_align_center),
                                      ),
                                      CustomAlignButton(
                                        value: TextAlign.right,
                                        groupValue:
                                            controller.getDescriptionAlignment,
                                        onChanged: (value) {
                                          controller.setDescriptionAlignment(
                                              TextAlign.right);
                                        },
                                        icondata: const Icon(
                                            Icons.format_align_right),
                                      ),
                                    ],
                                  ),
                                  Wrap(
                                    spacing: 16.0, // Space between children
                                    runSpacing: 8.0, // Space between lines
                                    children: [
                                      CustomChipButton(
                                          value: 'Default',
                                          groupValue: controller
                                              .getTextDescriptionStyle
                                              .fontFamily,
                                          fontFamily: 'Default',
                                          onChanged: (value) {
                                            controller.setTextDescriptionStyle(
                                                fontFamily: value,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle: FontStyle.normal);
                                          }),
                                      CustomChipButton(
                                          value: 'serif',
                                          groupValue: controller
                                              .getTextDescriptionStyle
                                              .fontFamily,
                                          fontFamily: 'Serif',
                                          onChanged: (value) {
                                            controller.setTextDescriptionStyle(
                                                fontFamily: value);
                                          }),
                                      CustomChipButton(
                                          value: 'monospace',
                                          groupValue: controller
                                              .getTextDescriptionStyle
                                              .fontFamily,
                                          fontFamily: 'monospace',
                                          onChanged: (value) {
                                            controller.setTextDescriptionStyle(
                                                fontFamily: value);
                                          }),
                                      CustomChipButton(
                                          value: 'fantasy',
                                          groupValue: controller
                                              .getTextDescriptionStyle
                                              .fontFamily,
                                          fontFamily: 'Fantasy',
                                          onChanged: (value) {
                                            controller.setTextDescriptionStyle(
                                                fontFamily: value);
                                          }),
                                      CustomChipButton(
                                          value: 'sans-serif',
                                          groupValue: controller
                                              .getTextDescriptionStyle
                                              .fontFamily,
                                          fontFamily: 'Sans-Serif',
                                          onChanged: (value) {
                                            controller.setTextDescriptionStyle(
                                                fontFamily: value);
                                          }),
                                      CustomChipButton(
                                          value: 'cursive',
                                          groupValue: controller
                                              .getTextDescriptionStyle
                                              .fontFamily,
                                          fontFamily: 'Cursive',
                                          onChanged: (value) {
                                            controller.setTextDescriptionStyle(
                                                fontFamily: value);
                                          }),

                                      //
                                    ],
                                  )
                                ],
                              ),
                            );
                          }))
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
    return Container(
      // clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  ' ${Utility.getCurrentDate()}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                isLoading
                    ? CircularProgressIndicator()
                    : IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          // Call postData when the icon is pressed
                          createPost(
                              titleController.text, descriptionController.text);
                        },
                      ),
                // IconButton(onPressed: () {}, icon: const Icon(Icons.done))
              ],
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
                textAlign: controller.getTitleAlignment,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter Title',
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
                style: controller.getTextDescriptionStyle,
                textAlign: controller.getDescriptionAlignment,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter Description',
                  fillColor: Colors.transparent,
                  filled: true,
                  // contentPadding: EdgeInsets.all(10.0),
                ),
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
              ),
            ),
            
            
            const SizedBox(height: 16),
            FloatingActionButton(
              clipBehavior: Clip.antiAlias,
              onPressed: _showCustomizationOptions,
              child: const Icon(Icons.palette),
            ),
          ],
        ),
      ),
    );
  }
}





