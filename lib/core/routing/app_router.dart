import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/pages/login_phone_number_page.dart';
import '../../features/auth/presentation/pages/otp_verification_page.dart';
import '../../features/auth/presentation/pages/set_mpin_page.dart';
import '../../features/auth/presentation/pages/splash_screen_page.dart';
import '../../features/auth/presentation/pages/onboarding_welcome_page.dart';
import '../../features/auth/presentation/pages/upi_profile_management_page.dart';
import '../../features/auth/presentation/pages/my_qr_code_page.dart';
import '../../features/auth/presentation/pages/linked_bank_accounts_page.dart';
import '../../features/auth/presentation/pages/change_upi_pin_page.dart';
import '../../features/home/presentation/pages/home_dashboard_page.dart';
import '../../features/home/presentation/pages/notifications_page.dart';
import '../../features/home/presentation/pages/search_page.dart';
import '../../features/home/presentation/pages/payclay_component_library_page.dart';
import '../../features/payments/presentation/pages/select_contact_page.dart';
import '../../features/payments/presentation/pages/send_money_enter_amount_page.dart';
import '../../features/payments/presentation/pages/confirm_payment_upi_pin_page.dart';
import '../../features/payments/presentation/pages/payment_success_page.dart';
import '../../features/payments/presentation/pages/scan_pay_qr_scanner_page.dart';
import '../../features/payments/presentation/pages/request_money_page.dart';
import '../../features/payments/presentation/pages/request_sent_pending_page.dart';
import '../../features/payments/presentation/pages/bank_transfer_page.dart';
import '../../features/wallet/presentation/pages/wallet_dashboard_page.dart';
import '../../features/wallet/presentation/pages/add_money_to_wallet_page.dart';
import '../../features/history/presentation/pages/transaction_history_page.dart';
import '../../features/history/presentation/pages/transaction_details_page.dart';
import '../../features/history/presentation/pages/spending_insights_page.dart';
import '../../features/history/presentation/pages/download_statement_page.dart';
import '../../features/bills/presentation/pages/bill_payments_hub_page.dart';
import '../../features/bills/presentation/pages/bill_payment_success_page.dart';
import '../../features/bills/presentation/pages/electricity_bill_payment_page.dart';
import '../../features/bills/presentation/pages/gas_bill_payment_page.dart';
import '../../features/bills/presentation/pages/mobile_recharge_page.dart';
import '../../features/bills/presentation/pages/dth_recharge_page.dart';
import '../../features/wealth/presentation/pages/wealth_investments_page.dart';
import '../../features/wealth/presentation/pages/mutual_funds_page.dart';
import '../../features/wealth/presentation/pages/fund_details_page.dart';
import '../../features/support/presentation/pages/help_center_faqs_page.dart';
import '../../features/support/presentation/pages/faq_detail_upi_pin_reset_page.dart';
import '../../features/support/presentation/pages/live_chat_support_page.dart';
import '../../features/support/presentation/pages/support_tickets_page.dart';
import '../../features/rewards/presentation/pages/offers_rewards_hub_page.dart';
import '../../features/rewards/presentation/pages/my_coupons_page.dart';
import '../../features/rewards/presentation/pages/my_earnings_cashback_page.dart';
import '../../features/rewards/presentation/pages/refer_earn_page.dart';
import '../../features/split_bills/presentation/pages/split_bills_page.dart';
import '../../features/split_bills/presentation/pages/split_new_bill_page.dart';
import '../../features/split_bills/presentation/pages/group_details_page.dart';
import '../widgets/clay_nav_bar.dart';
import '../data/database.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/splash_screen',
  routes: [
    GoRoute(path: '/splash_screen', builder: (context, state) => const SplashScreenPage()),
    GoRoute(path: '/onboarding_welcome', builder: (context, state) => const OnboardingWelcomePage()),
    GoRoute(path: '/login_phone_number', builder: (context, state) => const LoginPhoneNumberPage()),
    GoRoute(path: '/otp_verification', builder: (context, state) => const OtpVerificationPage()),
    GoRoute(path: '/set_mpin', builder: (context, state) => const SetMpinPage()),
    GoRoute(path: '/component-library', builder: (context, state) => const PayclayComponentLibraryPage()),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => Scaffold(
        body: navigationShell,
        extendBody: true,
        bottomNavigationBar: ClayNavBar(navigationShell: navigationShell),
      ),
      branches: [
        StatefulShellBranch(routes: [GoRoute(path: '/', builder: (context, state) => const HomePage())]),
        StatefulShellBranch(routes: [GoRoute(path: '/history', builder: (context, state) => const TransactionHistoryPage())]),
        StatefulShellBranch(routes: [GoRoute(path: '/offers', builder: (context, state) => const OffersRewardsHubPage())]),
        StatefulShellBranch(routes: [GoRoute(path: '/profile', builder: (context, state) => const UpiProfilePage())]),
      ],
    ),
    GoRoute(path: '/my-qr', builder: (context, state) => const MyQrCodePage()),
    GoRoute(path: '/scan-pay', builder: (context, state) => const ScanPayQrScannerPage()),
    GoRoute(path: '/request-money', builder: (context, state) => const RequestMoneyPage()),
    GoRoute(path: '/request-success', builder: (context, state) => const RequestSentPendingPage()),
    GoRoute(path: '/spending-insights', builder: (context, state) => const SpendingInsightsPage()),
    GoRoute(path: '/bills', builder: (context, state) => const BillPaymentsHubPage()),
    GoRoute(path: '/electricity-bill', builder: (context, state) => const ElectricityBillPaymentPage()),
    GoRoute(path: '/gas-bill', builder: (context, state) => const GasBillPaymentPage()),
    GoRoute(path: '/mobile-recharge', builder: (context, state) => const MobileRechargePage()),
    GoRoute(path: '/dth-recharge', builder: (context, state) => const DthRechargePage()),
    GoRoute(path: '/wealth', builder: (context, state) => const WealthInvestmentsPage()),
    GoRoute(path: '/mutual-funds', builder: (context, state) => const MutualFundsPage()),
    GoRoute(path: '/fund-details', builder: (context, state) => FundDetailsPage(fundName: state.extra as String)),
    GoRoute(path: '/notifications', builder: (context, state) => const NotificationsPage()),
    GoRoute(path: '/search', builder: (context, state) => const SearchPage()),
    GoRoute(path: '/linked-banks', builder: (context, state) => const LinkedBankAccountsPage()),
    GoRoute(path: '/change-pin', builder: (context, state) => const ChangeUpiPinPage()),
    GoRoute(path: '/support', builder: (context, state) => const HelpCenterFaqsPage()),
    GoRoute(path: '/faq-detail', builder: (context, state) => const FaqDetailUpiPinResetPage()),
    GoRoute(path: '/live-chat', builder: (context, state) => const LiveChatSupportPage()),
    GoRoute(path: '/support-tickets', builder: (context, state) => const SupportTicketsPage()),
    GoRoute(path: '/my-coupons', builder: (context, state) => const MyCouponsPage()),
    GoRoute(path: '/my-earnings', builder: (context, state) => const MyEarningsCashbackPage()),
    GoRoute(path: '/refer-earn', builder: (context, state) => const ReferEarnPage()),
    GoRoute(path: '/split-bills', builder: (context, state) => const SplitBillsPage()),
    GoRoute(path: '/split-new', builder: (context, state) => const SplitNewBillPage()),
    GoRoute(path: '/group-details', builder: (context, state) => GroupDetailsPage(groupName: state.extra as String)),
    GoRoute(path: '/wallet', builder: (context, state) => const WalletDashboardPage()),
    GoRoute(path: '/add-money', builder: (context, state) => const AddMoneyToWalletPage()),
    GoRoute(path: '/bank-transfer', builder: (context, state) => const BankTransferPage()),
    GoRoute(path: '/transaction-details', builder: (context, state) => const TransactionDetailsPage()),
    GoRoute(path: '/download-statement', builder: (context, state) => const DownloadStatementPage()),
    GoRoute(
      path: '/bill-success',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        return BillPaymentSuccessPage(billerName: extra['billerName'] as String, amount: extra['amount'] as double);
      },
    ),
    GoRoute(
      path: '/send-money',
      builder: (context, state) => const SelectContactPage(),
      routes: [
        GoRoute(path: 'amount', builder: (context, state) => SendMoneyAmountPage(contact: state.extra as Contact)),
        GoRoute(
          path: 'confirm',
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>;
            return ConfirmPaymentUpiPinPage(contact: extra['contact'] as Contact, amount: extra['amount'] as double);
          },
        ),
        GoRoute(
          path: 'success',
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>;
            return PaymentSuccessPage(contact: extra['contact'] as Contact, amount: extra['amount'] as double);
          },
        ),
      ],
    ),
  ],
);
