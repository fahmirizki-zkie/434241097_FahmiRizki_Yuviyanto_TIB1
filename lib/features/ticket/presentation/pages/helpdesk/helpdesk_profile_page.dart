import 'package:flutter/material.dart';

import '../../../../../core/routing/app_router.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/theme_notifier.dart';

class HelpdeskProfilePage extends StatefulWidget {
  const HelpdeskProfilePage({super.key});

  @override
  State<HelpdeskProfilePage> createState() => _HelpdeskProfilePageState();
}

class _HelpdeskProfilePageState extends State<HelpdeskProfilePage> {
  bool _queueAlertsEnabled = true;
  bool _autoAssignEnabled = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: AppColors.scaffold(isDark),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    _buildNavHeader(context, isDark),
                    const SizedBox(height: 24),
                    _buildHeader(isDark),
                    const SizedBox(height: 14),
                    _buildStats(isDark),
                    const SizedBox(height: 16),
                    _buildSectionLabel('ACCOUNT', isDark),
                    const SizedBox(height: 8),
                    _buildPanel(isDark: isDark, children: [
                      _MenuRow(icon: Icons.person_outline, title: 'Edit Profile', onTap: () {}, isDark: isDark),
                      Divider(height: 1, color: AppColors.divider(isDark)),
                      _MenuRow(icon: Icons.lock_outline, title: 'Change Password', onTap: () => Navigator.of(context).pushNamed(AppRouter.resetPassword), isDark: isDark),
                    ]),
                    const SizedBox(height: 14),
                    _buildSectionLabel('PREFERENCES', isDark),
                    const SizedBox(height: 8),
                    _buildPanel(isDark: isDark, children: [
                      _SwitchRow(icon: Icons.notifications_none_rounded, title: 'Queue Alerts', value: _queueAlertsEnabled, onChanged: (v) => setState(() => _queueAlertsEnabled = v), isDark: isDark),
                      Divider(height: 1, color: AppColors.divider(isDark)),
                      _SwitchRow(icon: Icons.manage_accounts_outlined, title: 'Auto Assign Tickets', value: _autoAssignEnabled, onChanged: (v) => setState(() => _autoAssignEnabled = v), isDark: isDark),
                      Divider(height: 1, color: AppColors.divider(isDark)),
                      _SwitchRow(icon: Icons.dark_mode, title: 'Dark Mode', value: themeNotifier.isDark, onChanged: (v) => themeNotifier.setDark(v), isDark: isDark),
                    ]),
                    const SizedBox(height: 14),
                    _buildSectionLabel('SECURITY', isDark),
                    const SizedBox(height: 8),
                    _buildPanel(isDark: isDark, children: [
                      _MenuRow(icon: Icons.logout_rounded, title: 'Logout', titleColor: const Color(0xFFD9272E), iconColor: const Color(0xFFD9272E), trailingColor: const Color(0xFFD9272E), onTap: _showLogoutDialog, isDark: isDark),
                    ]),
                    const SizedBox(height: 20),
                    Text('Version v1.0.0', style: TextStyle(color: AppColors.textSecondary(isDark), fontSize: 11)),
                    const SizedBox(height: 18),
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

  Widget _buildNavHeader(BuildContext context, bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(icon: Icon(Icons.menu, color: AppColors.textPrimary(isDark)), onPressed: () {}, padding: EdgeInsets.zero, constraints: const BoxConstraints()),
        Text("Admin Profile", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary(isDark))),
        Row(children: [
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => Navigator.of(context).pushNamed('/helpdesk-notifications'),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Stack(children: [
                Icon(Icons.notifications_none_rounded, color: AppColors.textPrimary(isDark)),
                Positioned(right: 2, top: 2, child: Container(padding: const EdgeInsets.all(4), decoration: const BoxDecoration(color: Colors.redAccent, shape: BoxShape.circle))),
              ]),
            ),
          ),
          const SizedBox(width: 16),
          const CircleAvatar(radius: 16, backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11')),
        ]),
      ],
    );
  }

  Widget _buildHeader(bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(color: AppColors.profileHeader(isDark), borderRadius: BorderRadius.circular(18)),
      child: Column(children: [
        Stack(clipBehavior: Clip.none, alignment: Alignment.center, children: [
          Container(width: 88, height: 88, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.card(isDark), width: 3), image: const DecorationImage(image: NetworkImage('https://i.pravatar.cc/220?img=11'), fit: BoxFit.cover))),
          Positioned(right: -2, bottom: 2, child: Container(width: 24, height: 24, decoration: BoxDecoration(color: const Color(0xFF2740C8), shape: BoxShape.circle, border: Border.all(color: AppColors.card(isDark), width: 2)), child: const Icon(Icons.edit, size: 12, color: Colors.white))),
        ]),
        const SizedBox(height: 10),
        Text('Rizky Admin', style: TextStyle(color: AppColors.textPrimary(isDark), fontSize: 16, fontWeight: FontWeight.w700)),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(color: const Color(0xFF2C328E), borderRadius: BorderRadius.circular(10)),
          child: const Text('HELPDESK ADMIN', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 10)),
        ),
      ]),
    );
  }

  Widget _buildStats(bool isDark) {
    return Row(children: [
      Expanded(child: _StatCard(icon: Icons.confirmation_number_outlined, label: 'Open Queue', value: '18', isDark: isDark)),
      const SizedBox(width: 10),
      Expanded(child: _StatCard(icon: Icons.check_circle_outline, label: 'Resolved', value: '146', isDark: isDark)),
    ]);
  }

  Widget _buildSectionLabel(String label, bool isDark) {
    return Align(alignment: Alignment.centerLeft, child: Text(label, style: TextStyle(color: AppColors.textSecondary(isDark), letterSpacing: 1.1, fontSize: 11, fontWeight: FontWeight.w700)));
  }

  Widget _buildPanel({required List<Widget> children, required bool isDark}) {
    return Container(decoration: BoxDecoration(color: AppColors.card(isDark), borderRadius: BorderRadius.circular(14), border: Border.all(color: AppColors.border(isDark))), child: Column(children: children));
  }

  Widget _buildBottomNav(bool isDark) {
    return Container(
      decoration: BoxDecoration(color: AppColors.navBar(isDark), boxShadow: [BoxShadow(color: AppColors.shadow(isDark), blurRadius: 20, offset: const Offset(0, -5))]),
      child: BottomNavigationBar(
        elevation: 0, backgroundColor: Colors.transparent, type: BottomNavigationBarType.fixed, currentIndex: 3,
        selectedItemColor: const Color(0xFF6B4EE6), unselectedItemColor: isDark ? Colors.grey.shade600 : Colors.grey.shade500,
        showSelectedLabels: true, showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10), unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
        onTap: (index) {
          if (index == 0) Navigator.of(context).pushReplacementNamed(AppRouter.universalLoading, arguments: AppRouter.helpdeskDashboard);
          if (index == 1) Navigator.of(context).pushReplacementNamed(AppRouter.universalLoading, arguments: AppRouter.helpdeskTickets);
          if (index == 2) Navigator.of(context).pushNamed(AppRouter.helpdeskNotifications);
        },
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          const BottomNavigationBarItem(icon: Icon(Icons.confirmation_number_outlined), label: 'Tickets'),
          const BottomNavigationBarItem(icon: Icon(Icons.notifications_none_rounded), label: 'Alerts'),
          BottomNavigationBarItem(icon: Container(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), decoration: BoxDecoration(color: const Color(0xFF6B4EE6).withValues(alpha: 0.14), borderRadius: BorderRadius.circular(12)), child: const Icon(Icons.person_outline_rounded)), label: 'Profile'),
        ],
      ),
    );
  }

  Future<void> _showLogoutDialog() async {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    await showDialog<void>(
      context: context, barrierDismissible: true, barrierColor: Colors.black.withValues(alpha: 0.45),
      builder: (dialogContext) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 36), backgroundColor: AppColors.card(isDark), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 20, 22, 18),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const Icon(Icons.logout_rounded, color: Color(0xFFE13A3A), size: 26),
              const SizedBox(height: 12),
              Text('Logout Account', style: TextStyle(color: AppColors.textPrimary(isDark), fontWeight: FontWeight.w600, fontSize: 16)),
              const SizedBox(height: 8),
              Text('Are you sure you want to logout from admin account?', textAlign: TextAlign.center, style: TextStyle(color: AppColors.textSecondary(isDark), fontSize: 13)),
              const SizedBox(height: 18),
              SizedBox(width: double.infinity, height: 44, child: ElevatedButton(onPressed: () { Navigator.of(dialogContext).pop(); Navigator.of(context).pushNamedAndRemoveUntil(AppRouter.login, (route) => false); }, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFD51F24), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)), elevation: 0), child: const Text('Logout', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)))),
              const SizedBox(height: 10),
              SizedBox(width: double.infinity, height: 42, child: TextButton(onPressed: () => Navigator.of(dialogContext).pop(), style: TextButton.styleFrom(backgroundColor: isDark ? const Color(0xFF252547) : const Color(0xFFF1F2F6), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))), child: Text('Cancel', style: TextStyle(color: AppColors.textPrimary(isDark), fontWeight: FontWeight.w700)))),
            ]),
          ),
        );
      },
    );
  }
}

class _MenuRow extends StatelessWidget {
  const _MenuRow({required this.icon, required this.title, required this.onTap, this.iconColor, this.titleColor, this.trailingColor, required this.isDark});
  final IconData icon; final String title; final VoidCallback onTap; final Color? iconColor; final Color? titleColor; final Color? trailingColor; final bool isDark;
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onTap, child: Padding(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13), child: Row(children: [
      Icon(icon, color: iconColor ?? AppColors.textSecondary(isDark), size: 20), const SizedBox(width: 12),
      Expanded(child: Text(title, style: TextStyle(color: titleColor ?? AppColors.textPrimary(isDark), fontWeight: FontWeight.w600, fontSize: 13.5))),
      Icon(Icons.chevron_right_rounded, color: trailingColor ?? AppColors.textSecondary(isDark)),
    ])));
  }
}

class _SwitchRow extends StatelessWidget {
  const _SwitchRow({required this.icon, required this.title, required this.value, required this.onChanged, required this.isDark});
  final IconData icon; final String title; final bool value; final ValueChanged<bool> onChanged; final bool isDark;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8), child: Row(children: [
      Icon(icon, color: AppColors.textSecondary(isDark), size: 20), const SizedBox(width: 12),
      Expanded(child: Text(title, style: TextStyle(color: AppColors.textPrimary(isDark), fontWeight: FontWeight.w600, fontSize: 13.5))),
      Switch(value: value, activeColor: const Color(0xFF2841C6), inactiveTrackColor: isDark ? const Color(0xFF334155) : null, onChanged: onChanged),
    ]));
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.icon, required this.label, required this.value, required this.isDark});
  final IconData icon; final String label; final String value; final bool isDark;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(color: AppColors.card(isDark), borderRadius: BorderRadius.circular(14), border: Border.all(color: AppColors.border(isDark))),
      child: Row(children: [
        Container(width: 34, height: 34, decoration: BoxDecoration(color: isDark ? const Color(0xFF252547) : const Color(0xFFEEF1FF), borderRadius: BorderRadius.circular(10)), child: Icon(icon, color: const Color(0xFF2C328E), size: 18)),
        const SizedBox(width: 10),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(label, style: TextStyle(color: AppColors.textSecondary(isDark), fontSize: 10, fontWeight: FontWeight.w600)),
          const SizedBox(height: 2),
          Text(value, style: TextStyle(color: AppColors.textPrimary(isDark), fontSize: 16, fontWeight: FontWeight.w700)),
        ]),
      ]),
    );
  }
}
