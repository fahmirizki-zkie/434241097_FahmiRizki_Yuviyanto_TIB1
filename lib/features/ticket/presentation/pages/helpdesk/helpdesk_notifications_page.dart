import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

class HelpdeskNotificationsPage extends StatelessWidget {
  const HelpdeskNotificationsPage({super.key});

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
        title: Text('Notifications', style: TextStyle(color: AppColors.textPrimary(isDark), fontWeight: FontWeight.w700)),
        actions: [
          TextButton(
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('All notifications marked as read.'))),
            child: const Text('Mark all read', style: TextStyle(color: Color(0xFF3D4AB8), fontWeight: FontWeight.w600)),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('New', style: TextStyle(color: AppColors.textSecondary(isDark), fontWeight: FontWeight.w500)),
              const SizedBox(height: 10),
              _NotificationCard(icon: Icons.priority_high, iconBg: const Color(0xFFFFE8E8), iconColor: const Color(0xFFE03C49), title: 'Ticket #TK-8942 escalated to Critical', message: 'Payment gateway outage affects multiple users. SLA is 30 minutes.', time: '2m ago', unread: true, isDark: isDark),
              const SizedBox(height: 12),
              _NotificationCard(icon: Icons.reply, iconBg: const Color(0xFFD8E8FF), iconColor: const Color(0xFF3E62D6), title: 'Customer replied on #TK-8938', message: '"Issue still persists after the latest troubleshooting steps."', time: '9m ago', unread: true, isDark: isDark),
              const SizedBox(height: 24),
              Text('Earlier', style: TextStyle(color: AppColors.textSecondary(isDark), fontWeight: FontWeight.w500)),
              const SizedBox(height: 10),
              _NotificationCard(icon: Icons.check, iconBg: const Color(0xFFD6F5E4), iconColor: const Color(0xFF1B9E5D), title: 'Ticket #TK-8940 has been resolved', message: 'Refund policy request has been completed and shared with customer.', time: '1h ago', isDark: isDark),
              const SizedBox(height: 12),
              _NotificationCard(icon: Icons.person_add_alt_1, iconBg: const Color(0xFFECDDFF), iconColor: const Color(0xFF8B3FD1), title: 'New ticket assigned to your queue', message: 'You have been assigned #TK-8951 regarding login verification failures.', time: '3h ago', badgeText: 'HIGH', isDark: isDark),
            ],
          ),
        ),
      ),
    );
  }
}

class _NotificationCard extends StatelessWidget {
  const _NotificationCard({required this.icon, required this.iconBg, required this.iconColor, required this.title, required this.message, required this.time, this.unread = false, this.badgeText, required this.isDark});

  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String title;
  final String message;
  final String time;
  final bool unread;
  final String? badgeText;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 14, 12, 14),
      decoration: BoxDecoration(color: AppColors.card(isDark), borderRadius: BorderRadius.circular(14), border: Border.all(color: AppColors.border(isDark))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(width: 44, height: 44, decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle), child: Icon(icon, color: iconColor, size: 22)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(child: Text(title, style: TextStyle(color: AppColors.textPrimary(isDark), fontSize: 16 / 1.1, height: 1.2, fontWeight: FontWeight.w600))),
                  if (unread) Container(width: 9, height: 9, margin: const EdgeInsets.only(left: 8, top: 3), decoration: const BoxDecoration(color: Color(0xFF2436A9), shape: BoxShape.circle)),
                ]),
                if (badgeText != null) ...[
                  const SizedBox(height: 5),
                  Container(padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2), decoration: BoxDecoration(color: const Color(0xFF8B3FD1), borderRadius: BorderRadius.circular(12)), child: Text(badgeText!, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700))),
                ],
                const SizedBox(height: 6),
                Text(message, style: TextStyle(color: AppColors.textSecondary(isDark), height: 1.3, fontSize: 15 / 1.1)),
                const SizedBox(height: 8),
                Text(time, style: TextStyle(color: AppColors.textSecondary(isDark), fontSize: 12, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
