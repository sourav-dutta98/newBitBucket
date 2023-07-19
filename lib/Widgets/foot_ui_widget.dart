import 'package:flutter/material.dart';
import 'package:gitproject/Modal/foot.dart';

class FootUiWidget extends StatelessWidget {
  final FootModal content;
  const FootUiWidget({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (content.name.compareTo(" ") != 0)
        ? SizedBox(
            child: Row(
              children: [
                Icon(
                  content.getIconName(),
                  size: 15,
                ),
                const SizedBox(
                  width: 5,
                ),
                
                Text(content.name.toString()),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
          )
        : const SizedBox();
  }
}
