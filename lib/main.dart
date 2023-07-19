import 'package:flutter/material.dart';
import 'package:gitproject/Widgets/first_question.dart';


void main() {
  runApp(const FirstUi());
}

class FirstUi extends StatefulWidget {
  const FirstUi({Key? key}) : super(key: key);

  @override
  State<FirstUi> createState() => _FirstUiState();
}

class _FirstUiState extends State<FirstUi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RepositoryList(),
    );
  }
}
