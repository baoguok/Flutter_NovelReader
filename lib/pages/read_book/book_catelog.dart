import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookCatelogPage extends StatelessWidget {

  final items = List<String>.generate(35, (i) => '第$i章');
  BookCatelogPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('章节目录'),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
        itemCount: items.length,
          itemBuilder: (context, index){
        return ListTile(
          title: Text('${items[index]}'),
        );
      })
    );
  }
}
