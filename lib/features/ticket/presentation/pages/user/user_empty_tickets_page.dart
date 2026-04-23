import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

class UserEmptyTicketsPage extends StatelessWidget {
  const UserEmptyTicketsPage({super.key});

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
            icon: Icon(Icons.notifications_none_rounded, color: AppColors.textPrimary(isDark)),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
              child: _buildSearchBar(isDark),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildFilterChips(isDark),
            ),
            Expanded(child: _buildEmptyStateContent(context, isDark)),
          ],
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
          hintText: 'Search your tickets...',
          hintStyle: TextStyle(color: AppColors.textSecondary(isDark), fontSize: 14),
          prefixIcon: Icon(Icons.search, color: AppColors.textSecondary(isDark)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }

  Widget _buildFilterChips(bool isDark) {
    final List<String> filters = ['All Tickets', 'Upcoming', 'Past', 'Archived'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: filters.map((filter) {
          final isSelected = filter == 'All Tickets';
          return Container(
            margin: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(
                filter,
                style: TextStyle(
                  color: isSelected ? Colors.white : AppColors.textSecondary(isDark),
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
              selected: isSelected,
              onSelected: (bool selected) {},
              backgroundColor: isDark ? const Color(0xFF252547) : const Color(0xFFEBECEF),
              selectedColor: const Color(0xFF0F1E7A),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              showCheckmark: false,
              side: BorderSide.none,
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildEmptyStateContent(BuildContext context, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: AppColors.card(isDark),
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF6B4EE6).withValues(alpha: 0.05),
                  blurRadius: 40,
                  spreadRadius: 20,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.confirmation_num, size: 64, color: Color(0xFF0F1E7A)),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.search, size: 20, color: Colors.teal.shade700),
                    const SizedBox(width: 8),
                    Icon(Icons.mail, size: 20, color: Colors.indigo.shade400),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 48),
          Text(
            'No tickets yet',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary(isDark),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Your journey hasn\'t started! Browse events\nor create a manual entry to get organized.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary(isDark),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 48),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed('/user-create-ticket');
              },
              icon: const Icon(Icons.add, size: 20, color: Colors.white),
              label: const Text(
                'Create Your First Ticket',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0F1E7A),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
            ),
          ),
          const SizedBox(height: 48),
        ],
      ),
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
        unselectedItemColor: isDark ? Colors.grey.shade600 : Colors.grey.shade500,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).pushReplacementNamed('/universal-loading', arguments: '/user-dashboard');
          }
          if (index == 2) Navigator.of(context).pushNamed('/user-notifications');
          if (index == 3) {
            Navigator.of(context).pushReplacementNamed('/universal-loading', arguments: '/user-profile');
          }
        },
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(color: const Color(0xFF6B4EE6).withValues(alpha: 0.14), borderRadius: BorderRadius.circular(12)),
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
