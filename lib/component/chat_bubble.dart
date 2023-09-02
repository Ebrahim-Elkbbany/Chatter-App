import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({required this.message});
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        padding: const EdgeInsetsDirectional.only(
          start: 16,
          end: 16,
          top: 28,
          bottom: 28,
        ),
        decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(32),
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            )),
        child: Text(message.text,
            style: const TextStyle(
              color: Colors.white,
            )),
      ),
    );
  }
}

class ChatBubbleAnotherUser extends StatelessWidget {
  const ChatBubbleAnotherUser({super.key, required this.message});
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        padding: const EdgeInsetsDirectional.only(
          start: 16,
          end: 16,
          top: 28,
          bottom: 28,
        ),
        decoration: const BoxDecoration(
            color: Color(0xff006488),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            )),
        child: Text(message.text,
            style: const TextStyle(
              color: Colors.white,
            )),
      ),
    );
  }
}
