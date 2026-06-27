import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';
import '../../../../core/widgets/clay_text_field.dart';
import '../../../../core/services/providers.dart';
import 'package:drift/drift.dart' show Value;
import '../../../../core/data/database.dart';

class LoginPhoneNumberPage extends ConsumerStatefulWidget {
  const LoginPhoneNumberPage({super.key});

  @override
  ConsumerState<LoginPhoneNumberPage> createState() => _LoginPhoneNumberPageState();
}

class _LoginPhoneNumberPageState extends ConsumerState<LoginPhoneNumberPage> {
  final TextEditingController _phoneController = TextEditingController();

  void _login() async {
    final phone = _phoneController.text;
    if (phone.length < 10) return;

    final userRepo = ref.read(userRepositoryProvider);
    var user = await userRepo.getUserByPhone(phone);

    if (user == null) {
      // Auto-create user if not exists to allow "Create Account" flow to work seamlessly
      final newUserId = await userRepo.createUser(UsersCompanion.insert(
        name: 'New User',
        phoneNumber: phone,
        upiId: '${phone}@payclay',
      ));

      // Also add a default bank account for the new user
      await ref.read(bankRepositoryProvider).addAccount(BankAccountsCompanion.insert(
        userId: newUserId,
        bankName: 'PayClay Digital Bank',
        accountNumber: '•••• ${phone.substring(phone.length - 4)}',
        ifsc: 'PCLY0001234',
        balance: const Value(5000.0),
        isPrimary: const Value(true),
      ));

      user = await userRepo.getUserById(newUserId);
    }

    if (user != null) {
      ref.read(currentUserProvider.notifier).state = user;
      if (mounted) context.push('/otp_verification');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClayContainer(
            borderRadius: 999,
            elevation: ClayElevation.level1,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: ClayColors.primary),
              onPressed: () => context.pop(),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text('Welcome Back', style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 12),
            Text('Login or Create Account with your phone number', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ClayColors.onSurfaceVariant)),
            const SizedBox(height: 48),
            const Text('Phone Number', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            Row(
              children: [
                ClayContainer(width: 80, isSunken: true, padding: const EdgeInsets.symmetric(vertical: 20), child: const Text('+91', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold))),
                const SizedBox(width: 16),
                Expanded(child: ClayTextField(controller: _phoneController, hintText: 'Enter phone number', keyboardType: TextInputType.phone)),
              ],
            ),
            const SizedBox(height: 48),
            ClayButton(onPressed: _login, child: const Text('Continue')),
            const SizedBox(height: 32),
            const Center(child: Text('By continuing, you agree to our Terms & Privacy Policy', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: ClayColors.onSurfaceVariant))),
          ],
        ),
      ),
    );
  }
}
