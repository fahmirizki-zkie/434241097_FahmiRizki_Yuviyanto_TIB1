import 'package:flutter/material.dart';

import '../../../../core/routing/app_router.dart';
import '../../../../shared/widgets/app_primary_button.dart';
import '../../../../shared/widgets/app_text_field.dart';

/// Login card widget focused only on UI and local form state.
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  int _selectedRoleIndex = 0;
  bool _obscurePassword = true;

  static const List<String> _roles = ['User', 'Admin', 'Helpdesk'];

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
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
          Center(
            child: Text(
              'Welcome Back',
              style: TextStyle(
                color: isDark
                    ? const Color(0xFFE2E8F0)
                    : const Color(0xFF1B283A),
                fontSize: 42,
                fontWeight: FontWeight.w700,
                letterSpacing: -1,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Center(
            child: Text(
              'Sign in to your premium ticket portal',
              textAlign: TextAlign.center,
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
          Container(
            height: 42,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: isDark
                  ? const Color(0xFF252547)
                  : const Color(0xFFE8E9EE),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Row(
              children: List.generate(_roles.length, (index) {
                final bool isSelected = _selectedRoleIndex == index;
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedRoleIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      curve: Curves.easeOut,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? (isDark
                                ? const Color(0xFF2D2D5E)
                                : Colors.white)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: isDark
                                      ? const Color(0x40000000)
                                      : const Color(0x1C293D76),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ]
                            : null,
                      ),
                      child: Center(
                        child: Text(
                          _roles[index],
                          style: TextStyle(
                            color: isSelected
                                ? const Color(0xFF4F56E7)
                                : (isDark
                                    ? const Color(0xFF94A3B8)
                                    : const Color(0xFF6F7483)),
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 18),
          _buildInputLabel('Username', isDark),
          const SizedBox(height: 8),
          AppTextField(
            controller: _usernameController,
            hintText: 'Enter your username',
            leadingIcon: Icons.person_outline_rounded,
          ),
          const SizedBox(height: 14),
          _buildInputLabel('Password', isDark),
          const SizedBox(height: 8),
          AppTextField(
            controller: _passwordController,
            hintText: '**********',
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
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRouter.resetPassword);
              },
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Color(0xFF6469EE),
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          AppPrimaryButton(
            label: 'Login',
            icon: Icons.arrow_forward,
            onPressed: () {
              final username = _usernameController.text.trim();
              final password = _passwordController.text.trim();

              if (username.isEmpty || password.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Tolong masukkan username & password!'),
                  ),
                );
                return;
              }

              final role = _roles[_selectedRoleIndex].toLowerCase();
              if (role == 'user' && username == 'user' && password == 'user') {
                Navigator.of(
                  context,
                ).pushReplacementNamed(AppRouter.userDashboard);
              } else if ((role == 'admin' || role == 'helpdesk') &&
                  username == 'admin' &&
                  password == 'admin') {
                Navigator.of(
                  context,
                ).pushReplacementNamed(AppRouter.helpdeskDashboard);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Username/password salah untuk role $role!'),
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 16),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(AppRouter.register);
              },
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
                    TextSpan(text: "Don't have an account?  "),
                    TextSpan(
                      text: 'Register',
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
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
