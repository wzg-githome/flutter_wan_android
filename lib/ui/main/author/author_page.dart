import 'package:flutter/material.dart';
import 'package:flutter_wan_android/custom/ace_app_bar.dart';
class AuthorPage extends StatefulWidget {
  const AuthorPage({Key? key}) : super(key: key);

  @override
  State<AuthorPage> createState() => _AuthorPageState();
}

class _AuthorPageState extends State<AuthorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAceAppBar("作者介绍"),
      body: Column(
        children: [
          Text("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
        ],
      ),
    );
  }
}
