import 'package:flutter/material.dart';

class DrawerOption extends StatelessWidget {
  final String optionName;
  final IconData optionIcon;
  final void Function()? onTap;

  const DrawerOption({
    super.key,
    required this.optionName,
    required this.optionIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(optionName),
      trailing: Icon(optionIcon),
      onTap: onTap,
    );
  }
}
