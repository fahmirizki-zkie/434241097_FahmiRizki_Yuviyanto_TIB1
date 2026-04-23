import 'package:flutter/material.dart';

class UniversalLoadingPage extends StatefulWidget {
  final String nextRoute;

  const UniversalLoadingPage({super.key, required this.nextRoute});

  @override
  State<UniversalLoadingPage> createState() => _UniversalLoadingPageState();
}

class _UniversalLoadingPageState extends State<UniversalLoadingPage> {
  @override
  void initState() {
    super.initState();
    // Simulasi loading screen selama 1.5 detik
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed(widget.nextRoute);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor:
          isDark ? const Color(0xFF121218) : const Color(0xFFF8F9FA),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF6B4EE6).withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.confirmation_num_rounded,
                size: 64,
                color: Color(0xFF6B4EE6),
              ),
            ),
            const SizedBox(height: 24),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF6B4EE6)),
            ),
            const SizedBox(height: 16),
            Text(
              'Loading Data...',
              style: TextStyle(
                color: isDark
                    ? const Color(0xFFE2E8F0)
                    : const Color(0xFF2D3748),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
