import 'package:flutter/material.dart';

///MessageDialogView
class MessageDialogView extends StatelessWidget {
  const MessageDialogView({Key? key, this.tag, this.context, this.onTap})
      : super(key: key);

  final String? tag;
  final String? context;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(left: 50, right: 50),
      child: Column(
        children: [
          Expanded(
              child: Container(
            margin: const EdgeInsets.only(top: 12),
            child: const Text(
              "温馨提示",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          )),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 30, right: 30, top: 5),
              width: double.infinity,
              child: Text(
                "$context",
                style: const TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
            flex: 2,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 5, bottom: 15, left: 8, right: 8),
                      child: const Text(
                        "确定",
                        style: TextStyle(color: Colors.blue, fontSize: 14),
                      ),
                    ),
                  )
                ],
              ),
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
