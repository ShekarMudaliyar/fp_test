import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../third_page.dart';

Color getColor(String color) {
  switch (color) {
    case 'green':
      return Colors.green;
    case 'red':
      return Colors.red;
    default:
      return Colors.black;
  }
}

Widget pageWidget(Map data) {
  switch (data['type']) {
    case 'value':
      return ListView.builder(
          itemCount: data['values'].length,
          itemBuilder: (_, index) => ListTile(
                title: Text(data['values'][index].toString()),
              ));
    case 'indicator':
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Set Parameters'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(data['parameter_name']),
                SizedBox(
                  height: 50,
                  width: 150,
                  child: TextField(
                    decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        hintText: data['default_value'].toString()),
                  ),
                )
              ],
            )
          ],
        ),
      );
    default:
      return Container();
  }
}

Widget changeData(String text, Map? variables, BuildContext context) {
  List indexList = [];
  if (variables != null) {
    if (text.contains('\$')) {
      variables.forEach((key, value) {
        if (value['type'] == 'indicator') {
          indexList.add({key: value});
          text = text.replaceFirst(
              key, '{${value['default_value'].toString()}/$key}');
        } else if (value['type'] == 'value') {
          indexList.add({key: value});
          text =
              text.replaceFirst(key, '{${value['values'][0].toString()}/$key}');
        }
      });
    }
  }

  final regex = RegExp("(?={)|(?<=})");
  final split = text.split(regex);

  return RichText(
      text: TextSpan(
    children: <InlineSpan>[
      for (String text in split)
        text.startsWith('{')
            ? TextSpan(
                text: text.substring(1, text.length - 1).split('/')[0],
                style: const TextStyle(
                    decoration: TextDecoration.underline, color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ThirdPage(
                                data: variables?[text
                                    .substring(1, text.length - 1)
                                    .split('/')[1]])));
                  },
              )
            : TextSpan(text: text, style: const TextStyle(color: Colors.black)),
    ],
  ));
}
