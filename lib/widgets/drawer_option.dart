import 'package:flutter/material.dart';

class CustomDrawerOption extends StatelessWidget {
  final String optionName;
  final IconData optionIcon;

  const CustomDrawerOption({
    super.key,
    required this.optionName,
    required this.optionIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(optionName),
      trailing: Icon(optionIcon),
      onTap: () {},
    );
  }
}
