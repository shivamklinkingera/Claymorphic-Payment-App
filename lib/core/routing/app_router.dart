import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/pages/splash_screen_page.dart';
import '../../features/auth/presentation/pages/onboarding_welcome_page.dart';
import '../../features/auth/presentation/pages/onboarding_send_receive_page.dart';
import '../../features/auth/presentation/pages/onboarding_bills_recharges_page.dart';
import '../../features/auth/presentation/pages/login_phone_number_page.dart';
import '../../features/auth/presentation/pages/otp_verification_page.dart';
import '../../features/auth/presentation/pages/set_mpin_page.dart';
import '../../features/home/presentation/pages/home_dashboard_page.dart';
import '../../features/home/presentation/pages/notifications_page.dart';
import '../../features/home/presentation/pages/search_page.dart';
import '../../features/home/presentation/pages/payclay_component_library_page.dart';
import '../../features/payments/presentation/pages/select_contact_page.dart';
import '../../features/payments/presentation/pages/send_money_enter_amount_page.dart';
import '../../features/payments/presentation/pages/confirm_payment_upi_pin_page.dart';
import '../../features/payments/presentation/pages/payment_success_page.dart';
import '../../features/auth/presentation/pages/upi_profile_management_page.dart';
import '../../features/auth/presentation/pages/my_qr_code_page.dart';
import '../../features/auth/presentation/pages/linked_bank_accounts_page.dart';
import '../../features/auth/presentation/pages/change_upi_pin_page.dart';
import '../../features/support/presentation/pages/help_center_faqs_page.dart';
import '../widgets/clay_nav_bar.dart';
import '../data/database.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashPage()),
    GoRoute(path: '/onboarding_welcome', builder: (context, state) => const OnboardingWelcomePage()),
    GoRoute(path: '/onboarding_send_receive', builder: (context, state) => const OnboardingSendReceivePage()),
    GoRoute(path: '/onboarding_bills_recharges', builder: (context, state) => const OnboardingBillsRechargesPage()),
    GoRoute(path: '/login_phone_number', builder: (context, state) => const LoginPhoneNumberPage()),
    GoRoute(path: '/otp_verification', builder: (context, state) => const OtpVerificationPage()),
    GoRoute(path: '/set_mpin', builder: (context, state) => const SetMpinPage()),
    GoRoute(path: '/component-library', builder: (context, state) => const PayClayComponentLibraryPage()),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => Scaffold(
        body: navigationShell,
        extendBody: true,
        bottomNavigationBar: ClayNavBar(navigationShell: navigationShell),
      ),
      branches: [
        StatefulShellBranch(routes: [GoRoute(path: '/', builder: (context, state) => const HomePage())]),
        StatefulShellBranch(routes: [GoRoute(path: '/history', builder: (context, state) => const Center(child: Text('History')))]),
        StatefulShellBranch(routes: [GoRoute(path: '/offers', builder: (context, state) => const Center(child: Text('Offers')))]),
        StatefulShellBranch(routes: [GoRoute(path: '/profile', builder: (context, state) => const UpiProfilePage())]),
      ],
    ),
    GoRoute(path: '/my-qr', builder: (context, state) => const MyQrCodePage()),
    GoRoute(path: '/linked-banks', builder: (context, state) => const LinkedBankAccountsPage()),
    GoRoute(path: '/change-pin', builder: (context, state) => const ChangeUpiPinPage()),
    GoRoute(path: '/support', builder: (context, state) => const HelpCenterFaqsPage()),
    GoRoute(path: '/notifications', builder: (context, state) => const NotificationsPage()),
    GoRoute(path: '/search', builder: (context, state) => const SearchPage()),
    GoRoute(path: '/send-money', builder: (context, state) => const SelectContactPage()),
    GoRoute(path: '/amount', builder: (context, state) => SendMoneyAmountPage(contact: state.extra as Contact)),
    GoRoute(path: '/confirm', builder: (context, state) {
      final extra = state.extra as Map<String, dynamic>;
      return ConfirmPaymentUpiPinPage(contact: extra['contact'] as Contact, amount: extra['amount'] as double);
    }),
    GoRoute(path: '/success', builder: (context, state) {
      final extra = state.extra as Map<String, dynamic>;
      return PaymentSuccessPage(contact: extra['contact'] as Contact, amount: extra['amount'] as double);
    }),
  ],
);
