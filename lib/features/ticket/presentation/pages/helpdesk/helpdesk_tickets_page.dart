import 'package:flutter/material.dart';

import '../../../../../core/routing/app_router.dart';
import '../../../../../core/theme/app_colors.dart';

class HelpdeskTicketsPage extends StatefulWidget {
  const HelpdeskTicketsPage({super.key, this.initiallyEmpty = false});

  final bool initiallyEmpty;

  @override
  State<HelpdeskTicketsPage> createState() => _HelpdeskTicketsPageState();
}

class _HelpdeskTicketsPageState extends State<HelpdeskTicketsPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  _TicketFilter _selectedFilter = _TicketFilter.all;
  late List<_AdminTicket> _allTickets;

  static const List<_AdminTicket> _seedTickets = [
    _AdminTicket(id: '#TK-8942', time: '2 hours ago', title: 'Payment gateway timeout on checkout', priority: 'CRITICAL', status: 'OPEN', avatarUrl: 'https://i.pravatar.cc/150?img=43'),
    _AdminTicket(id: '#TK-8940', time: '5 hours ago', title: 'Request for ticket refund policy documentation', priority: 'MEDIUM', status: 'IN PROGRESS', avatarUrl: 'https://i.pravatar.cc/150?img=12'),
    _AdminTicket(id: '#TK-8938', time: 'Yesterday', title: 'Cannot download PDF receipt for Order #5521', priority: 'LOW', status: 'RESOLVED', avatarUrl: 'https://i.pravatar.cc/150?img=47'),
    _AdminTicket(id: '#TK-8935', time: '2 days ago', title: 'UI glitch on mobile view for event map', priority: 'HIGH', status: 'OPEN', avatarUrl: 'https://i.pravatar.cc/150?img=59'),
  ];

  @override
  void initState() {
    super.initState();
    _allTickets = widget.initiallyEmpty ? <_AdminTicket>[] : List.of(_seedTickets);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  List<_AdminTicket> get _filteredTickets {
    final query = _searchController.text.trim().toLowerCase();
    return _allTickets.where((ticket) {
      final bool matchFilter = switch (_selectedFilter) {
        _TicketFilter.all => true,
        _TicketFilter.open => ticket.status == 'OPEN',
        _TicketFilter.inProgress => ticket.status == 'IN PROGRESS',
        _TicketFilter.resolved => ticket.status == 'RESOLVED',
      };
      final bool matchQuery = query.isEmpty ? true : ticket.id.toLowerCase().contains(query) || ticket.title.toLowerCase().contains(query) || ticket.status.toLowerCase().contains(query);
      return matchFilter && matchQuery;
    }).toList();
  }

  bool get _isQueueEmpty => _allTickets.isEmpty;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final tickets = _filteredTickets;

    return Scaffold(
      backgroundColor: AppColors.scaffold(isDark),
      appBar: AppBar(
        backgroundColor: AppColors.appBarBg(isDark),
        elevation: 0,
        centerTitle: false,
        leading: IconButton(icon: Icon(Icons.menu, color: AppColors.textPrimary(isDark)), onPressed: () {}),
        title: Text(
          _isQueueEmpty ? 'All Tickets' : 'Tickets',
          style: TextStyle(color: AppColors.textPrimary(isDark), fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => Navigator.of(context).pushNamed(AppRouter.helpdeskNotifications),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Stack(
                children: [
                  Icon(Icons.notifications_none_rounded, color: AppColors.textPrimary(isDark)),
                  Positioned(right: 2, top: 2, child: Container(padding: const EdgeInsets.all(4), decoration: const BoxDecoration(color: Colors.redAccent, shape: BoxShape.circle))),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(18),
              onTap: () => Navigator.of(context).pushNamed(AppRouter.helpdeskProfile),
              child: const CircleAvatar(radius: 16, backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11')),
            ),
          ),
        ],
      ),
      body: _isQueueEmpty ? _buildEmptyState(isDark) : _buildTicketsState(tickets, isDark),
      bottomNavigationBar: _buildBottomNav(context, isDark),
    );
  }

  Widget _buildTicketsState(List<_AdminTicket> tickets, bool isDark) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text('All Tickets', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textSecondary(isDark))),
          ),
          const SizedBox(height: 12),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: _buildSearchBar(isDark)),
          const SizedBox(height: 16),
          Padding(padding: const EdgeInsets.only(left: 20), child: _buildFilterChips(isDark)),
          const SizedBox(height: 20),
          if (tickets.isEmpty)
            _buildNoSearchResult(isDark)
          else
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [for (int i = 0; i < tickets.length; i++) ...[_buildTicketItem(context, tickets[i], isDark), if (i < tickets.length - 1) const SizedBox(height: 16)]]),
            ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildNoSearchResult(bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(color: AppColors.card(isDark), borderRadius: BorderRadius.circular(14), border: Border.all(color: AppColors.border(isDark))),
        child: Text('No ticket matches your filter. Try another keyword or status.', textAlign: TextAlign.center, style: TextStyle(color: AppColors.textSecondary(isDark), fontWeight: FontWeight.w500)),
      ),
    );
  }

  Widget _buildSearchBar(bool isDark) {
    return Container(
      decoration: BoxDecoration(color: AppColors.card(isDark), borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.border(isDark))),
      child: TextField(
        controller: _searchController,
        focusNode: _searchFocusNode,
        onChanged: (_) => setState(() {}),
        style: TextStyle(color: AppColors.textPrimary(isDark)),
        decoration: InputDecoration(
          hintText: 'Search ticket #, requester, or keyword...',
          hintStyle: TextStyle(color: AppColors.textSecondary(isDark), fontSize: 14),
          prefixIcon: Icon(Icons.search, color: AppColors.textSecondary(isDark)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }

  Widget _buildFilterChips(bool isDark) {
    final filters = <_TicketFilter>[_TicketFilter.all, _TicketFilter.open, _TicketFilter.inProgress, _TicketFilter.resolved];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: filters.map((filter) {
          final isSelected = _selectedFilter == filter;
          return Container(
            margin: const EdgeInsets.only(right: 12),
            child: FilterChip(
              label: Text(filter.label, style: TextStyle(color: isSelected ? Colors.white : AppColors.textSecondary(isDark), fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal)),
              selected: isSelected,
              onSelected: (_) => setState(() => _selectedFilter = filter),
              backgroundColor: AppColors.card(isDark),
              selectedColor: const Color(0xFF2C328E),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: BorderSide(color: isSelected ? const Color(0xFF2C328E) : AppColors.border(isDark))),
              showCheckmark: false,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTicketItem(BuildContext context, _AdminTicket ticket, bool isDark) {
    final _BadgeStyle priorityStyle = _priorityStyle(ticket.priority);
    final _BadgeStyle statusStyle = _statusStyle(ticket.status);

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => Navigator.of(context).pushNamed(AppRouter.helpdeskTicketDetail),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: AppColors.card(isDark), borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: AppColors.shadow(isDark), blurRadius: 10, offset: const Offset(0, 4))]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Text(ticket.id, style: const TextStyle(color: Color(0xFF6B4EE6), fontWeight: FontWeight.bold, fontSize: 13)),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 6), child: Text('•', style: TextStyle(color: AppColors.textSecondary(isDark)))),
              Text(ticket.time, style: TextStyle(color: AppColors.textSecondary(isDark), fontSize: 12, fontWeight: FontWeight.w500)),
            ]),
            const SizedBox(height: 8),
            Text(ticket.title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.textPrimary(isDark), height: 1.3)),
            const SizedBox(height: 12),
            Row(children: [_buildBadge(ticket.priority, priorityStyle), const SizedBox(width: 8), _buildBadge(ticket.status, statusStyle)]),
            const SizedBox(height: 16),
            CircleAvatar(radius: 14, backgroundImage: NetworkImage(ticket.avatarUrl)),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge(String text, _BadgeStyle style) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: style.background, borderRadius: BorderRadius.circular(6)),
      child: Text(text, style: TextStyle(color: style.foreground, fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
    );
  }

  _BadgeStyle _priorityStyle(String priority) {
    switch (priority) {
      case 'CRITICAL': return const _BadgeStyle(foreground: Color(0xFFE53E3E), background: Color(0xFFFED7D7));
      case 'HIGH': return const _BadgeStyle(foreground: Color(0xFFDD6B20), background: Color(0xFFFEEBC8));
      case 'MEDIUM': return const _BadgeStyle(foreground: Color(0xFF6B4EE6), background: Color(0xFFEBE6FF));
      default: return const _BadgeStyle(foreground: Color(0xFF718096), background: Color(0xFFEDF2F7));
    }
  }

  _BadgeStyle _statusStyle(String status) {
    switch (status) {
      case 'OPEN': return const _BadgeStyle(foreground: Color(0xFF6B4EE6), background: Color(0xFFEBE6FF));
      case 'IN PROGRESS': return const _BadgeStyle(foreground: Color(0xFFD69E2E), background: Color(0xFFFEFCBF));
      default: return const _BadgeStyle(foreground: Color(0xFF38A169), background: Color(0xFFC6F6D5));
    }
  }

  Widget _buildEmptyState(bool isDark) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 16),
            decoration: BoxDecoration(color: AppColors.card(isDark), borderRadius: BorderRadius.circular(16), border: Border.all(color: AppColors.border(isDark))),
            child: Column(
              children: [
                _buildEmptyIllustration(isDark),
                const SizedBox(height: 14),
                Text('No tickets found', style: TextStyle(fontSize: 30 / 1.2, fontWeight: FontWeight.w700, color: AppColors.textPrimary(isDark))),
                const SizedBox(height: 8),
                Text(
                  'You\'ve cleared your queue! All customer inquiries and support requests have been resolved. Take a moment to celebrate.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: AppColors.textSecondary(isDark), height: 1.35),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: ElevatedButton.icon(
                    onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Create ticket flow is coming soon.'))),
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF202A8D), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)), elevation: 0),
                    icon: const Icon(Icons.add, size: 18),
                    label: const Text('Create New Ticket', style: TextStyle(fontWeight: FontWeight.w700)),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 42,
                  child: OutlinedButton.icon(
                    onPressed: () => setState(() { _allTickets = List.of(_seedTickets); _selectedFilter = _TicketFilter.all; _searchController.clear(); }),
                    style: OutlinedButton.styleFrom(foregroundColor: AppColors.textSecondary(isDark), side: BorderSide(color: AppColors.border(isDark)), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)), elevation: 0),
                    icon: const Icon(Icons.refresh, size: 18),
                    label: const Text('Check for Updates', style: TextStyle(fontWeight: FontWeight.w700)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _buildSummaryStat(icon: Icons.check, iconBg: const Color(0xFFE8ECFF), iconColor: const Color(0xFF4A58CF), label: 'Resolved Today', value: '14 Tickets', isDark: isDark),
          const SizedBox(height: 10),
          _buildSummaryStat(icon: Icons.timer_outlined, iconBg: const Color(0xFFDFFBFF), iconColor: const Color(0xFF1B8CA4), label: 'Avg. Response', value: '12m 40s', isDark: isDark),
          const SizedBox(height: 10),
          _buildSummaryStat(icon: Icons.favorite, iconBg: const Color(0xFFFFEBEE), iconColor: const Color(0xFFD2476A), label: 'Satisfaction', value: '98%', isDark: isDark),
        ],
      ),
    );
  }

  Widget _buildSummaryStat({required IconData icon, required Color iconBg, required Color iconColor, required String label, required String value, required bool isDark}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 11, 12, 11),
      decoration: BoxDecoration(color: AppColors.card(isDark), borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.border(isDark))),
      child: Row(
        children: [
          Container(width: 32, height: 32, decoration: BoxDecoration(color: iconBg, borderRadius: BorderRadius.circular(10)), child: Icon(icon, size: 18, color: iconColor)),
          const SizedBox(width: 10),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(label, style: TextStyle(color: AppColors.textSecondary(isDark), fontSize: 11, fontWeight: FontWeight.w500)),
            const SizedBox(height: 2),
            Text(value, style: TextStyle(color: AppColors.textPrimary(isDark), fontSize: 19 / 1.2, fontWeight: FontWeight.w700)),
          ]),
        ],
      ),
    );
  }

  Widget _buildEmptyIllustration(bool isDark) {
    return Container(
      height: 115,
      width: double.infinity,
      decoration: BoxDecoration(color: isDark ? const Color(0xFF252547) : const Color(0xFFF1F2FB), borderRadius: BorderRadius.circular(12)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(left: 56, bottom: 18, child: Container(width: 34, height: 34, decoration: const BoxDecoration(color: Color(0xFFD5F1F6), shape: BoxShape.circle), child: const Icon(Icons.sentiment_satisfied_alt, color: Color(0xFF20495A), size: 18))),
          Positioned(right: 58, top: 20, child: Transform.rotate(angle: 0.24, child: Container(width: 32, height: 32, decoration: BoxDecoration(color: const Color(0xFFE2E4F7), borderRadius: BorderRadius.circular(7)), child: const Icon(Icons.confirmation_number_outlined, color: Color(0xFF2C328E), size: 17)))),
          Container(
            width: 66, height: 66,
            decoration: BoxDecoration(color: AppColors.card(isDark), shape: BoxShape.circle, boxShadow: [BoxShadow(color: AppColors.shadow(isDark), blurRadius: 14, offset: const Offset(0, 3))]),
            child: const Icon(Icons.check_circle, color: Color(0xFF1A2C91), size: 34),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context, bool isDark) {
    return Container(
      decoration: BoxDecoration(color: AppColors.navBar(isDark), boxShadow: [BoxShadow(color: AppColors.shadow(isDark), blurRadius: 20, offset: const Offset(0, -5))]),
      child: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
        selectedItemColor: const Color(0xFF6B4EE6),
        unselectedItemColor: isDark ? Colors.grey.shade600 : Colors.grey.shade500,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
        onTap: (index) {
          if (index == 0) Navigator.of(context).pushReplacementNamed(AppRouter.universalLoading, arguments: AppRouter.helpdeskDashboard);
          if (index == 2) Navigator.of(context).pushNamed(AppRouter.helpdeskNotifications);
          if (index == 3) Navigator.of(context).pushReplacementNamed(AppRouter.universalLoading, arguments: AppRouter.helpdeskProfile);
        },
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
            icon: Container(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), decoration: BoxDecoration(color: const Color(0xFF6B4EE6).withValues(alpha: 0.14), borderRadius: BorderRadius.circular(12)), child: const Icon(Icons.confirmation_number_outlined)),
            label: 'Tickets',
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.notifications_none_rounded), label: 'Alerts'),
          const BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded), label: 'Profile'),
        ],
      ),
    );
  }
}

enum _TicketFilter {
  all('All'), open('Open'), inProgress('In Progress'), resolved('Resolved');
  const _TicketFilter(this.label);
  final String label;
}

class _AdminTicket {
  const _AdminTicket({required this.id, required this.time, required this.title, required this.priority, required this.status, required this.avatarUrl});
  final String id;
  final String time;
  final String title;
  final String priority;
  final String status;
  final String avatarUrl;
}

class _BadgeStyle {
  const _BadgeStyle({required this.foreground, required this.background});
  final Color foreground;
  final Color background;
}
