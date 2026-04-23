import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

class HelpdeskTicketDetailPage extends StatefulWidget {
  const HelpdeskTicketDetailPage({super.key});

  @override
  State<HelpdeskTicketDetailPage> createState() => _HelpdeskTicketDetailPageState();
}

class _HelpdeskTicketDetailPageState extends State<HelpdeskTicketDetailPage> {
  final TextEditingController _replyController = TextEditingController();

  @override
  void dispose() {
    _replyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: AppColors.scaffold(isDark),
      appBar: AppBar(
        backgroundColor: AppColors.appBarBg(isDark),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(onPressed: () => Navigator.of(context).maybePop(), icon: Icon(Icons.arrow_back_ios_new, color: AppColors.textPrimary(isDark))),
        titleSpacing: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ticket #12845', style: TextStyle(color: AppColors.textPrimary(isDark), fontSize: 16, fontWeight: FontWeight.w700)),
            const SizedBox(height: 2),
            const Text('IN PROGRESS', style: TextStyle(color: Color(0xFF6A75A5), fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 0.4)),
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert, color: AppColors.textPrimary(isDark)))],
      ),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTicketDetailsCard(isDark),
                    const SizedBox(height: 10),
                    _buildManagementCard(isDark),
                    const SizedBox(height: 14),
                    _buildTrackingSection(isDark),
                    const SizedBox(height: 14),
                    Center(child: Text('ACTIVITY HISTORY', style: TextStyle(color: AppColors.textSecondary(isDark), fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 0.5))),
                    const SizedBox(height: 12),
                    _buildChatHistory(isDark),
                  ],
                ),
              ),
            ),
            _buildReplyComposer(isDark),
          ],
        ),
      ),
    );
  }

  Widget _buildTrackingSection(bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      decoration: BoxDecoration(color: AppColors.card(isDark), borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.border(isDark))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('TRACKING', style: TextStyle(color: AppColors.textSecondary(isDark), fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 0.4)),
          const SizedBox(height: 12),
          Row(children: [
            _TrackingStep(label: 'Open', isDone: true, isActive: false, isDark: isDark),
            _TrackingConnector(active: true, isDark: isDark),
            _TrackingStep(label: 'In Progress', isDone: false, isActive: true, isDark: isDark),
            _TrackingConnector(active: false, isDark: isDark),
            _TrackingStep(label: 'Resolved', isDone: false, isActive: false, isDark: isDark),
            _TrackingConnector(active: false, isDark: isDark),
            _TrackingStep(label: 'Closed', isDone: false, isActive: false, isDark: isDark),
          ]),
        ],
      ),
    );
  }

  Widget _buildTicketDetailsCard(bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      decoration: BoxDecoration(color: AppColors.card(isDark), borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.border(isDark))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Expanded(child: Text('Ticket Details', style: TextStyle(color: AppColors.textPrimary(isDark), fontSize: 27 / 1.3, fontWeight: FontWeight.w700))),
            Icon(Icons.expand_less, color: AppColors.textSecondary(isDark)),
          ]),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(child: _InfoItem(label: 'Category', value: 'Technical', isDark: isDark)),
            Expanded(child: _InfoItem(label: 'Priority', value: 'HIGH', valueColor: const Color(0xFFD43B47), addDot: true, isDark: isDark)),
          ]),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(child: _InfoItem(label: 'Created Date', value: 'Oct 24, 2023 - 09:12', valueWeight: FontWeight.w600, isDark: isDark)),
            Expanded(child: _InfoItem(label: 'Last Updated', value: '2h ago', isDark: isDark)),
          ]),
        ],
      ),
    );
  }

  Widget _buildManagementCard(bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
      decoration: BoxDecoration(color: AppColors.card(isDark), borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.border(isDark))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Management', style: TextStyle(color: AppColors.textPrimary(isDark), fontSize: 27 / 1.3, fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          Row(children: [
            const CircleAvatar(radius: 16, backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=12')),
            const SizedBox(width: 8),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Assignee', style: TextStyle(color: AppColors.textSecondary(isDark), fontSize: 11, fontWeight: FontWeight.w600)),
              const SizedBox(height: 1),
              Text('Rizky', style: TextStyle(color: AppColors.textPrimary(isDark), fontSize: 13, fontWeight: FontWeight.w700)),
            ])),
            TextButton(onPressed: () {}, style: TextButton.styleFrom(minimumSize: Size.zero, padding: EdgeInsets.zero, tapTargetSize: MaterialTapTargetSize.shrinkWrap), child: const Text('Change', style: TextStyle(color: Color(0xFF5A68D8), fontSize: 12, fontWeight: FontWeight.w700))),
          ]),
          const SizedBox(height: 14),
          Row(children: [
            Expanded(child: _InfoItem(label: 'Current Status', value: 'IN PROGRESS', isDark: isDark)),
            const SizedBox(width: 8),
            _inlineActionButton('Update Status', isDark),
          ]),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(child: _InfoItem(label: 'Priority Level', value: 'HIGH', valueColor: const Color(0xFFD43B47), isDark: isDark)),
            TextButton(onPressed: () {}, style: TextButton.styleFrom(minimumSize: Size.zero, padding: EdgeInsets.zero, tapTargetSize: MaterialTapTargetSize.shrinkWrap), child: const Text('Change Priority', style: TextStyle(color: Color(0xFF5A68D8), fontSize: 12, fontWeight: FontWeight.w700))),
          ]),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(child: _outlineActionButton(Icons.group_add, 'Assign To', isDark)),
            const SizedBox(width: 8),
            Expanded(child: _outlineActionButton(Icons.sync_alt_rounded, 'Change Status', isDark)),
            const SizedBox(width: 8),
            Expanded(child: _outlineActionButton(Icons.note_add_outlined, 'Add Internal Note', isDark)),
          ]),
        ],
      ),
    );
  }

  Widget _inlineActionButton(String label, bool isDark) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), foregroundColor: AppColors.textSecondary(isDark), side: BorderSide(color: AppColors.border(isDark)), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), textStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
      child: Row(mainAxisSize: MainAxisSize.min, children: [Text(label), const SizedBox(width: 4), const Icon(Icons.keyboard_arrow_down, size: 14)]),
    );
  }

  Widget _outlineActionButton(IconData icon, String text, bool isDark) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 14),
      label: Text(text, maxLines: 1, overflow: TextOverflow.ellipsis),
      style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8), foregroundColor: AppColors.textSecondary(isDark), side: BorderSide(color: AppColors.border(isDark)), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), textStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
    );
  }

  Widget _buildChatHistory(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(alignment: Alignment.centerRight, child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 260), child: const _ChatBubble(color: Color(0xFF2A38A0), message: 'Hi, I\'m having trouble logging into my account. It says Invalid Credentials even after I reset my password twice today. Can you help?', textColor: Colors.white))),
        const SizedBox(height: 4),
        Align(alignment: Alignment.centerRight, child: Text('10:45 AM  User', style: TextStyle(color: AppColors.textSecondary(isDark), fontSize: 10))),
        const SizedBox(height: 10),
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(color: isDark ? const Color(0xFF252547) : const Color(0xFFF1F3FA), borderRadius: BorderRadius.circular(16)),
            child: Text('Status changed to In Progress  2h ago', style: TextStyle(color: AppColors.textSecondary(isDark), fontSize: 10, fontWeight: FontWeight.w600)),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: const Color(0xFFFFF9E8), borderRadius: BorderRadius.circular(10), border: Border.all(color: const Color(0xFFF4DE9A))),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Row(children: [Icon(Icons.lock_clock, size: 14, color: Color(0xFFCF8A1D)), SizedBox(width: 6), Text('INTERNAL NOTE', style: TextStyle(color: Color(0xFFCF8A1D), fontSize: 10, fontWeight: FontWeight.w700))]),
            const SizedBox(height: 6),
            Text('User\'s account was flagged for multiple failed attempts. Checking the authentication logs for the SSO provider. Possible latency issue.', style: TextStyle(color: isDark ? const Color(0xFF4A5066) : Colors.grey.shade700, fontSize: 12, height: 1.3, fontWeight: FontWeight.w500)),
            const SizedBox(height: 6),
            Text('11:11 AM  Admin', style: TextStyle(color: AppColors.textSecondary(isDark), fontSize: 10, fontWeight: FontWeight.w600)),
          ]),
        ),
        const SizedBox(height: 12),
        Row(children: [
          CircleAvatar(radius: 14, backgroundColor: isDark ? const Color(0xFF334155) : const Color(0xFFE3E6F4), child: Icon(Icons.support_agent, size: 16, color: AppColors.textSecondary(isDark))),
          const SizedBox(width: 8),
          Text('Support Agent', style: TextStyle(color: AppColors.textPrimary(isDark), fontWeight: FontWeight.w700, fontSize: 13)),
        ]),
        const SizedBox(height: 8),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 290),
          child: _ChatBubble(color: AppColors.card(isDark), message: 'Hello! I am looking into your authentication logs now. We\'ve seen some delays with the password reset sync this morning. I\'ll get back to you shortly.', textColor: AppColors.textSecondary(isDark), border: Border.all(color: AppColors.border(isDark))),
        ),
        const SizedBox(height: 4),
        Text('11:30 AM', style: TextStyle(color: AppColors.textSecondary(isDark), fontSize: 10)),
      ],
    );
  }

  Widget _buildReplyComposer(bool isDark) {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
        decoration: BoxDecoration(color: AppColors.card(isDark), border: Border(top: BorderSide(color: AppColors.border(isDark)))),
        child: Row(children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.attach_file, color: AppColors.textSecondary(isDark))),
          Expanded(child: TextField(
            controller: _replyController,
            style: TextStyle(color: AppColors.textPrimary(isDark)),
            decoration: InputDecoration(
              hintText: 'Write a reply...', hintStyle: TextStyle(color: AppColors.textSecondary(isDark)), isDense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11), filled: true,
              fillColor: isDark ? const Color(0xFF252547) : const Color(0xFFF5F6FB),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide(color: AppColors.border(isDark))),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: const BorderSide(color: Color(0xFF7A84C8))),
            ),
          )),
          const SizedBox(width: 8),
          Container(width: 38, height: 38, decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF2030A0)), child: IconButton(onPressed: () {}, icon: const Icon(Icons.send, color: Colors.white, size: 18), padding: EdgeInsets.zero)),
        ]),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  const _InfoItem({required this.label, required this.value, this.valueColor, this.valueWeight = FontWeight.w700, this.addDot = false, required this.isDark});
  final String label; final String value; final Color? valueColor; final FontWeight valueWeight; final bool addDot; final bool isDark;
  @override
  Widget build(BuildContext context) {
    final effectiveColor = valueColor ?? AppColors.textPrimary(isDark);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label, style: TextStyle(color: AppColors.textSecondary(isDark), fontSize: 10, fontWeight: FontWeight.w600)),
      const SizedBox(height: 4),
      Row(children: [
        if (addDot) ...[Container(width: 6, height: 6, decoration: BoxDecoration(color: effectiveColor, shape: BoxShape.circle)), const SizedBox(width: 5)],
        Flexible(child: Text(value, style: TextStyle(color: effectiveColor, fontSize: 12, fontWeight: valueWeight), overflow: TextOverflow.ellipsis)),
      ]),
    ]);
  }
}

class _TrackingStep extends StatelessWidget {
  const _TrackingStep({required this.label, required this.isDone, required this.isActive, required this.isDark});
  final String label; final bool isDone; final bool isActive; final bool isDark;
  @override
  Widget build(BuildContext context) {
    final Color color = isActive || isDone ? const Color(0xFF2841C6) : (isDark ? const Color(0xFF334155) : const Color(0xFFCCD1E2));
    return Expanded(child: Column(children: [
      Container(width: 20, height: 20, decoration: BoxDecoration(shape: BoxShape.circle, color: isDone ? const Color(0xFF2841C6) : AppColors.card(isDark), border: Border.all(color: color, width: 2.5)), child: isDone ? const Icon(Icons.check, size: 11, color: Colors.white) : null),
      const SizedBox(height: 7),
      Text(label, style: TextStyle(fontSize: 10, color: isActive ? const Color(0xFF2841C6) : AppColors.textSecondary(isDark), fontWeight: isActive ? FontWeight.w700 : FontWeight.w500), textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis),
    ]));
  }
}

class _TrackingConnector extends StatelessWidget {
  const _TrackingConnector({required this.active, required this.isDark});
  final bool active; final bool isDark;
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(height: 2, margin: const EdgeInsets.only(bottom: 18), color: active ? const Color(0xFF2841C6) : (isDark ? const Color(0xFF334155) : const Color(0xFFDDE1EE))));
  }
}

class _ChatBubble extends StatelessWidget {
  const _ChatBubble({required this.color, required this.message, required this.textColor, this.border});
  final Color color; final String message; final Color textColor; final BoxBorder? border;
  @override
  Widget build(BuildContext context) {
    return Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11), decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10), border: border), child: Text(message, style: TextStyle(color: textColor, fontSize: 12, height: 1.35, fontWeight: FontWeight.w500)));
  }
}
