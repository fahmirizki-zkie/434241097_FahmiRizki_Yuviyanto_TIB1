import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/theme_notifier.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: AppColors.scaffold(isDark),
      appBar: AppBar(
        backgroundColor: AppColors.appBarBg(isDark),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: AppColors.textPrimary(isDark)),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Text(
          'Profile',
          style: TextStyle(
            color: AppColors.textPrimary(isDark),
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings, color: AppColors.textPrimary(isDark)),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
                child: Column(
                  children: [
                    _buildHeader(isDark),
                    const SizedBox(height: 14),
                    _buildStats(isDark),
                    const SizedBox(height: 16),
                    _buildSectionLabel('ACCOUNT', isDark),
                    const SizedBox(height: 8),
                    _buildPanel(
                      isDark: isDark,
                      children: [
                        _MenuRow(icon: Icons.person, title: 'Edit Profile', onTap: () {}, isDark: isDark),
                        Divider(height: 1, color: AppColors.divider(isDark)),
                        _MenuRow(
                          icon: Icons.shield_outlined,
                          title: 'Change Password',
                          onTap: () => Navigator.of(context).pushNamed('/reset-password'),
                          isDark: isDark,
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    _buildSectionLabel('PREFERENCES', isDark),
                    const SizedBox(height: 8),
                    _buildPanel(
                      isDark: isDark,
                      children: [
                        _MenuRow(
                          icon: Icons.notifications,
                          title: 'Notifications',
                          onTap: () => Navigator.of(context).pushNamed('/user-notifications-empty'),
                          isDark: isDark,
                        ),
                        Divider(height: 1, color: AppColors.divider(isDark)),
                        _ThemeRow(
                          value: themeNotifier.isDark,
                          onChanged: (value) {
                            themeNotifier.setDark(value);
                          },
                          isDark: isDark,
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    _buildSectionLabel('OTHERS', isDark),
                    const SizedBox(height: 8),
                    _buildPanel(
                      isDark: isDark,
                      children: [
                        _MenuRow(icon: Icons.help, title: 'Help', onTap: () {}, isDark: isDark),
                        Divider(height: 1, color: AppColors.divider(isDark)),
                        _MenuRow(icon: Icons.info, title: 'About', onTap: () {}, isDark: isDark),
                        Divider(height: 1, color: AppColors.divider(isDark)),
                        _MenuRow(
                          icon: Icons.logout,
                          title: 'Logout',
                          titleColor: const Color(0xFFD9272E),
                          iconColor: const Color(0xFFD9272E),
                          trailingColor: const Color(0xFFD9272E),
                          onTap: _showLogoutDialog,
                          isDark: isDark,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Version v1.0.0',
                      style: TextStyle(color: AppColors.textSecondary(isDark), fontSize: 11),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            _buildBottomNav(isDark),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.profileHeader(isDark),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                width: 88,
                height: 88,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.card(isDark), width: 3),
                  image: const DecorationImage(
                    image: NetworkImage('https://i.pravatar.cc/220?img=12'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                right: -2,
                bottom: 2,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2740C8),
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.card(isDark), width: 2),
                  ),
                  child: const Icon(Icons.edit, size: 12, color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Rizky',
            style: TextStyle(
              color: AppColors.textPrimary(isDark),
              fontSize: 18 / 1.2,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: const Color(0xFF7C5CF1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              'USER',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStats(bool isDark) {
    return Row(
      children: [
        Expanded(child: _StatCard(icon: Icons.confirmation_number, label: 'Tickets', value: '24', isDark: isDark)),
        const SizedBox(width: 10),
        Expanded(child: _StatCard(icon: Icons.account_balance_wallet, label: 'Balance', value: '\$1,250', isDark: isDark)),
      ],
    );
  }

  Widget _buildSectionLabel(String label, bool isDark) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: TextStyle(
          color: AppColors.textSecondary(isDark),
          letterSpacing: 1.1,
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildPanel({required List<Widget> children, required bool isDark}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card(isDark),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border(isDark)),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildBottomNav(bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.navBar(isDark),
        boxShadow: [
          BoxShadow(color: AppColors.shadow(isDark), blurRadius: 20, offset: const Offset(0, -5)),
        ],
      ),
      child: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF6B4EE6),
        unselectedItemColor: isDark ? Colors.grey.shade600 : Colors.grey.shade500,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: 3,
        onTap: (index) {
          if (index == 0) Navigator.of(context).pushReplacementNamed('/universal-loading', arguments: '/user-dashboard');
          if (index == 1) Navigator.of(context).pushReplacementNamed('/universal-loading', arguments: '/user-tickets');
          if (index == 2) Navigator.of(context).pushNamed('/user-notifications');
        },
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          const BottomNavigationBarItem(icon: Icon(Icons.confirmation_number_outlined), label: 'Tickets'),
          const BottomNavigationBarItem(icon: Icon(Icons.notifications_none_rounded), label: 'Alerts'),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(color: const Color(0xFF6B4EE6).withValues(alpha: 0.14), borderRadius: BorderRadius.circular(12)),
              child: const Icon(Icons.person_outline_rounded),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Future<void> _showLogoutDialog() async {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    await showDialog<void>(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.45),
      builder: (dialogContext) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 36),
          backgroundColor: AppColors.card(isDark),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 20, 22, 18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.logout_rounded, color: Color(0xFFE13A3A), size: 26),
                const SizedBox(height: 12),
                Text('Logout Account', style: TextStyle(color: AppColors.textPrimary(isDark), fontWeight: FontWeight.w600, fontSize: 18 / 1.2)),
                const SizedBox(height: 8),
                Text('Are you sure you want to logout?', textAlign: TextAlign.center, style: TextStyle(color: AppColors.textSecondary(isDark), fontSize: 13)),
                const SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                      Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFD51F24), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)), elevation: 0),
                    child: const Text('Logout', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 42,
                  child: TextButton(
                    onPressed: () => Navigator.of(dialogContext).pop(),
                    style: TextButton.styleFrom(
                      backgroundColor: isDark ? const Color(0xFF252547) : const Color(0xFFF1F2F6),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    child: Text('Cancel', style: TextStyle(color: AppColors.textPrimary(isDark), fontWeight: FontWeight.w600)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.icon, required this.label, required this.value, required this.isDark});

  final IconData icon;
  final String label;
  final String value;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
        color: AppColors.card(isDark),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border(isDark)),
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF252547) : const Color(0xFFE6EBFF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: const Color(0xFF3B4AB8), size: 16),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: TextStyle(color: AppColors.textSecondary(isDark), fontSize: 11)),
                const SizedBox(height: 2),
                Text(value, style: TextStyle(color: AppColors.textPrimary(isDark), fontWeight: FontWeight.w700, fontSize: 13)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuRow extends StatelessWidget {
  const _MenuRow({
    required this.icon,
    required this.title,
    required this.onTap,
    this.titleColor,
    this.iconColor,
    this.trailingColor,
    required this.isDark,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? titleColor;
  final Color? iconColor;
  final Color? trailingColor;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
        child: Row(
          children: [
            Icon(icon, color: iconColor ?? AppColors.textSecondary(isDark), size: 18),
            const SizedBox(width: 10),
            Expanded(child: Text(title, style: TextStyle(color: titleColor ?? AppColors.textPrimary(isDark), fontWeight: FontWeight.w600))),
            Icon(Icons.chevron_right, color: trailingColor ?? AppColors.textSecondary(isDark)),
          ],
        ),
      ),
    );
  }
}

class _ThemeRow extends StatelessWidget {
  const _ThemeRow({required this.value, required this.onChanged, required this.isDark});

  final bool value;
  final ValueChanged<bool> onChanged;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Icon(Icons.dark_mode, color: AppColors.textSecondary(isDark), size: 18),
          const SizedBox(width: 10),
          Expanded(child: Text('Dark Mode', style: TextStyle(color: AppColors.textPrimary(isDark), fontWeight: FontWeight.w600))),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: Colors.white,
            activeTrackColor: const Color(0xFF7D88EE),
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: isDark ? const Color(0xFF334155) : const Color(0xFFDDE1EE),
          ),
        ],
      ),
    );
  }
}
