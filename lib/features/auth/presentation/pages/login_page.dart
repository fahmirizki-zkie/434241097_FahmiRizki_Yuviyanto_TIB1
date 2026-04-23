import 'package:flutter/material.dart';

import '../widgets/login_form.dart';

/// Login page (presentation layer only).
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark
                ? [const Color(0xFF1A1A2E), const Color(0xFF121218)]
                : [const Color(0xFFD5D9E8), const Color(0xFFE4E7F0)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                color: isDark
                    ? const Color(0xFF1E1E2E).withValues(alpha: 0.9)
                    : Colors.white.withValues(alpha: 0.86),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'TicketFlow',
                      style: TextStyle(
                        color: Color(0xFF5D5FED),
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.3,
                      ),
                    ),
                    Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isDark
                              ? const Color(0xFF64748B)
                              : const Color(0xFFAAB1C5),
                          width: 1.2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '?',
                          style: TextStyle(
                            color: isDark
                                ? const Color(0xFF64748B)
                                : const Color(0xFFAAB1C5),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(14, 82, 14, 16),
                  child: Column(
                    children: [
                      const LoginForm(),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.verified_user_outlined,
                            size: 15,
                            color: isDark
                                ? const Color(0xFF64748B)
                                : const Color(0xFF9EA4B3),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Secure Access',
                            style: TextStyle(
                              color: isDark
                                  ? const Color(0xFF64748B)
                                  : const Color(0xFF9EA4B3),
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Icon(
                            Icons.speed_rounded,
                            size: 15,
                            color: isDark
                                ? const Color(0xFF64748B)
                                : const Color(0xFF9EA4B3),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'High Speed',
                            style: TextStyle(
                              color: isDark
                                  ? const Color(0xFF64748B)
                                  : const Color(0xFF9EA4B3),
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Opacity(
                        opacity: 0.08,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.confirmation_num_outlined,
                              size: 74,
                              color: isDark
                                  ? const Color(0xFF94A3B8)
                                  : const Color(0xFF8A92AA),
                            ),
                            Icon(
                              Icons.stars_outlined,
                              size: 56,
                              color: isDark
                                  ? const Color(0xFF94A3B8)
                                  : const Color(0xFF8A92AA),
                            ),
                            Icon(
                              Icons.workspace_premium_outlined,
                              size: 82,
                              color: isDark
                                  ? const Color(0xFF94A3B8)
                                  : const Color(0xFF8A92AA),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
