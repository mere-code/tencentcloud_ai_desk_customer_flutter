import 'package:flutter/material.dart';
import 'package:tencent_im_base/tencent_im_base.dart';

class RobotCard extends StatefulWidget {
  final dynamic payload;
  final Function onClickItem;
  const RobotCard({super.key, this.payload, required this.onClickItem});

  @override
  State<StatefulWidget> createState() => _RobotCardState();
}

class _RobotCardState extends TIMState<RobotCard> {
  @override
  Widget timBuild(BuildContext context) {
    final header = widget.payload.content.title ?? "";
    final list = widget.payload.content.candidate ?? [];
    bool hasReply = false;
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Text(header),
      list.map((index) {
        return TextButton(
          child: const Text("normal"),
          onPressed: () {
            if (hasReply) {
              return;
            }
            setState(() {
              hasReply = true;
            });
            widget.onClickItem(list[index]);
          },
        );
      }).toList()
    ]);
  }
}
