import 'package:flutter/cupertino.dart';
import 'package:tencent_im_base/tencent_im_base.dart';

class MessageMultiple extends StatefulWidget {
  const MessageMultiple({super.key});

  @override
  State<StatefulWidget> createState() => _MessageMultipleState();
}

class _MessageMultipleState extends TIMState<MessageMultiple> {
  @override
  Widget timBuild(BuildContext context) {
    return const Placeholder();
  }
}
