import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

class UserTicketsPage extends StatelessWidget {
  const UserTicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: AppColors.scaffold(isDark),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: AppColors.textPrimary(isDark)),
          onPressed: () {},
        ),
        title: Text(
          'My Tickets',
          style: TextStyle(
            color: AppColors.textPrimary(isDark),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none_rounded,
              color: AppColors.textPrimary(isDark),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/user-notifications');
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(isDark),
              const SizedBox(height: 16),
              _buildFilterChips(isDark),
              const SizedBox(height: 24),
              _buildTicketList(context, isDark),
              const SizedBox(height: 16),
              _buildBottomSummary(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context, isDark),
    );
  }

  Widget _buildSearchBar(bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card(isDark),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border(isDark)),
      ),
      child: TextField(
        style: TextStyle(color: AppColors.textPrimary(isDark)),
        decoration: InputDecoration(
          hintText: 'Search tickets...',
          hintStyle: TextStyle(color: AppColors.textSecondary(isDark)),
          prefixIcon: Icon(Icons.search, color: AppColors.textSecondary(isDark)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }

  Widget _buildFilterChips(bool isDark) {
    final List<String> filters = [
      'All',
      'Open',
      'In Progress',
      'Resolved',
      'Closed',
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: filters.map((filter) {
          final isSelected = filter == 'All';
          return Container(
            margin: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(
                filter,
                style: TextStyle(
                  color: isSelected
                      ? Colors.white
                      : AppColors.textSecondary(isDark),
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              selected: isSelected,
              onSelected: (bool selected) {},
              backgroundColor:
                  isDark ? const Color(0xFF252547) : const Color(0xFFEBECEF),
              selectedColor: const Color(0xFF0F1E7A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              showCheckmark: false,
              side: BorderSide.none,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTicketList(BuildContext context, bool isDark) {
    return Column(
      children: [
        _buildTicketItem(
          context: context,
          id: '#TK-001',
          title: 'Bug in login screen',
          category: 'Technical',
          icon: Icons.category,
          date: 'Oct 24, 2024',
          status: 'Open',
          statusColor: const Color(0xFF6469EE),
          statusBgColor: isDark
              ? const Color(0xFF6469EE).withValues(alpha: 0.2)
              : const Color(0xFFE6E8FD),
          isDark: isDark,
        ),
        const SizedBox(height: 16),
        _buildTicketItem(
          context: context,
          id: '#TK-002',
          title: 'Request for refund',
          category: 'Billing',
          icon: Icons.payments_outlined,
          date: 'Oct 23, 2024',
          status: 'In Progress',
          statusColor: const Color(0xFFC48625),
          statusBgColor: isDark
              ? const Color(0xFFC48625).withValues(alpha: 0.2)
              : const Color(0xFFFEF5E3),
          isDark: isDark,
        ),
        const SizedBox(height: 16),
        _buildTicketItem(
          context: context,
          id: '#TK-003',
          title: 'Payment failed',
          category: 'Billing',
          icon: Icons.payments_outlined,
          date: 'Oct 22, 2024',
          status: 'Resolved',
          statusColor: const Color(0xFF2BAE66),
          statusBgColor: isDark
              ? const Color(0xFF2BAE66).withValues(alpha: 0.2)
              : const Color(0xFFE3F8EB),
          isDark: isDark,
        ),
      ],
    );
  }

  Widget _buildTicketItem({
    required BuildContext context,
    required String id,
    required String title,
    required String category,
    required IconData icon,
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
                    color: AppColors.textSecondary(isDark),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusBgColor,
                    borderRadius: BorderRadius.circular(16),
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
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary(isDark),
              ),
            ),
            const SizedBox(height: 12),
            CustomPaint(
              size: const Size(double.infinity, 1),
              painter: _DashedLinePainter(isDark: isDark),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(icon, size: 16, color: const Color(0xFF6B4EE6)),
                const SizedBox(width: 6),
                Text(
                  category,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary(isDark),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 24),
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 14,
                  color: Color(0xFF6B4EE6),
                ),
                const SizedBox(width: 6),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary(isDark),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSummary() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xFF2C328E),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: -10,
                  bottom: -10,
                  child: Icon(
                    Icons.confirmation_num,
                    size: 60,
                    color: Colors.white.withValues(alpha: 0.1),
                  ),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Open',
                      style: TextStyle(fontSize: 12, color: Colors.white70),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '12',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xFF07484B),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: -10,
                  bottom: -10,
                  child: Icon(
                    Icons.star_rounded,
                    size: 60,
                    color: Colors.white.withValues(alpha: 0.1),
                  ),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Support Rating',
                      style: TextStyle(fontSize: 12, color: Colors.white70),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '4.9',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNav(BuildContext context, bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.navBar(isDark),
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
        selectedItemColor: const Color(0xFF6B4EE6),
        unselectedItemColor:
            isDark ? Colors.grey.shade600 : Colors.grey.shade500,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).pushReplacementNamed(
              '/universal-loading',
              arguments: '/user-dashboard',
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
          const BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF6B4EE6).withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.confirmation_number_outlined),
            ),
            label: 'Tickets',
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.notifications_none_rounded), label: 'Alerts'),
          const BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded), label: 'Profile'),
        ],
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  final bool isDark;
  _DashedLinePainter({this.isDark = false});

  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 4, dashSpace = 4, startX = 0;
    final paint = Paint()
      ..color = isDark ? const Color(0xFF334155) : Colors.grey.shade300
      ..strokeWidth = 1;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
