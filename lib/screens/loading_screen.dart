import 'package:flutter/material.dart';
import 'results_screen.dart';
import '../services/api_service.dart';

class LoadingScreen extends StatelessWidget {
  final String imagePath;

  LoadingScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Processing')),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );

    _sendImageToApi(context);
  }

  void _sendImageToApi(BuildContext context) async {
    var result = await ApiService.sendImage(imagePath);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsScreen(result: result),
      ),
    );
  }
}
