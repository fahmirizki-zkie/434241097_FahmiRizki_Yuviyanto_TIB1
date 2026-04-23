import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

class UserTicketDetailPage extends StatelessWidget {
  const UserTicketDetailPage({super.key});

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
        titleSpacing: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '#TK-001',
              style: TextStyle(
                color: AppColors.textPrimary(isDark),
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 2),
            const Row(
              children: [
                Icon(Icons.circle, size: 7, color: Color(0xFF2E4BDE)),
                SizedBox(width: 6),
                Text(
                  'In Progress',
                  style: TextStyle(
                    color: Color(0xFF5F6AA6),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert, color: AppColors.textPrimary(isDark)),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTicketDetailsCard(isDark),
                    const SizedBox(height: 18),
                    _buildTrackingSection(isDark),
                    const SizedBox(height: 18),
                    _buildActivitySection(isDark),
                  ],
                ),
              ),
            ),
            _buildReplyBar(isDark),
          ],
        ),
      ),
    );
  }

  Widget _buildTicketDetailsCard(bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card(isDark),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border(isDark)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info, size: 16, color: AppColors.textPrimary(isDark)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Ticket Details',
                  style: TextStyle(
                    color: AppColors.textPrimary(isDark),
                    fontWeight: FontWeight.w700,
                    fontSize: 24 / 1.5,
                  ),
                ),
              ),
              Icon(Icons.expand_less, color: AppColors.textSecondary(isDark)),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _DetailItem(label: 'Category', value: 'Technical', isDark: isDark),
              ),
              Expanded(
                child: _DetailItem(
                  label: 'Priority',
                  value: 'High',
                  valueColor: const Color(0xFFC81F33),
                  showDot: true,
                  isDark: isDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _DetailItem(label: 'Created', value: 'Oct 24, 2024', isDark: isDark),
              ),
              Expanded(
                child: _DetailItem(label: 'Last Updated', value: '2h ago', isDark: isDark),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTrackingSection(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'TRACKING',
          style: TextStyle(
            color: AppColors.textSecondary(isDark),
            fontWeight: FontWeight.w600,
            fontSize: 12,
            letterSpacing: 0.4,
          ),
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            _TrackingStep(label: 'Open', isDone: true, isActive: false, isDark: isDark),
            _TrackingConnector(active: true, isDark: isDark),
            _TrackingStep(label: 'In Progress', isDone: false, isActive: true, isDark: isDark),
            _TrackingConnector(active: false, isDark: isDark),
            _TrackingStep(label: 'Resolved', isDone: false, isActive: false, isDark: isDark),
            _TrackingConnector(active: false, isDark: isDark),
            _TrackingStep(label: 'Closed', isDone: false, isActive: false, isDark: isDark),
          ],
        ),
      ],
    );
  }

  Widget _buildActivitySection(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ACTIVITY',
          style: TextStyle(
            color: AppColors.textSecondary(isDark),
            fontWeight: FontWeight.w600,
            fontSize: 12,
            letterSpacing: 0.4,
          ),
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerRight,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 265),
            child: const _ChatBubble(
              background: Color(0xFF26369A),
              textColor: Colors.white,
              message:
                  'Hi, I\'m having trouble accessing the server. It keeps timing out every time I try to connect from the office network.',
            ),
          ),
        ),
        const SizedBox(height: 6),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            '10:42 AM',
            style: TextStyle(color: AppColors.textSecondary(isDark), fontSize: 11),
          ),
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                color: AppColors.textSecondary(isDark),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Status changed to In Progress',
              style: TextStyle(
                color: AppColors.textSecondary(isDark),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '2h ago',
              style: TextStyle(color: AppColors.textSecondary(isDark), fontSize: 12),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            CircleAvatar(
              radius: 10,
              backgroundColor: isDark ? const Color(0xFF334155) : Colors.grey.shade300,
              child: Icon(
                Icons.person,
                size: 12,
                color: AppColors.textPrimary(isDark),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Support Agent',
              style: TextStyle(
                color: AppColors.textPrimary(isDark),
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 290),
          child: _ChatBubble(
            background: AppColors.card(isDark),
            textColor: AppColors.textSecondary(isDark),
            borderColor: AppColors.border(isDark),
            message:
                'Hello! I\'ve received your ticket. I\'m currently checking the network logs for your office IP. Could you please confirm if you\'re using a VPN?',
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 86,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              colors: [Color(0xFF161E42), Color(0xFF102032)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Center(
            child: Icon(Icons.search, color: Colors.white70, size: 26),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          '11:15 AM',
          style: TextStyle(color: AppColors.textSecondary(isDark), fontSize: 11),
        ),
        const SizedBox(height: 14),
        Align(
          alignment: Alignment.centerRight,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 265),
            child: const _ChatBubble(
              background: Color(0xFF26369A),
              textColor: Colors.white,
              message:
                  'Thanks for the quick response. No, I am not using a VPN. I\'ve attached a screenshot of the error message I\'m getting.',
            ),
          ),
        ),
        const SizedBox(height: 6),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            '11:20 AM',
            style: TextStyle(color: AppColors.textSecondary(isDark), fontSize: 11),
          ),
        ),
      ],
    );
  }

  Widget _buildReplyBar(bool isDark) {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(14, 8, 14, 10),
        decoration: BoxDecoration(
          color: AppColors.card(isDark),
          border: Border(top: BorderSide(color: AppColors.border(isDark))),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.attach_file, color: Color(0xFF5261B0)),
            ),
            Expanded(
              child: TextField(
                style: TextStyle(color: AppColors.textPrimary(isDark)),
                decoration: InputDecoration(
                  hintText: 'Write a reply...',
                  hintStyle: TextStyle(color: AppColors.textSecondary(isDark)),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  filled: true,
                  fillColor: isDark
                      ? const Color(0xFF252547)
                      : const Color(0xFFF4F5F9),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                    borderSide: BorderSide(color: AppColors.border(isDark)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                    borderSide: const BorderSide(color: Color(0xFF5261B0)),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFF1E2C92),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.send, color: Colors.white, size: 20),
                padding: EdgeInsets.zero,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailItem extends StatelessWidget {
  const _DetailItem({
    required this.label,
    required this.value,
    this.valueColor,
    this.showDot = false,
    required this.isDark,
  });

  final String label;
  final String value;
  final Color? valueColor;
  final bool showDot;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final effectiveColor = valueColor ?? AppColors.textPrimary(isDark);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppColors.textSecondary(isDark),
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            if (showDot) ...[
              Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  color: effectiveColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 5),
            ],
            Text(
              value,
              style: TextStyle(
                color: effectiveColor,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _TrackingStep extends StatelessWidget {
  const _TrackingStep({
    required this.label,
    required this.isDone,
    required this.isActive,
    required this.isDark,
  });

  final String label;
  final bool isDone;
  final bool isActive;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final Color color = isActive || isDone
        ? const Color(0xFF2841C6)
        : (isDark ? const Color(0xFF334155) : const Color(0xFFCCD1E2));

    return Expanded(
      child: Column(
        children: [
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isDone
                  ? const Color(0xFF2841C6)
                  : AppColors.card(isDark),
              border: Border.all(color: color, width: 3),
            ),
            child: isDone
                ? const Icon(Icons.check, size: 12, color: Colors.white)
                : null,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: isActive
                  ? const Color(0xFF2841C6)
                  : AppColors.textSecondary(isDark),
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _TrackingConnector extends StatelessWidget {
  const _TrackingConnector({required this.active, required this.isDark});

  final bool active;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 2,
        margin: const EdgeInsets.only(bottom: 20),
        color: active
            ? const Color(0xFF2841C6)
            : (isDark ? const Color(0xFF334155) : const Color(0xFFDDE1EE)),
      ),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  const _ChatBubble({
    required this.background,
    required this.textColor,
    required this.message,
    this.borderColor,
  });

  final Color background;
  final Color textColor;
  final String message;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(12),
        border: borderColor == null
            ? null
            : Border.all(color: borderColor!, width: 1),
      ),
      child: Text(
        message,
        style: TextStyle(
          color: textColor,
          fontSize: 13,
          height: 1.35,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
