import 'package:flutter/material.dart';

class BookHero extends StatelessWidget {

  final String book;
  final VoidCallback callback;
  final double height;

  const BookHero({Key key, this.book, this.callback, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: height,
      child: Hero(
        tag: book,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: callback,
            child: Image(
              image: AssetImage(book),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
