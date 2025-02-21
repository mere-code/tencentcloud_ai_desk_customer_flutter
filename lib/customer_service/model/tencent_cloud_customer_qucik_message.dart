import 'package:flutter/widgets.dart';

class TencentCloudCustomerQuickMessage {
  final String label;
  final VoidCallback onTap;
  final Widget? icon;

  TencentCloudCustomerQuickMessage({
    required this.label,
    required this.onTap,
    this.icon,
  });
}
