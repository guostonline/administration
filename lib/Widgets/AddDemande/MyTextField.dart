import 'package:flutter/material.dart';

class MyTextFields extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String suffix;
  const MyTextFields(
      {@required this.title, @required this.controller, this.suffix, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 9, child: Text(title)),
        Expanded(
          flex: 3,
          child: Container(
            height: 40,
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                suffixText: suffix,
              ),
            ),
          ),
        )
      ],
    );
  }
}
