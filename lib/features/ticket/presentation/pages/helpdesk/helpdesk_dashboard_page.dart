import 'package:flutter/material.dart';
import 'dart:math';

import '../../../../../core/routing/app_router.dart';
import '../../../../../core/theme/app_colors.dart';

class HelpdeskDashboardPage extends StatelessWidget {
  const HelpdeskDashboardPage({super.key});

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
              const SizedBox(height: 24),
              _buildStatusDistribution(isDark),
              const SizedBox(height: 24),
              _buildRecentTicketsHeader(context, isDark),
              const SizedBox(height: 16),
              _buildRecentTicketsList(isDark),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context, isDark),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.menu, color: AppColors.textPrimary(isDark)),
          onPressed: () {},
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        Text(
          "Admin Dashboard",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary(isDark),
          ),
        ),
        Row(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                Navigator.of(context).pushNamed('/helpdesk-notifications');
              },
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Stack(
                  children: [
                    Icon(Icons.notifications_none_rounded, color: AppColors.textPrimary(isDark)),
                    Positioned(
                      right: 2,
                      top: 2,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(color: Colors.redAccent, shape: BoxShape.circle),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            InkWell(
              borderRadius: BorderRadius.circular(18),
              onTap: () {
                Navigator.of(context).pushNamed(AppRouter.helpdeskProfile);
              },
              child: const CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'),
              ),
            ),
          ],
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
      childAspectRatio: 1.4,
      children: [
        _buildStatCard(title: 'Total Tickets', count: '1,284', icon: Icons.confirmation_number, iconColor: const Color(0xFF6B4EE6), badgeText: '+12%', badgeColor: AppColors.textSecondary(isDark), isDark: isDark),
        _buildStatCard(title: 'Open', count: '156', icon: Icons.hourglass_empty, iconColor: const Color(0xFFE6A23C), badgeText: 'Active', badgeColor: const Color(0xFFE6A23C), isDark: isDark),
        _buildStatCard(title: 'In Progress', count: '42', icon: Icons.sync, iconColor: const Color(0xFFE65C00), badgeText: 'Urgent', badgeColor: const Color(0xFFE65C00), isDark: isDark),
        _buildStatCard(title: 'Closed', count: '1,086', icon: Icons.check_circle_outline, iconColor: AppColors.textSecondary(isDark), badgeText: 'Today', badgeColor: AppColors.textSecondary(isDark), isDark: isDark),
      ],
    );
  }

  Widget _buildStatCard({required String title, required String count, required IconData icon, required Color iconColor, required String badgeText, required Color badgeColor, required bool isDark}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card(isDark),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: AppColors.shadow(isDark), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Icon(icon, color: iconColor, size: 24),
            Text(badgeText, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: badgeColor)),
          ]),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: TextStyle(fontSize: 12, color: AppColors.textSecondary(isDark), fontWeight: FontWeight.w500)),
            const SizedBox(height: 4),
            Text(count, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.textPrimary(isDark))),
          ]),
        ],
      ),
    );
  }

  Widget _buildStatusDistribution(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card(isDark),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: AppColors.shadow(isDark), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Status Distribution', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary(isDark))),
          const SizedBox(height: 20),
          Row(
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(size: const Size(100, 100), painter: DonutChartPainter(isDark: isDark)),
                    Text('82%', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary(isDark))),
                  ],
                ),
              ),
              const SizedBox(width: 32),
              Expanded(
                child: Column(
                  children: [
                    _buildLegendItem('Closed', '45%', const Color(0xFF6B4EE6), isDark),
                    const SizedBox(height: 8),
                    _buildLegendItem('Open', '25%', const Color(0xFFE6A23C), isDark),
                    const SizedBox(height: 8),
                    _buildLegendItem('Active', '15%', const Color(0xFFE65C00), isDark),
                    const SizedBox(height: 8),
                    _buildLegendItem('Waiting', '15%', AppColors.textSecondary(isDark), isDark),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String title, String percentage, Color color, bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
          const SizedBox(width: 8),
          Text(title, style: TextStyle(fontSize: 12, color: AppColors.textSecondary(isDark))),
        ]),
        Text(percentage, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textPrimary(isDark))),
      ],
    );
  }

  Widget _buildRecentTicketsHeader(BuildContext context, bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Recent Tickets', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary(isDark))),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/universal-loading', arguments: '/helpdesk-tickets');
          },
          style: TextButton.styleFrom(foregroundColor: const Color(0xFF6B4EE6), padding: EdgeInsets.zero, minimumSize: Size.zero, tapTargetSize: MaterialTapTargetSize.shrinkWrap),
          child: const Text('VIEW ALL', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
        ),
      ],
    );
  }

  Widget _buildRecentTicketsList(bool isDark) {
    return Column(
      children: [
        _buildTicketListItem(avatarUrl: 'https://i.pravatar.cc/150?img=33', title: 'Payment gateway error', assignee: 'Assigned to MarcusChen', ticketId: '#T-942', status: 'OPEN', statusColor: const Color(0xFFE6A23C), isDark: isDark),
        const SizedBox(height: 12),
        _buildTicketListItem(avatarUrl: 'https://i.pravatar.cc/150?img=47', title: 'QR Code not scanning', assignee: 'Assigned to Sarah J.', ticketId: '#T-941', status: 'PROGRESS', statusColor: const Color(0xFFE65C00), isDark: isDark),
        const SizedBox(height: 12),
        _buildTicketListItem(avatarUrl: 'https://i.pravatar.cc/150?img=12', title: 'Event postponement q...', assignee: 'Assigned to Alex Volkov', ticketId: '#T-940', status: 'CLOSED', statusColor: AppColors.textSecondary(isDark), isDark: isDark),
        const SizedBox(height: 12),
        _buildTicketListItem(avatarUrl: 'https://i.pravatar.cc/150?img=59', title: 'Bulk purchase discount', assignee: 'Assigned to Elena R.', ticketId: '#T-939', status: 'OPEN', statusColor: const Color(0xFFE6A23C), isDark: isDark),
      ],
    );
  }

  Widget _buildTicketListItem({required String avatarUrl, required String title, required String assignee, required String ticketId, required String status, required Color statusColor, required bool isDark}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.card(isDark),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: AppColors.shadow(isDark), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(radius: 20, backgroundImage: NetworkImage(avatarUrl)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary(isDark)), maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 4),
              Text(assignee, style: TextStyle(fontSize: 10, color: AppColors.textSecondary(isDark))),
            ]),
          ),
          const SizedBox(width: 8),
          Column(crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(ticketId, style: TextStyle(fontSize: 10, color: AppColors.textSecondary(isDark))),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(border: Border.all(color: statusColor.withValues(alpha: 0.5)), borderRadius: BorderRadius.circular(4)),
              child: Text(status, style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: statusColor)),
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context, bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.navBar(isDark),
        boxShadow: [BoxShadow(color: AppColors.shadow(isDark), blurRadius: 20, offset: const Offset(0, -5))],
      ),
      child: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        selectedItemColor: const Color(0xFF6B4EE6),
        unselectedItemColor: isDark ? Colors.grey.shade600 : Colors.grey.shade500,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) {
          if (index == 1) Navigator.of(context).pushReplacementNamed(AppRouter.universalLoading, arguments: AppRouter.helpdeskTickets);
          if (index == 2) Navigator.of(context).pushNamed(AppRouter.helpdeskNotifications);
          if (index == 3) Navigator.of(context).pushReplacementNamed(AppRouter.universalLoading, arguments: AppRouter.helpdeskProfile);
        },
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(color: const Color(0xFF6B4EE6).withValues(alpha: 0.14), borderRadius: BorderRadius.circular(12)),
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

class DonutChartPainter extends CustomPainter {
  final bool isDark;
  DonutChartPainter({this.isDark = false});

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 14.0;
    Rect rect = Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: (size.width - strokeWidth) / 2);
    Paint paint = Paint()..style = PaintingStyle.stroke..strokeWidth = strokeWidth..strokeCap = StrokeCap.round;

    paint.color = isDark ? const Color(0xFF334155) : Colors.grey.shade200;
    canvas.drawArc(rect, 0, 2 * pi, false, paint);

    paint.color = const Color(0xFFE65C00);
    double startAngle = -pi / 2;
    double sweepAngle = 2 * pi * 0.15;
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);

    paint.color = const Color(0xFFE6A23C);
    startAngle += sweepAngle;
    sweepAngle = 2 * pi * 0.25;
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);

    paint.color = const Color(0xFF6B4EE6);
    startAngle += sweepAngle;
    sweepAngle = 2 * pi * 0.45;
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
