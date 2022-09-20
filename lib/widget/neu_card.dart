import 'package:flutter/material.dart';

class NeuCard extends StatelessWidget {
  final Widget? childs;
  final EdgeInsetsGeometry? padding;
  const NeuCard({Key? key, this.childs, this.padding}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              offset: const Offset(4, 4),
              blurRadius: 15,
              spreadRadius: 0.7,
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 15,
              spreadRadius: 0.7,
            )
          ],
        ),
        child: childs,
      ),
    );
  }
}
