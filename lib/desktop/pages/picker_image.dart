import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelectionExample extends StatefulWidget {
  @override
  _ImageSelectionExampleState createState() => _ImageSelectionExampleState();
}

class _ImageSelectionExampleState extends State<ImageSelectionExample> {
  File? _pickedImage;
  Uint8List webImage = Uint8List(8);
  // XFile? _pickedImage;

  Future<void> _pickImage() async {
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var selected = File(image.path);
        setState(() {
          _pickedImage = selected;
          webImage = Uint8List(8);
        });
      } else {
        print('No image has been picked');
      }
    } else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          webImage = f;
          _pickedImage = File('a');
        });
      } else {
        print('No image has been picked');
      }
    } else {
      print('Something went wrong');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sélection d\'image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 500,
              width: 700,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: MediaQuery.of(context).size.width > 350 ? 350 : 200,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: _pickedImage == null
                        ? Container(
                            decoration:
                                BoxDecoration(border: Border.all(width: 1)),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: kIsWeb
                                ? Image.memory(webImage, fit: BoxFit.fill)
                                : Image.file(_pickedImage!, fit: BoxFit.cover),
                          )),
              ),
            ),
            FittedBox(
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _pickedImage = null;
                        webImage = Uint8List(8);
                      });
                    },
                    child: const Text(
                      'Clear',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _pickImage();
                    },
                    child:const Text(
                      'Update image',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
