import 'package:flutter/material.dart';

///自定义appBar
class CustomAppBar extends StatefulWidget {
  final String centerTitle;
  final String? rightText;
  final bool? showLeft;

  const CustomAppBar(
      {Key? key, required this.centerTitle, this.rightText, this.showLeft})
      : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          Expanded(
            child: widget.showLeft != null && widget.showLeft == true
                ? Image.asset("asset/images/icon_back.png")
                : Container(),
            flex: 1,
          ),
          Expanded(
            child: Text(widget.centerTitle),
            flex: 1,
          ),
          Expanded(
            child: widget.rightText == null || widget.rightText == "null"
                ? Container()
                : Text("$widget.rightText"),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
