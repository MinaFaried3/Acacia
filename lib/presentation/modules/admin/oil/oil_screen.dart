import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class OilsScreen extends StatefulWidget {
  const OilsScreen({super.key});

  @override
  State<OilsScreen> createState() => _OilsScreenState();
}

class _OilsScreenState extends State<OilsScreen> {
  Uint8List? _webImage;
  File? _mobileImage;
  bool _isLoading = false;
  String name = '';
  final ImagePicker _picker = ImagePicker();

  // Future<void> _pickImage() async {
  //   final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     if (kIsWeb) {
  //       final bytes = await pickedFile.readAsBytes();
  //       setState(() => _webImage = bytes);
  //     } else {
  //       setState(() => _mobileImage = File(pickedFile.path));
  //     }
  //   }
  // }

  pickFile() async {
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
      withData: true,
    );
    if (pickedFile != null) {
      if (kIsWeb) {
        final bytes = pickedFile.files.first.bytes;
        name = pickedFile.files.first.name;
        setState(() => _webImage = bytes);
      } else {
        setState(() => _mobileImage = File(pickedFile.files.first.path!));
      }
    }
  }

  upload() async {
    // Uint8List fileBytes = result.files.first.bytes!;
    // final base64Image = base64Encode(_webImage!);
    // String fileName = result.files.first.name;
    // printer("Base64 Image Length: ${base64Image}", useLog: true);
    try {
      // var response = await cloudinary.uploader().upload(
      //   '''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''',
      //   params: UploadParams(
      //     publicId: 'mino',
      //     uniqueFilename: false,
      //     overwrite: true,
      //   ),
      // );

      // print("Public ID:");
      // print(response?.data?.publicId);
      // print("Secure URL:");
      // print(response?.data?.secureUrl);

      uploadDio();
    } catch (e) {
      print("Error uploading image: $e");
    }
  }

  Future<void> _uploadImage() async {
    if (_mobileImage == null && _webImage == null) return;
    setState(() => _isLoading = true);
    await upload();
  }

  Future<void> pickAndUploadImage() async {
    try {
      XFile? pickedFile;

      if (kIsWeb) {
        // For web: open file picker
        pickedFile = await _picker.pickImage(source: ImageSource.gallery);
        if (pickedFile == null) return;

        Uint8List bytes = await pickedFile.readAsBytes();
        String base64Str = base64Encode(bytes);

        await _saveToFirestore(base64Str);
      } else {
        // For mobile: use image picker
        pickedFile = await _picker.pickImage(source: ImageSource.gallery);
        if (pickedFile == null) return;

        Uint8List bytes = await pickedFile.readAsBytes();
        String base64Str = base64Encode(bytes);

        await _saveToFirestore(base64Str);
      }

      debugPrint("✅ Image uploaded successfully");
    } catch (e) {
      debugPrint("❌ Error uploading image: $e");
    }
  }

  Future<void> _saveToFirestore(String base64Str) async {
    await FirebaseFirestore.instance.collection("images").add({
      "imageBase64": base64Str,
      "createdAt": FieldValue.serverTimestamp(),
    });
  }

  uploadDio() async {
    try {
      final username = '368526228214249';
      final password = 'YH6QOPHm350tThRqIjV4oGCpZgM';
      var headers = {
        'Authorization':
            'Basic ${base64.encode(utf8.encode('$username:$password'))}',
        'Content-Type':
            'multipart/form-data; boundary=<calculated when request is sent>',
        'Connection': 'keep-alive',
        'Accept-Encoding': 'gzip, deflate, br',
      };

      var data = FormData.fromMap({
        // 'files': [await MultipartFile.fromBytes(fileBytes, filename: fileName)],
        'file': kIsWeb
            ? MultipartFile.fromBytes(
                _webImage!,
                filename: '_fileName',
                contentType: DioMediaType(
                  "image",
                  "jpeg",
                ), // or detect dynamically
              )
            : await MultipartFile.fromFile(
                _mobileImage!.path,
                filename: _mobileImage!.path.split('/').last,
              ),
        'upload_preset': 'acacia-dev',
        'public_id': 'hello654465456456dsafsfd',
        'api_key': '368526228214249',
      });

      var dio = Dio();
      var response = await dio.request(
        'https://api.cloudinary.com/v1_1/dbvy0gdrg/image/upload',
        options: Options(method: 'POST', headers: headers),
        data: data,
      );

      if (response.statusCode == 200) {
        print(response.data);
      } else {
        print(response.statusMessage);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print('Error: ${e.response?.data}');
      } else {
        print('Error sending request: $e');
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageWidget = kIsWeb
        ? (_webImage != null
              ? Image.memory(_webImage!, height: 200)
              : const Icon(Icons.image, size: 100, color: Colors.grey))
        : (_mobileImage != null
              ? Image.file(_mobileImage!, height: 200)
              : const Icon(Icons.image, size: 100, color: Colors.grey));

    return Scaffold(
      appBar: AppBar(title: const Text('Oil Management')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              imageWidget,
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: pickFile,
                child: const Text('Pick Image'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: pickAndUploadImage,
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Upload'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome to the Oil Management Screen!',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
