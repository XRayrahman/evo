import 'package:flutter/material.dart';
import 'package:evo/widget/neu_card.dart';

class ListCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextStyle subtitleStyle;
  final Widget? childs;
  const ListCard(
      {super.key,
      required this.title,
      this.childs,
      required this.subtitle,
      required this.subtitleStyle});
  // var text = widget.data;
  static const TextStyle titleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
  );
  @override
  Widget build(BuildContext context) {
    return NeuCard(
      childs: Container(
        height: 45,
        margin: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        alignment: Alignment.centerLeft,
        // padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: titleStyle,
                ),
                Text(
                  subtitle,
                  style: subtitleStyle,
                )
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
