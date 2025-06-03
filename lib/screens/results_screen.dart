import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  final dynamic result;

  ResultsScreen({required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Results')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Detected Disease: ${result['disease_name']}'),
          Text('Analysis: ${result['analysis']}'),
          Text('Confidence: ${result['confidence']}%'),
        ],
      ),
    );
  }
}
