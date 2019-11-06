import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookHero extends StatelessWidget {

  final String book;
  final VoidCallback callback;
  final double height;

  const BookHero({Key key, this.book, this.callback, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: height,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black54,
            blurRadius: 5.0,
            spreadRadius: 1.0,
            offset: Offset(-2.0, 2.0),
          ),
        ],
      ),
      child: Hero(
        tag: book,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: callback,
            child: Image(
              image: NetworkImage(book),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
