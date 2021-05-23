import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory_app/screens/widgets/barcode_icon_button.dart';
import 'package:search_choices/search_choices.dart';

class AddProductScreen extends StatefulWidget {
  static const routeName = '/AddProductScreen';
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _size = TextEditingController();
  final TextEditingController _qty = TextEditingController();
  final TextEditingController _boxNumber = TextEditingController();
  final TextEditingController _manuallBarcode = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  bool man = false, women = false, baby = false, girl = false, boys = false;
  PickedFile _image;
  List<int> selectedItemsMultiDialog = [];
  List<DropdownMenuItem<dynamic>> items =
      <String>['Shirt', 'Pent', 'Trower', 'Jeans'].map((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();
  _onScan() {}
  @override
  Widget build(BuildContext context) {
    void _showPicker() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Wrap(
            children: [
              ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Photo Library'),
                  onTap: () async {
                    await _imgFromGallery();
                    Navigator.of(context).pop();
                  }),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () async {
                  await _imgFromCamera();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    Row _uploadImage() {
      return Row(
        children: [
          GestureDetector(
            onTap: () async {
              _showPicker();
            },
            child: Container(
              height: 100,
              width: 100,
              color: Colors.white,
              child: (_image != null)
                  ? Image.file(
                      File(_image.path),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                  : const Icon(Icons.photo),
            ),
          ),
          const SizedBox(width: 16),
          const Text(
            'Upload image',
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Form(
            key: _globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _uploadImage(),
                const SizedBox(height: 10),
                SimpleTextFormField(
                  controller: _title,
                  hint: 'Title: Brand, color, gender, category, model, number',
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(border: Border.all(width: 0.5)),
                  child: SearchChoices.multiple(
                    items: items,
                    selectedItems: selectedItemsMultiDialog,
                    hint: const Text("Select one category or more"),
                    searchHint: "Select one category or more",
                    onChanged: (List<int> value) {
                      setState(() {
                        selectedItemsMultiDialog = value;
                      });
                    },
                    closeButton: (List<int> selectedItems) {
                      return selectedItems.isNotEmpty
                          ? "Save ${selectedItems.length == 1 ? '"${items[selectedItems.first].value}"' : '(${selectedItems.length})'}"
                          : "Save without selection";
                    },
                    isExpanded: true,
                  ),
                ),
                const SizedBox(height: 16),
                allCheckBoxs(),
                Container(
                  decoration: BoxDecoration(border: Border.all(width: 0.5)),
                  child: SearchChoices.multiple(
                    items: items,
                    selectedItems: selectedItemsMultiDialog,
                    hint: const Text("Select conditions"),
                    searchHint: "Select conditions",
                    onChanged: (List<int> value) {
                      setState(() {
                        selectedItemsMultiDialog = value;
                      });
                    },
                    closeButton: (List<int> selectedItems) {
                      return selectedItems.isNotEmpty
                          ? "Save ${selectedItems.length == 1 ? '"${items[selectedItems.first].value}"' : '(${selectedItems.length})'}"
                          : "Save without selection";
                    },
                    isExpanded: true,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Flexible(
                      child:
                          SimpleTextFormField(hint: 'Size', controller: _size),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: SimpleTextFormField(hint: 'Qty', controller: _qty),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      flex: 2,
                      child: SimpleTextFormField(
                        hint: 'Box Number',
                        controller: _boxNumber,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Flexible(
                      child: SimpleTextFormField(
                          hint: 'Write barcode manuall',
                          controller: _manuallBarcode),
                    ),
                    const SizedBox(width: 10),
                    BarcodeIconButton(onScan: _onScan),
                    const SizedBox(width: 10),
                    Container(
                      height: 50,
                      width: 120,
                      color: Colors.blue,
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: const Center(
                        child: Text(
                          'Auto genrate barcode',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column allCheckBoxs() {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
              value: man,
              onChanged: (bool value) {
                setState(() {
                  man = value;
                });
              },
            ),
            const Text('Man'),
            const SizedBox(width: 20),
            Checkbox(
              checkColor: Colors.white,
              value: women,
              onChanged: (bool value) {
                setState(() {
                  women = value;
                });
              },
            ),
            const Text('Women'),
            const SizedBox(width: 20),
            Checkbox(
              checkColor: Colors.white,
              value: baby,
              onChanged: (bool value) {
                setState(() {
                  baby = value;
                });
              },
            ),
            const Text('Baby'),
          ],
        ),
        Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
              value: girl,
              onChanged: (bool value) {
                setState(() {
                  girl = value;
                });
              },
            ),
            const Text('Girl'),
            const SizedBox(width: 20),
            Checkbox(
              checkColor: Colors.white,
              value: boys,
              onChanged: (bool value) {
                setState(() {
                  boys = value;
                });
              },
            ),
            const Text('Boys'),
          ],
        ),
      ],
    );
  }

  Future _imgFromCamera() async {
    final ImagePicker _imagePicker = ImagePicker();
    final PickedFile _file = await _imagePicker.getImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );

    setState(() {
      _image = _file;
    });
  }

  Future _imgFromGallery() async {
    final ImagePicker _imagePicker = ImagePicker();
    final PickedFile _file = await _imagePicker.getImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    setState(() {
      _image = _file;
    });
  }
}

class SimpleTextFormField extends StatefulWidget {
  const SimpleTextFormField({
    Key key,
    @required String hint,
    @required TextEditingController controller,
  })  : _controller = controller,
        _hint = hint,
        super(key: key);
  final TextEditingController _controller;
  final String _hint;
  @override
  _SimpleTextFormFieldState createState() => _SimpleTextFormFieldState();
}

class _SimpleTextFormFieldState extends State<SimpleTextFormField> {
  void _onListener() => setState(() {});
  @override
  void initState() {
    widget._controller.addListener(_onListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0),
        prefix: const SizedBox(width: 10),
        hintText: widget._hint,
        hintStyle: const TextStyle(fontSize: 13),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
