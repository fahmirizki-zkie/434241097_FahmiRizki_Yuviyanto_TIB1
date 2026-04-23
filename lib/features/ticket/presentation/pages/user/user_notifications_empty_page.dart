import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

class UserNotificationsEmptyPage extends StatelessWidget {
  const UserNotificationsEmptyPage({super.key});

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
          'Notifications',
          style: TextStyle(
            color: AppColors.textPrimary(isDark),
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Mark all read',
              style: TextStyle(
                color: Color(0xFF3D4AB8),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildEmptyIllustration(isDark),
                const SizedBox(height: 28),
                Text(
                  "You're all caught up!",
                  style: TextStyle(
                    color: AppColors.textPrimary(isDark),
                    fontSize: 32 / 1.3,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'We\'ll notify you when there\'s an update on your tickets.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textSecondary(isDark),
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 28),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(
                        '/universal-loading',
                        arguments: '/user-dashboard',
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E2D93),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Explore Events',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyIllustration(bool isDark) {
    return SizedBox(
      width: 160,
      height: 160,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              color: isDark
                  ? const Color(0xFF252547)
                  : const Color(0xFFCAD1F2),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadow(isDark),
                  blurRadius: 22,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
          ),
          Transform.rotate(
            angle: -0.12,
            child: Container(
              width: 86,
              height: 86,
              decoration: BoxDecoration(
                color: AppColors.card(isDark),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Icon(
                Icons.notifications,
                color: Color(0xFF2434A6),
                size: 28,
              ),
            ),
          ),
          Positioned(
            right: 38,
            bottom: 38,
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: const Color(0xFF0E7C77),
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.card(isDark),
                  width: 3,
                ),
              ),
              child: const Icon(Icons.check, color: Colors.white, size: 15),
            ),
          ),
        ],
      ),
    );
  }
}
