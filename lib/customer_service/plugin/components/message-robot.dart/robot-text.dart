import 'package:flutter/cupertino.dart';
import 'package:tencent_im_base/tencent_im_base.dart';

class RobotText extends StatefulWidget {
  final dynamic payload;
  const RobotText({super.key, this.payload});

  @override
  State<StatefulWidget> createState() => _RobotTextState();
}

class _RobotTextState extends TIMState<RobotText> {
  @override
  Widget timBuild(BuildContext context) {
    return const Placeholder();
  }
}
