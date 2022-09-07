import 'package:flutter/material.dart';
import 'package:evo/widget/neu_card.dart';

class StatusMiniCard extends StatelessWidget {
  final String title;
  final Widget? subtitle;
  final Widget? childs;
  final IconData? iconRight;
  const StatusMiniCard(
      {super.key,
      required this.title,
      this.childs,
      this.subtitle,
      this.iconRight});
  // var text = widget.data;
  static const TextStyle titleStyle = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.w400,
  );
  @override
  Widget build(BuildContext context) {
    return NeuCard(
      childs: Column(
        children: [
          Container(
            height: 50,
            // color: Colors.amber,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(child: subtitle),
                Icon(
                  iconRight,
                  size: 16,
                ),
              ],
            ),
          ),
          Expanded(
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 6),
                alignment: Alignment.center,
                child: Text(
                  title,
                  // style: titleStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
