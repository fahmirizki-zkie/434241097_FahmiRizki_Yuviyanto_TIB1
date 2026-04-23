import 'package:flutter/material.dart';

import '../widgets/register_form.dart';

/// Register page — presentation-only screen for new user registration.
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
              // ── App Bar ──────────────────────────────────
              Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                color: isDark
                    ? const Color(0xFF1E1E2E).withValues(alpha: 0.9)
                    : Colors.white.withValues(alpha: 0.86),
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
                          'Register',
                          style: TextStyle(
                            color: isDark
                                ? const Color(0xFFE2E8F0)
                                : const Color(0xFF1B283A),
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    // Invisible placeholder for symmetry.
                    const SizedBox(width: 48),
                  ],
                ),
              ),

              // ── Body ─────────────────────────────────────
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(14, 24, 14, 24),
                  child: const RegisterForm(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
