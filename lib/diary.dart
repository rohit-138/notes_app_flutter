import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controller/Editor.dart';

class Diary extends StatefulWidget {
  const Diary({super.key});

  @override
  State<Diary> createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
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

  final EditorController controller = Get.put(EditorController());

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
                      icon: const Icon(Icons.arrow_downward),
                      onPressed: () {
                        Navigator.pop(context);
                      },
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
                                            controller.gettextTitleColor,
                                        onChanged: (value) {
                                          controller
                                              .settextTitleColor(Colors.red);
                                          // setState(() {
                                          //   selectedColor = value;
                                          //   selectedColorTitle = Colors.red;
                                          // });
                                        },
                                      ),
                                      CustomRadioButton(
                                        color: Colors.blue,
                                        value: Colors.blue,
                                        groupValue:
                                            controller.gettextTitleColor,
                                        onChanged: (value) {
                                          controller
                                              .settextTitleColor(Colors.blue);
                                        },
                                      ),
                                      CustomRadioButton(
                                        color: Colors.purple,
                                        value: Colors.purple,
                                        groupValue:
                                            controller.gettextTitleColor,
                                        onChanged: (value) {
                                          controller
                                              .settextTitleColor(Colors.purple);
                                        },
                                      ),
                                      CustomRadioButton(
                                        color: Colors.black,
                                        value: Colors.black,
                                        groupValue:
                                            controller.gettextTitleColor,
                                        onChanged: (value) {
                                          controller
                                              .settextTitleColor(Colors.black);
                                          controller.update();
                                        },
                                      ),
                                      CustomRadioButton(
                                        color: Colors.white,
                                        value: Colors.white,
                                        groupValue:
                                            controller.gettextTitleColor,
                                        onChanged: (value) {
                                          controller
                                              .settextTitleColor(Colors.white);
                                          controller.update();
                                        },
                                      ),
                                      CustomRadioButton(
                                        color: Colors.yellow,
                                        value: Colors.yellow,
                                        groupValue:
                                            controller.gettextTitleColor,
                                        onChanged: (value) {
                                          controller
                                              .settextTitleColor(Colors.yellow);
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
                                          value: controller.getTitleFontSize,
                                          min: 15.0,
                                          max: 65.0,
                                          onChanged: (value) {
                                            controller.setTitleFontSize(value);
                                          },
                                        ),
                                      ),
                                      // Spacer(),
                                      Center(
                                        child: Text(
                                            "${controller.getTitleFontSize.ceil()}"),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            controller
                                                .setFontStyle(FontStyle.italic);
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
                                            controller
                                                .setFontStyle(FontStyle.normal);
                                            controller.setFontWeight(
                                                FontWeight.normal);
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
                                                fontStyle: FontStyle.normal),
                                          )),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            controller
                                                .setFontWeight(FontWeight.w900);
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
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Today\'s Date: ${today.toLocal()}'.split(' ')[0],
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
              style: TextStyle(
                  color: controller.gettextTitleColor,
                  fontSize: controller.getTitleFontSize,
                  fontStyle: controller.getTitleFontStyle,
                  fontWeight: controller.getTitleFontWeight),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter text',
                fillColor: Colors.transparent,
                filled: true,
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
              style: TextStyle(
                color: controller.gettextTitleColor,
                fontSize: fontSizeDescription,
              ),
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
            onPressed: _showCustomizationOptions,
            child: const Icon(Icons.palette),
          ),
        ],
      ),
    );
  }
}

class CustomRadioButton extends StatelessWidget {
  final Color value;
  final Color? groupValue;
  final ValueChanged<Color?>? onChanged;
  final Color color;

  const CustomRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onChanged != null) {
          onChanged!(value);
        }
        print("groupValue $groupValue");
        print("value $value");
      },
      splashColor: Colors.transparent,
      child: Container(
        height: 40,
        width: 40,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(
            color: groupValue == value
                ? value == Colors.black
                    ? Colors.yellowAccent
                    : Colors.black
                : Colors.transparent,
            width: 2,
          ),
        ),
      ),
    );
  }
}
