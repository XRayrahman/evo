import 'package:flutter/material.dart';
import 'package:evo/widget/neu_card.dart';

class StatusCard extends StatelessWidget {
  final String title;
  final Widget? subtitle;
  final Widget? childs;
  final IconData? iconRight;
  const StatusCard(
      {super.key,
      required this.title,
      this.childs,
      this.subtitle,
      this.iconRight});
  // var text = widget.data;
  static const TextStyle titleStyle = TextStyle(
    fontSize: 16,
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
              children: [
                Text(
                  title,
                  style: titleStyle,
                ),
                Icon(
                  iconRight,
                  size: 16,
                ),
              ],
            ),
            const SizedBox(height: 5),
            Expanded(
              child: Container(
                child: childs,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
