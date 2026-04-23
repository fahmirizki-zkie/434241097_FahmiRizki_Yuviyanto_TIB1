import 'package:flutter/material.dart';

/// Reusable line-style text field used in auth forms.
class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.leadingIcon,
    this.obscureText = false,
    this.trailing,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData leadingIcon;
  final bool obscureText;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Row(
          children: [
            Icon(
              leadingIcon,
              size: 20,
              color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF8D92A0),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: controller,
                obscureText: obscureText,
                obscuringCharacter: '*',
                style: TextStyle(
                  color: isDark
                      ? const Color(0xFFE2E8F0)
                      : const Color(0xFF3B4150),
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: isDark
                        ? const Color(0xFF475569)
                        : const Color(0xFFC0C5D1),
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            if (trailing case final Widget trailingWidget) trailingWidget,
          ],
        ),
        const SizedBox(height: 8),
        Divider(
          height: 1,
          color: isDark ? const Color(0xFF334155) : const Color(0xFFC8CDD9),
        ),
      ],
    );
  }
}
