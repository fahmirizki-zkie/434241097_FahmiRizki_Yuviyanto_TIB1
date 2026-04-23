import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

class UserDashboardPage extends StatelessWidget {
  const UserDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: AppColors.scaffold(isDark),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context, isDark),
              const SizedBox(height: 24),
              _buildStatsGrid(isDark),
              const SizedBox(height: 32),
              _buildRecentTicketsHeader(context, isDark),
              const SizedBox(height: 16),
              _buildRecentTicketsList(context, isDark),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [
              Color(0xFF6B4EE6),
              Color(0xFFB84EE6),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF6B4EE6).withValues(alpha: 0.4),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/user-create-ticket');
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: const Icon(Icons.add, color: Colors.white, size: 28),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: _buildBottomNavigationBar(context, isDark),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(
                'https://i.pravatar.cc/150?img=11',
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Let's clear your queue,",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary(isDark),
                  ),
                ),
                const Text(
                  "Rizky!",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6B4EE6),
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.card(isDark),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow(isDark),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(
              Icons.notifications_none_rounded,
              color: AppColors.textPrimary(isDark),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/user-notifications');
            },
          ),
        ),
      ],
    );
  }

  Widget _buildStatsGrid(bool isDark) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.5,
      children: [
        _buildStatCard(
          'TOTAL TICKETS',
          '12',
          const Color(0xFF6B4EE6),
          Icons.more_vert,
          isDark,
        ),
        _buildStatCard(
          'OPEN',
          '4',
          const Color(0xFF6B4EE6),
          Icons.mail_outline,
          isDark,
        ),
        _buildStatCard(
          'IN PROGRESS',
          '2',
          const Color(0xFFE6A23C),
          Icons.sync,
          isDark,
        ),
        _buildStatCard(
          'RESOLVED',
          '6',
          const Color(0xFF67C23A),
          Icons.check_circle_outline,
          isDark,
        ),
      ],
    );
  }

  Widget _buildStatCard(
    String title,
    String count,
    Color valueColor,
    IconData bgIcon,
    bool isDark,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card(isDark),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow(isDark),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -10,
            top: -10,
            child: Icon(
              bgIcon,
              size: 48,
              color: (isDark ? Colors.white : Colors.grey).withValues(alpha: 0.1),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textSecondary(isDark),
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                count,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: valueColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRecentTicketsHeader(BuildContext context, bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Tickets',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary(isDark),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Updated 2 mins ago',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary(isDark),
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/user-tickets');
          },
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF6B4EE6),
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Row(
            children: [
              Text('See All', style: TextStyle(fontWeight: FontWeight.bold)),
              Icon(Icons.chevron_right, size: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRecentTicketsList(BuildContext context, bool isDark) {
    return Column(
      children: [
        _buildTicketItem(
          context: context,
          id: '#TK-001',
          title: 'Bug in login screen',
          date: 'Oct 24, 2024',
          status: 'OPEN',
          statusColor: const Color(0xFF6B4EE6),
          statusBgColor: const Color(0xFF6B4EE6).withValues(alpha: 0.1),
          isDark: isDark,
        ),
        const SizedBox(height: 12),
        _buildTicketItem(
          context: context,
          id: '#TK-002',
          title: 'Request for refund',
          date: 'Oct 23, 2024',
          status: 'IN PROGRESS',
          statusColor: const Color(0xFFE6A23C),
          statusBgColor: const Color(0xFFE6A23C).withValues(alpha: 0.1),
          isDark: isDark,
        ),
        const SizedBox(height: 12),
        _buildTicketItem(
          context: context,
          id: '#TK-003',
          title: 'Payment failed',
          date: 'Oct 22, 2024',
          status: 'RESOLVED',
          statusColor: const Color(0xFF67C23A),
          statusBgColor: const Color(0xFF67C23A).withValues(alpha: 0.1),
          isDark: isDark,
        ),
      ],
    );
  }

  Widget _buildTicketItem({
    required BuildContext context,
    required String id,
    required String title,
    required String date,
    required String status,
    required Color statusColor,
    required Color statusBgColor,
    required bool isDark,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.of(context).pushNamed('/user-ticket-detail');
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.card(isDark),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow(isDark),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  id,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusBgColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: statusColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary(isDark),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  size: 14,
                  color: AppColors.textSecondary(isDark),
                ),
                const SizedBox(width: 6),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary(isDark),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context, bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.navBar(isDark),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow(isDark),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        selectedItemColor: const Color(0xFF6B4EE6),
        unselectedItemColor:
            isDark ? Colors.grey.shade600 : Colors.grey.shade400,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).pushReplacementNamed(
              '/universal-loading',
              arguments: '/user-dashboard',
            );
          }
          if (index == 1) {
            Navigator.of(context).pushReplacementNamed(
              '/universal-loading',
              arguments: '/user-tickets',
            );
          }
          if (index == 2) {
            Navigator.of(context).pushNamed('/user-notifications');
          }
          if (index == 3) {
            Navigator.of(context).pushReplacementNamed(
              '/universal-loading',
              arguments: '/user-profile',
            );
          }
        },
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF6B4EE6).withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.home_outlined),
            ),
            label: 'Home',
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.confirmation_number_outlined), label: 'Tickets'),
          const BottomNavigationBarItem(icon: Icon(Icons.notifications_none_rounded), label: 'Alerts'),
          const BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded), label: 'Profile'),
        ],
      ),
    );
  }
}
