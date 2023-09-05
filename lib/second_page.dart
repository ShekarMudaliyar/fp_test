import 'package:flutter/material.dart';
import 'package:fp_test/model.dart';
import 'package:fp_test/utils/commons.dart';

class SecondPage extends StatelessWidget {
  final Model data;
  const SecondPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(data.name),
          subtitle: Text(
            data.tag,
            style: TextStyle(color: getColor(data.color)),
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: data.criteria.length,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: changeData(
            data.criteria[index]['text'].toString(),
            data.criteria[index]['variable'],
            context,
          ),
        ),
        separatorBuilder: (BuildContext context, int index) => const Padding(
            padding: EdgeInsets.only(left: 20), child: Text('and')),
      ),
    );
  }
}
