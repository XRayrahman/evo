import 'package:flutter/material.dart';

class BatteryWidget extends StatefulWidget {
  final double size;
  final Color inActiveColor;
  final Color? activeColor;
  final double value;

  const BatteryWidget({
    Key? key,
    this.inActiveColor = Colors.black26,
    this.activeColor,
    // this.height = 25,
    this.size = 100,
    this.value = 0,
  })  : assert(value >= 0 && value <= 100, 'Value must be between (0 to 100)%'),
        super(key: key);

  @override
  State<BatteryWidget> createState() => _BatteryState();
}

class _BatteryState extends State<BatteryWidget> {
  late double _height, _cellWidth;

  @override
  Widget build(BuildContext context) {
    _height = widget.size / 2;
    _cellWidth =
        widget.size - (widget.size / 2.88) / (2 * 2 * 3) - _height / (2 * 1.5);

    return SizedBox(
      height: _height,
      width: widget.size,
      // + (size / 2.88) / (2 * 2 * 3) + _height / (2 * 2.5)
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(widget.size / 16.5),
            child: Stack(
              children: [
                Container(
                  height: _height,
                  width: _cellWidth,
                  decoration: BoxDecoration(
                    color: widget.inActiveColor,
                  ),
                ),
                SizedBox(
                  height: _height,
                  width: widget.value <= 90
                      ? widget.value / 90 * _cellWidth
                      : _cellWidth,
                  child: Container(
                    height: _height,
                    width: widget.value,
                    decoration: BoxDecoration(
                      color: widget.activeColor ?? _batteryColor(widget.value),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: (widget.size / 2.88) / (2 * 2 * 3)),
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(widget.size / 16.5),
              topRight: Radius.circular(widget.size / 16.5),
            ),
            child: Stack(
              children: [
                Container(
                  height: _height / 2,
                  width: _height / (2 * 2.5),
                  decoration: BoxDecoration(
                    color: widget.inActiveColor,
                  ),
                ),
                SizedBox(
                  height: _height / 2,
                  width: widget.value <= 90
                      ? 0
                      : widget.value / 100 * _height / (2 * 2.5),
                  child: Container(
                    height: _height,
                    width: widget.value,
                    decoration: BoxDecoration(
                      color: widget.activeColor ?? _batteryColor(widget.value),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Color _batteryColor(double value) {
    if (value >= 70) {
      return const Color(0xff43C2AE);
    } else if (value >= 45) {
      return const Color(0xffF2C445);
    } else if (value >= 25) {
      return const Color(0xffF28247);
    } else {
      return const Color(0xffF25147);
    }
  }
}
