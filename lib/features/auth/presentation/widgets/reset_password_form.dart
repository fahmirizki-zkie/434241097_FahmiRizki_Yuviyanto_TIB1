import 'package:flutter/material.dart';

import '../../../../core/routing/app_router.dart';
import '../../../../shared/widgets/app_text_field.dart';

/// Reset-password form card — UI-only with local form state.
class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final _emailController = TextEditingController();

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    return emailRegex.hasMatch(email);
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 72),

        // ── Title ─────────────────────────────────────────
        Text(
          'Forgot Password?',
          style: TextStyle(
            color: isDark
                ? const Color(0xFFE2E8F0)
                : const Color(0xFF1B283A),
            fontSize: 38 / 1.2,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.2,
          ),
        ),
        const SizedBox(height: 8),

        // ── Subtitle ──────────────────────────────────────
        Text(
          'Enter your email and we\'ll send you a reset link '
          'to regain access to your account.',
          style: TextStyle(
            color: isDark
                ? const Color(0xFF94A3B8)
                : const Color(0xFF8E95A7),
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 1.45,
          ),
        ),
        const SizedBox(height: 30),

        // ── Email Card ────────────────────────────────────
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(18, 20, 18, 20),
          decoration: BoxDecoration(
            color: isDark
                ? const Color(0xFF1E1E2E).withValues(alpha: 0.92)
                : Colors.white.withValues(alpha: 0.84),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? const Color(0x50000000)
                    : const Color(0x0E1C2137),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'EMAIL ADDRESS',
                style: TextStyle(
                  color: isDark
                      ? const Color(0xFFCBD5E1)
                      : const Color(0xFF444B5B),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.6,
                ),
              ),
              const SizedBox(height: 10),
              AppTextField(
                controller: _emailController,
                hintText: 'name@example.com',
                leadingIcon: Icons.mail_outline_rounded,
              ),
              const SizedBox(height: 20),

              // ── Send Reset Link Button ──────────────────
              SizedBox(
                width: double.infinity,
                height: 52,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF4D4DE0), Color(0xFF0C1946)],
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
                        final email = _emailController.text.trim();

                        if (!_isValidEmail(email)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Please enter a valid email address.',
                              ),
                            ),
                          );
                          return;
                        }

                        Navigator.of(context).pushNamed(
                          AppRouter.resetPasswordCheckEmail,
                          arguments: email,
                        );
                      },
                      child: const Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Send Reset Link',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
