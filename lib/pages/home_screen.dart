import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ImageProvider qrCode = const AssetImage('assets/images/sample-qr.png');

  Future<void> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png'],
    );
    if (result != null) {
      File file = File(result.files.single.path!);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('imagePath', result.files.single.path!);

      setState(() {
        qrCode = FileImage(file);
      });
    } else {}
  }

  @override
  void initState() {
    super.initState();
    loadImageFromPrefs();
  }

  Future<void> loadImageFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final String? imagePath = prefs.getString('imagePath');
    if (imagePath != null) {
      setState(() {
        qrCode = FileImage(File(imagePath));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () async {
                      pickImage();
                    },
                    child: const Text("Upload QR")),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.all(20)),
          Center(
            child: Container(
                padding: const EdgeInsets.all(15.0),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white.withOpacity(0.5),

                ),
                child: Image(image: qrCode)),
          ),
        ],
      ),
    );
  }
}
