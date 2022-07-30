import 'package:flutter/material.dart';
import 'package:evo/widget/neu_card.dart';

class StatusMiniCard extends StatelessWidget {
  final String title;
  final Widget? subtitle;
  final Widget? childs;
  const StatusMiniCard(
      {super.key, required this.title, this.childs, this.subtitle});
  // var text = widget.data;
  static const TextStyle titleStyle = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w400,
  );
  @override
  Widget build(BuildContext context) {
    return NeuCard(
      childs: Container(
        // height: 45,
        margin: const EdgeInsets.fromLTRB(20, 10, 25, 10),
        alignment: Alignment.topLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: childs,
              ),
            ),
            const SizedBox(width: 5),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    title,
                    style: titleStyle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
