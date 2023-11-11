import 'package:flutter/material.dart';

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
  Color selectedColor = Colors.blue;
  Color selectedColorTitle = Colors.blue;
  Color selectedColorDescription = Colors.blue;
  double fontSizeTitle = 16.0; // Default font size
  double fontSizeDescription = 16.0;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool editTitle = true; // Indicates whether to edit title or description
  double fontsize = 16.0;
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  void _showCustomizationOptions() {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Customization Options'),
                      IconButton(
                        icon: const Icon(Icons.arrow_downward),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildColorButton(Colors.blue),
                      _buildColorButton(Colors.red),
                      _buildColorButton(Colors.green),
                      _buildColorButton(Colors.yellow),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                      'Font Size: ${editTitle ? fontSizeTitle.ceil() : fontSizeDescription.ceil()}'),
                  Slider(
                    value: editTitle ? fontSizeTitle : fontSizeDescription,
                    min: 12.0,
                    max: 40.0,
                    onChanged: (value) {
                      setState(() {
                        if (editTitle == true) {
                          fontSizeTitle = value;
                        } else {
                          fontSizeDescription = value;
                        }
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildEditOption('Edit Title', true),
                      const SizedBox(width: 16),
                      _buildEditOption('Edit Description', false),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildColorButton(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
          if (editTitle == true) {
            selectedColorTitle = color;
          } else {
            selectedColorDescription = color;
          }
        });
        // Navigator.pop(context);
      },
      child: Container(
        height: 40,
        width: 40,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(
            color: selectedColor == color ? Colors.black : Colors.transparent,
            width: 2,
          ),
        ),
      ),
    );
  }

  Widget _buildEditOption(String label, bool isEditingTitle) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          editTitle = isEditingTitle;
        });
        // Navigator.pop(context);
        _scaffoldkey.currentState?.setState(() {});
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: editTitle == isEditingTitle ? Colors.blue : null,
      ),
      child: Text(label),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: _scaffoldkey,
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
          TextFormField(
            controller: titleController,
            style: TextStyle(
              color: selectedColorTitle,
              fontSize: fontSizeTitle,
            ),
            decoration: const InputDecoration(
              hintText: 'Enter title',
              labelText: 'Title',
            ),
            onChanged: (value) {
              setState(() {
                title = value;
              });
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: descriptionController,
            style: TextStyle(
              color: selectedColorDescription,
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
          const SizedBox(height: 16),
          Row(
            children: [
              const Text('Color:'),
              const SizedBox(width: 8),
              _buildColorButton(selectedColor),
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

class CustomModal extends StatefulWidget {
  const CustomModal({Key? key}) : super(key: key);

  @override
  CustomModalState createState() => CustomModalState();
}

class CustomModalState extends State<CustomModal> {
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Container(
            // ... existing modal code
            );
      },
    );
  }

  // Function to update the modal state
  void updateModal() {
    setState(() {});
  }
}





