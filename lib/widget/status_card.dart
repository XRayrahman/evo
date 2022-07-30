import 'package:flutter/material.dart';
import 'package:evo/widget/neu_card.dart';

class StatusCard extends StatelessWidget {
  final String title;
  final Widget? subtitle;
  final Widget? childs;
  const StatusCard(
      {super.key, required this.title, this.childs, this.subtitle});
  // var text = widget.data;
  static const TextStyle titleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
  );
  @override
  Widget build(BuildContext context) {
    return NeuCard(
      childs: Container(
        // height: 45,
        margin: const EdgeInsets.all(20),
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: titleStyle,
                ),
              ],
            ),
            Container(
              child: childs,
            ),
          ],
        ),
      ),
    );
  }
}
