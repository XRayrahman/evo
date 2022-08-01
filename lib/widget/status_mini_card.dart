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
    fontSize: 50,
    fontWeight: FontWeight.w400,
  );
  @override
  Widget build(BuildContext context) {
    return NeuCard(
      childs: Container(
        // height: 45,
        margin: const EdgeInsets.fromLTRB(20, 30, 25, 30),
        alignment: Alignment.topLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: childs,
              ),
            ),
            const SizedBox(width: 5),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 2),
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
          ],
        ),
      ),
    );
  }
}
