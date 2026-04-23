import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../widgets/brand_mark.dart';
import 'login_page.dart';

/// Splash page shown at app start before navigating to login.
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _progressController;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      vsync: this,
      duration: AppConstants.splashDuration,
    )..forward();

    Future.delayed(AppConstants.splashDuration, () {
      if (!mounted) {
        return;
      }
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(builder: (_) => const LoginPage()),
      );
    });
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor:
          isDark ? AppColors.splashSurfaceDark : AppColors.splashSurface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const BrandMark(),
                    const SizedBox(height: 18),
                    Text(
                      'TicketFlow',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.splashTitle.copyWith(
                        fontSize: (MediaQuery.sizeOf(context).width * 0.075)
                            .clamp(28.0, 34.0)
                            .toDouble(),
                        color: isDark
                            ? AppColors.splashTitleDark
                            : AppColors.splashTitle,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 112,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(99),
                          child: Stack(
                            children: [
                              Container(
                                height: 5,
                                color: isDark
                                    ? const Color(0xFF334155)
                                    : const Color(0xFFD3D5DC),
                              ),
                              AnimatedBuilder(
                                animation: _progressController,
                                builder: (context, child) {
                                  return FractionallySizedBox(
                                    widthFactor: _progressController.value,
                                    child: child,
                                  );
                                },
                                child: Container(
                                  height: 5,
                                  color: const Color(0xFF4C53E5),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'SECURED BY TICKETFLOW CLOUD',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.splashCaption.copyWith(
                          color: isDark
                              ? AppColors.splashCaptionDark
                              : AppColors.splashCaption,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
