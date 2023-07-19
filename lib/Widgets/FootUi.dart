import 'package:flutter/material.dart';
import 'package:gitproject/Modal/foot.dart';
import 'package:gitproject/Widgets/foot_ui_widget.dart';

class FootUi extends StatefulWidget {
  final List<FootModal> footElement;
  const FootUi({Key? key, required this.footElement}) : super(key: key);

  @override
  State<FootUi> createState() => _FootUiState();
}

class _FootUiState extends State<FootUi> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Row(
      children: [
        for (int i = 0; i < widget.footElement.length; i++)
          FootUiWidget(content:widget.footElement[i])
      ],
    ));
  }
}
