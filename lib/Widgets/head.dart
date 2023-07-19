import 'package:flutter/material.dart';
import 'package:gitproject/Widgets/second_question.dart';
import 'package:gitproject/Widgets/visibility.dart';

class HeadUi extends StatefulWidget {
  final String name;
  final String visibility;
  const HeadUi({Key? key, required this.name, required this.visibility})
      : super(key: key);

  @override
  State<HeadUi> createState() => _HeadUiState();
}

class _HeadUiState extends State<HeadUi> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SecondQuestion(name: widget.name)));
              },
              child: Text(widget.name)),
          VisibilityUi(visibility: widget.visibility)
        ],
      ),
    );
  }
}
