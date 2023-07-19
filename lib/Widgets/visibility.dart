import 'package:flutter/material.dart';

class VisibilityUi extends StatelessWidget {
  final String visibility;
  const VisibilityUi({Key? key, required this.visibility}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 25,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          visibility.toString(),
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
