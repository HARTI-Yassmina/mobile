import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    Key? key,
    required this.text,
    required this.sender,
    this.isImage = false,
  }) : super(key: key);

  final String text;
  final String sender;
  final bool isImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(sender)
            .text
            .size(16)
            .color(sender == "user" ? Vx.red200 : Vx.green200)
            .make()
            .box
            .p16
            .rounded
            .alignCenter
            .makeCentered(),
        Expanded(
          child: isImage
              ? AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    text,
                    loadingBuilder: (context, child, loadingProgress) =>
                        loadingProgress == null
                            ? child
                            : CircularProgressIndicator.adaptive(),
                  ),
                )
              : text.trim().text.size(16).make().px8(),
        ),
      ],
    ).py8();
  }
}
