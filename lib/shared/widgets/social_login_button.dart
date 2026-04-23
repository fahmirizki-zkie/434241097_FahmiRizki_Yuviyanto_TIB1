import 'package:flutter/material.dart';

/// Reusable outlined social login button (Google, Apple, etc.).
class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.icon,
    required this.label,
    this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Expanded(
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          side: BorderSide(
            color: isDark ? const Color(0xFF334155) : const Color(0xFFD8DAE3),
            width: 1.2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor:
              isDark ? const Color(0xFF1E1E2E) : Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18,
              color: isDark
                  ? const Color(0xFFE2E8F0)
                  : const Color(0xFF3B4150),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isDark
                    ? const Color(0xFFE2E8F0)
                    : const Color(0xFF3B4150),
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
