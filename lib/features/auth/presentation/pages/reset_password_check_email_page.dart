import 'package:flutter/material.dart';

import '../../../../core/routing/app_router.dart';

/// Confirmation page shown after user submits reset-password email.
class ResetPasswordCheckEmailPage extends StatelessWidget {
  const ResetPasswordCheckEmailPage({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final bool hasEmail = (email ?? '').trim().isNotEmpty;
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
                    onPressed: () => Navigator.of(context).maybePop(),
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
                        'Reset Password',
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
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 22),
                  child: Column(
                    children: [
                      _buildMailIconCard(isDark),
                      const SizedBox(height: 22),
                      Text(
                        'Check Your Email',
                        style: TextStyle(
                          color: isDark
                              ? const Color(0xFFE2E8F0)
                              : const Color(0xFF1F2B3C),
                          fontSize: 34 / 1.2,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        hasEmail
                            ? 'Reset link has been sent to\n$email. Please check your inbox and follow the instructions.'
                            : 'Reset link has been sent to your\nemail. Please check your inbox and\nfollow the instructions.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: isDark
                              ? const Color(0xFF94A3B8)
                              : Colors.grey.shade700,
                          fontSize: 18 / 1.2,
                          height: 1.35,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                        decoration: BoxDecoration(
                          color: isDark
                              ? const Color(0xFF1E1E2E).withValues(alpha: 0.7)
                              : Colors.white.withValues(alpha: 0.68),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isDark
                                ? const Color(0xFF2D3748)
                                : const Color(0xFFE4E8F2),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 26,
                              height: 26,
                              decoration: BoxDecoration(
                                color: isDark
                                    ? const Color(0xFF252547)
                                    : const Color(0xFFE7E9FF),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.info_outline,
                                color: Color(0xFF5A63DA),
                                size: 16,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'PRO TIP',
                                    style: TextStyle(
                                      color: Color(0xFF5A63DA),
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    'Can\'t find it? Make sure to check your spam or junk folder.',
                                    style: TextStyle(
                                      color: isDark
                                          ? const Color(0xFF94A3B8)
                                          : Colors.grey.shade700,
                                      fontSize: 12,
                                      height: 1.3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF081942), Color(0xFF4B50DD)],
                            ),
                            borderRadius: BorderRadius.circular(28),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x33121A56),
                                blurRadius: 14,
                                offset: Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(28),
                              onTap: () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                  AppRouter.login,
                                  (route) => false,
                                );
                              },
                              child: const Center(
                                child: Text(
                                  'Back to Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Didn't receive the email? ",
                            style: TextStyle(
                              color: isDark
                                  ? const Color(0xFF64748B)
                                  : Colors.grey.shade500,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).maybePop(),
                            child: const Text(
                              'Resend Email',
                              style: TextStyle(
                                color: Color(0xFF6469EE),
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMailIconCard(bool isDark) {
    return Container(
      width: 112,
      height: 112,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E2E) : Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color:
                isDark ? const Color(0x50000000) : const Color(0x121C2137),
            blurRadius: 22,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Center(
        child: Container(
          width: 66,
          height: 66,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xFF4A50DE), Color(0xFF2631B8)],
            ),
          ),
          child: const Icon(
            Icons.mark_email_unread_outlined,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
