import 'package:flutter/material.dart';

const messages = [
  '当前书币不足，请及时充值'
  '当前书券不足，请先将书币兑换至书券'
];

const messages1 = [
  '当前书券不足，请先将书币兑换至书券'
];

class MessageNotification extends StatelessWidget {
  final VoidCallback onReply;

  final String message;

  const MessageNotification({
    Key key,
    @required this.onReply,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        color: Colors.white,
        child: SafeArea(
          child: ListTile(
            leading:
            SizedBox.fromSize(size: const Size(40, 40), child: ClipOval(child: Image.asset('images/fl_coin.png'))),
            title: Text('书币不足'),
            subtitle: Text(message),
            trailing: IconButton(
                icon: Icon(Icons.reply),
                onPressed: () {
                  if (onReply != null) onReply();
                }),
          ),
        ),
      ),
    );
  }
}