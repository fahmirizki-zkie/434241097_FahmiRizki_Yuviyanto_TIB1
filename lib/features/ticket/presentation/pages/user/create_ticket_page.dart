import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

class CreateTicketPage extends StatefulWidget {
  const CreateTicketPage({super.key});

  @override
  State<CreateTicketPage> createState() => _CreateTicketPageState();
}

class _CreateTicketPageState extends State<CreateTicketPage> {
  String _selectedPriority = 'Low';
  String _selectedCategory = 'Technical';
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  void _showSuccessBottomSheet() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.card(isDark),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF334155) : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check_circle, color: Colors.green, size: 48),
              ),
              const SizedBox(height: 24),
              Text(
                'Ticket submitted successfully!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary(isDark),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Our team will review your request shortly. You can track the status in your support dashboard.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.textSecondary(isDark), fontSize: 14),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF252547) : Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border(isDark)),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E278B),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.confirmation_number_outlined, color: Colors.white),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('TICKET ID', style: TextStyle(fontSize: 10, color: AppColors.textSecondary(isDark))),
                          Text('#TK-8820912', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary(isDark))),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('PRIORITY', style: TextStyle(fontSize: 10, color: AppColors.textSecondary(isDark))),
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text('STANDARD', style: TextStyle(color: Colors.blue, fontSize: 10, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(sheetContext).pop();
                    Navigator.of(context).pushNamed('/user-ticket-detail');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E278B),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('View Ticket', style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.of(sheetContext).pop();
                  Navigator.of(context).pushReplacementNamed('/user-dashboard');
                },
                child: const Text('Back to Dashboard', style: TextStyle(color: Color(0xFF1E278B))),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: AppColors.card(isDark),
      appBar: AppBar(
        backgroundColor: AppColors.appBarBg(isDark),
        elevation: 0,
        leading: BackButton(color: AppColors.textPrimary(isDark)),
        title: Text(
          'Create Ticket',
          style: TextStyle(color: AppColors.textPrimary(isDark)),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF3949AB),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('How can we help?', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Our support team usually responds within 2 hours.', style: TextStyle(color: Colors.white70, fontSize: 14)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              style: TextStyle(color: AppColors.textPrimary(isDark)),
              decoration: InputDecoration(
                hintText: 'Subject / Title',
                hintStyle: TextStyle(color: AppColors.textSecondary(isDark)),
                fillColor: isDark ? const Color(0xFF252547) : Colors.grey.shade50,
                filled: true,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 16),
            Text('Category', style: TextStyle(fontSize: 12, color: AppColors.textSecondary(isDark))),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              initialValue: _selectedCategory,
              dropdownColor: AppColors.card(isDark),
              style: TextStyle(color: AppColors.textPrimary(isDark)),
              decoration: InputDecoration(
                fillColor: isDark ? const Color(0xFF252547) : Colors.grey.shade50,
                filled: true,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
              ),
              items: ['Technical', 'Billing', 'Other'].map((String category) {
                return DropdownMenuItem(value: category, child: Text(category));
              }).toList(),
              onChanged: (newValue) {
                if (newValue != null) setState(() => _selectedCategory = newValue);
              },
            ),
            const SizedBox(height: 16),
            Text('Priority', style: TextStyle(fontSize: 12, color: AppColors.textSecondary(isDark))),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF252547) : Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: ['Low', 'Medium', 'High'].map((priority) {
                  final isSelected = _selectedPriority == priority;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedPriority = priority),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.card(isDark) : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: isSelected
                              ? [BoxShadow(color: AppColors.shadow(isDark), blurRadius: 4)]
                              : [],
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          priority,
                          style: TextStyle(
                            color: isSelected ? AppColors.textPrimary(isDark) : AppColors.textSecondary(isDark),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Description', style: TextStyle(fontSize: 12, color: AppColors.textSecondary(isDark))),
                Text('${_descriptionController.text.length} / 500', style: TextStyle(fontSize: 12, color: AppColors.textSecondary(isDark))),
              ],
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _descriptionController,
              maxLines: 5,
              maxLength: 500,
              onChanged: (text) => setState(() {}),
              style: TextStyle(color: AppColors.textPrimary(isDark)),
              decoration: InputDecoration(
                hintText: 'Tell us more about your issue...',
                hintStyle: TextStyle(color: AppColors.textSecondary(isDark)),
                counterText: '',
                fillColor: isDark ? const Color(0xFF252547) : Colors.grey.shade50,
                filled: true,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 24),
            Text('Attachments', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary(isDark))),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.attach_file, color: Color(0xFF1E278B)),
                    label: const Text('Attach File', style: TextStyle(color: Color(0xFF1E278B))),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      side: const BorderSide(color: Color(0xFF1E278B)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.camera_alt_outlined, color: Color(0xFF1E278B)),
                    label: const Text('Take Photo', style: TextStyle(color: Color(0xFF1E278B))),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      side: const BorderSide(color: Color(0xFF1E278B)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  width: 80, height: 80,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF252547) : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.image, color: AppColors.textSecondary(isDark)),
                ),
                Container(
                  width: 80, height: 80,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF252547) : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.image, color: AppColors.textSecondary(isDark)),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: _showSuccessBottomSheet,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E278B),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('Submit Ticket', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
