import 'package:flutter/material.dart';

import '../widgets/reset_password_form.dart';

/// Reset-password page — presentation-only screen for forgot-password flow.
class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor:
          isDark ? const Color(0xFF121218) : const Color(0xFFF2F4FA),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 6),
              color: isDark
                  ? const Color(0xFF1E1E2E).withValues(alpha: 0.9)
                  : Colors.white.withValues(alpha: 0.88),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 20,
                      color: isDark
                          ? const Color(0xFFE2E8F0)
                          : const Color(0xFF3B4150),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          color: isDark
                              ? const Color(0xFFE2E8F0)
                              : const Color(0xFF273041),
                          fontSize: 22 / 1.2,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 46),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: isDark
                        ? [
                            const Color(0xFF1A1A2E),
                            const Color(0xFF121218),
                          ]
                        : [
                            const Color(0xFFECEFF8),
                            const Color(0xFFF4F6FB),
                          ],
                  ),
                ),
                child: Column(
                  children: [
                    const Expanded(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.fromLTRB(20, 22, 20, 10),
                        child: ResetPasswordForm(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            color: isDark
                                ? const Color(0xFF94A3B8)
                                : const Color(0xFF9096A6),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                          children: const [
                            TextSpan(text: "Didn't receive the email? "),
                            TextSpan(
                              text: 'Check Spam',
                              style: TextStyle(
                                color: Color(0xFF6469EE),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(text: ' or '),
                            TextSpan(
                              text: 'Try again',
                              style: TextStyle(
                                color: Color(0xFF6469EE),
                                fontWeight: FontWeight.w700,
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
          ],
        ),
      ),
    );
  }
}
