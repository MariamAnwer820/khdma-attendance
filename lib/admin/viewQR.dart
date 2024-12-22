import 'dart:typed_data'; // For managing binary data
import 'package:flutter/material.dart';
import 'package:kkk/cons.dart';


class QrCodePage extends StatefulWidget {
  @override
  _QrCodePageState createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {
  Uint8List? qrCodeImage = MeetingURL as Uint8List?; // Store the image as Uint8List
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Display'),
      ),
      body: Center(
        child: qrCodeImage != null
            ? Image.memory(qrCodeImage!) // Display the image
            : CircularProgressIndicator(), // Show a loading spinner while waiting
      ),
    );
  }
}