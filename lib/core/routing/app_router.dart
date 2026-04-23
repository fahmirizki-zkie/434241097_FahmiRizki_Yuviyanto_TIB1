import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/pages/reset_password_page.dart';
import '../../features/auth/presentation/pages/reset_password_check_email_page.dart';
import '../../features/auth/presentation/pages/splash_page.dart';
import '../../features/ticket/presentation/pages/ticket_list_page.dart';
import '../../features/ticket/presentation/pages/user/user_dashboard_page.dart';
import '../../features/ticket/presentation/pages/user/user_tickets_page.dart';
import '../../features/ticket/presentation/pages/user/user_ticket_detail_page.dart';
import '../../features/ticket/presentation/pages/user/user_notifications_page.dart';
import '../../features/ticket/presentation/pages/user/user_notifications_empty_page.dart';
import '../../features/ticket/presentation/pages/user/create_ticket_page.dart';
import '../../features/ticket/presentation/pages/user/user_profile_page.dart';
import '../../features/ticket/presentation/pages/helpdesk/helpdesk_dashboard_page.dart';
import '../../features/ticket/presentation/pages/helpdesk/helpdesk_tickets_page.dart';
import '../../features/ticket/presentation/pages/helpdesk/helpdesk_empty_tickets_page.dart';
import '../../features/ticket/presentation/pages/helpdesk/helpdesk_ticket_detail_page.dart';
import '../../features/ticket/presentation/pages/helpdesk/helpdesk_notifications_page.dart';
import '../../features/ticket/presentation/pages/helpdesk/helpdesk_profile_page.dart';
import '../../shared/pages/universal_loading_page.dart';

/// Centralized route names and route creation.
abstract final class AppRouter {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String resetPassword = '/reset-password';
  static const String resetPasswordCheckEmail = '/reset-password-check-email';
  static const String tickets = '/tickets';
  static const String userDashboard = '/user-dashboard';
  static const String helpdeskDashboard = '/helpdesk-dashboard';
  static const String helpdeskTickets = '/helpdesk-tickets';
  static const String helpdeskEmptyTickets = '/helpdesk-empty-tickets';
  static const String helpdeskTicketDetail = '/helpdesk-ticket-detail';
  static const String helpdeskNotifications = '/helpdesk-notifications';
  static const String helpdeskProfile = '/helpdesk-profile';
  static const String userTickets = '/user-tickets';
  static const String userTicketDetail = '/user-ticket-detail';
  static const String userNotifications = '/user-notifications';
  static const String userNotificationsEmpty = '/user-notifications-empty';
  static const String userCreateTicket = '/user-create-ticket';
  static const String userProfile = '/user-profile';
  static const String universalLoading = '/universal-loading';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute<void>(builder: (_) => const SplashPage());
      case login:
        return MaterialPageRoute<void>(builder: (_) => const LoginPage());
      case register:
        return MaterialPageRoute<void>(builder: (_) => const RegisterPage());
      case resetPassword:
        return MaterialPageRoute<void>(
          builder: (_) => const ResetPasswordPage(),
        );
      case resetPasswordCheckEmail:
        final email = settings.arguments as String?;
        return MaterialPageRoute<void>(
          builder: (_) => ResetPasswordCheckEmailPage(email: email),
        );
      case tickets:
        return MaterialPageRoute<void>(builder: (_) => const TicketListPage());
      case userDashboard:
        return MaterialPageRoute<void>(
          builder: (_) => const UserDashboardPage(),
        );
      case helpdeskDashboard:
        return MaterialPageRoute<void>(
          builder: (_) => const HelpdeskDashboardPage(),
        );
      case helpdeskTickets:
        return MaterialPageRoute<void>(
          builder: (_) => const HelpdeskTicketsPage(),
        );
      case helpdeskEmptyTickets:
        return MaterialPageRoute<void>(
          builder: (_) => const HelpdeskEmptyTicketsPage(),
        );
      case helpdeskTicketDetail:
        return MaterialPageRoute<void>(
          builder: (_) => const HelpdeskTicketDetailPage(),
        );
      case helpdeskNotifications:
        return MaterialPageRoute<void>(
          builder: (_) => const HelpdeskNotificationsPage(),
        );
      case helpdeskProfile:
        return MaterialPageRoute<void>(
          builder: (_) => const HelpdeskProfilePage(),
        );
      case userTickets:
        return MaterialPageRoute<void>(builder: (_) => const UserTicketsPage());
      case userTicketDetail:
        return MaterialPageRoute<void>(
          builder: (_) => const UserTicketDetailPage(),
        );
      case userNotifications:
        return MaterialPageRoute<void>(
          builder: (_) => const UserNotificationsPage(),
        );
      case userNotificationsEmpty:
        return MaterialPageRoute<void>(
          builder: (_) => const UserNotificationsEmptyPage(),
        );
      case userCreateTicket:
        return MaterialPageRoute<void>(
          builder: (_) => const CreateTicketPage(),
        );
      case userProfile:
        return MaterialPageRoute<void>(builder: (_) => const UserProfilePage());
      case universalLoading:
        final nextRoute = settings.arguments as String? ?? splash;
        return PageRouteBuilder<void>(
          pageBuilder: (_, _, _) => UniversalLoadingPage(nextRoute: nextRoute),
          transitionsBuilder: (_, animation, _, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      default:
        return null;
    }
  }
}
