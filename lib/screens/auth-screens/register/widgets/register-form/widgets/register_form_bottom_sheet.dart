import 'package:flutter/material.dart';

class RegisterBottomSheetItem extends StatelessWidget {
  const RegisterBottomSheetItem({
    required this.icon,
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Flexible(
            child: ListTile(
              leading: Icon(
                icon,
                color: const Color.fromARGB(255, 49, 49, 49),
              ),
              title: Text(
                title,
                style: const TextStyle(
                  color: Color.fromARGB(255, 49, 49, 49),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
