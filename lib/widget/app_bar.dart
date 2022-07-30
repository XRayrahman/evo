import 'package:flutter/material.dart';

class AppBarCard extends StatelessWidget {
  final String title;
  final Widget? iconLeft;
  final Widget? iconRight;
  const AppBarCard(
      {super.key, required this.title, this.iconRight, this.iconLeft});
  // var text = widget.data;
  static const TextStyle titleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      margin: const EdgeInsets.fromLTRB(20, 25, 20, 20),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: iconLeft,
              ),
              // SizedBox(width: 5),
              Text(
                title,
                style: titleStyle,
              ),
            ],
          ),
          Container(
            child: iconRight,
          ),
        ],
      ),
    );
  }
}
