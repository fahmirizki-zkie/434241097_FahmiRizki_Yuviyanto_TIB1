import 'package:flutter/material.dart';

import '../../../../shared/widgets/app_primary_button.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../../../shared/widgets/social_login_button.dart';

/// Registration form card widget — UI-only with local form state.
class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _fullNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _fullNameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 22, 18, 16),
      decoration: BoxDecoration(
        color: isDark
            ? const Color(0xFF1E1E2E).withValues(alpha: 0.92)
            : Colors.white.withValues(alpha: 0.84),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isDark ? const Color(0x50000000) : const Color(0x141C2137),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header ──────────────────────────────────────────
          Center(
            child: Text(
              'Create Account',
              style: TextStyle(
                color: isDark
                    ? const Color(0xFFE2E8F0)
                    : const Color(0xFF1B283A),
                fontSize: 32,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.8,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Center(
            child: Text(
              'Fill in your details below',
              style: TextStyle(
                color: isDark
                    ? const Color(0xFF94A3B8)
                    : const Color(0xFF8E95A7),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // ── Full Name ───────────────────────────────────────
          _buildInputLabel('FULL NAME', isDark),
          const SizedBox(height: 8),
          AppTextField(
            controller: _fullNameController,
            hintText: 'Example: John Doe',
            leadingIcon: Icons.person_outline_rounded,
          ),
          const SizedBox(height: 14),

          // ── Username ────────────────────────────────────────
          _buildInputLabel('USERNAME', isDark),
          const SizedBox(height: 8),
          AppTextField(
            controller: _usernameController,
            hintText: 'Example: johndoe',
            leadingIcon: Icons.alternate_email_rounded,
          ),

          const SizedBox(height: 14),

          // ── Email Address ───────────────────────────────────
          _buildInputLabel('EMAIL ADDRESS', isDark),
          const SizedBox(height: 8),
          AppTextField(
            controller: _emailController,
            hintText: 'Example: john@email.com',
            leadingIcon: Icons.mail_outline_rounded,
          ),
          const SizedBox(height: 14),

          // ── Password ────────────────────────────────────────
          _buildInputLabel('PASSWORD', isDark),
          const SizedBox(height: 8),
          AppTextField(
            controller: _passwordController,
            hintText: '••••••••',
            leadingIcon: Icons.lock_outline_rounded,
            obscureText: _obscurePassword,
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
              icon: Icon(
                _obscurePassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: isDark
                    ? const Color(0xFF94A3B8)
                    : const Color(0xFF8D92A0),
                size: 22,
              ),
            ),
          ),
          const SizedBox(height: 14),

          // ── Confirm Password ────────────────────────────────
          _buildInputLabel('CONFIRM PASSWORD', isDark),
          const SizedBox(height: 8),
          AppTextField(
            controller: _confirmPasswordController,
            hintText: '••••••••',
            leadingIcon: Icons.lock_outline_rounded,
            obscureText: _obscureConfirmPassword,
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  _obscureConfirmPassword = !_obscureConfirmPassword;
                });
              },
              icon: Icon(
                _obscureConfirmPassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: isDark
                    ? const Color(0xFF94A3B8)
                    : const Color(0xFF8D92A0),
                size: 22,
              ),
            ),
          ),
          const SizedBox(height: 22),

          // ── Create Account Button ──────────────────────────
          AppPrimaryButton(
            label: 'Create Account',
            onPressed: () {
              // TODO: Connect to register use case.
            },
          ),
          const SizedBox(height: 18),

          // ── OR REGISTER WITH divider ───────────────────────
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: isDark
                      ? const Color(0xFF334155)
                      : const Color(0xFFD3D6DE),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'OR REGISTER WITH',
                  style: TextStyle(
                    color: isDark
                        ? const Color(0xFF64748B)
                        : const Color(0xFF9EA4B3),
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                  color: isDark
                      ? const Color(0xFF334155)
                      : const Color(0xFFD3D6DE),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // ── Social Login Buttons ───────────────────────────
          Row(
            children: [
              SocialLoginButton(
                icon: Icons.g_mobiledata_rounded,
                label: 'Google',
                onPressed: () {
                  // TODO: Google sign-in.
                },
              ),
              const SizedBox(width: 12),
              SocialLoginButton(
                icon: Icons.apple_rounded,
                label: 'Apple',
                onPressed: () {
                  // TODO: Apple sign-in.
                },
              ),
            ],
          ),
          const SizedBox(height: 18),

          // ── Already have an account? Login ─────────────────
          Center(
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: isDark
                        ? const Color(0xFF94A3B8)
                        : const Color(0xFF9096A6),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  children: const [
                    TextSpan(text: 'Already have an account?  '),
                    TextSpan(
                      text: 'Login',
                      style: TextStyle(
                        color: Color(0xFF6469EE),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputLabel(String text, bool isDark) {
    return Text(
      text,
      style: TextStyle(
        color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF444B5B),
        fontSize: 12,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.6,
      ),
    );
  }
}
