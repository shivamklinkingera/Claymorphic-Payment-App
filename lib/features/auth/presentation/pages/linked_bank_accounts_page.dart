import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/providers.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';

class LinkedBankAccountsPage extends ConsumerWidget {
  const LinkedBankAccountsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountsAsync = ref.watch(userAccountsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bank Accounts'),
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
      body: accountsAsync.when(
        data: (accounts) => ListView.builder(
          padding: const EdgeInsets.all(24),
          itemCount: accounts.length + 1,
          itemBuilder: (context, index) {
            if (index == accounts.length) {
              return Padding(
                padding: const EdgeInsets.only(top: 24),
                child: ClayButton(
                  color: ClayColors.secondary,
                  onPressed: () {},
                  child: const Text('Add New Bank Account'),
                ),
              );
            }
            final account = accounts[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ClayContainer(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    ClayContainer(
                      width: 48,
                      height: 48,
                      borderRadius: 24,
                      color: Colors.white,
                      child: const Icon(Icons.account_balance, color: ClayColors.primary),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(account.bankName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          Text('•••• ${account.accountNumber.substring(account.accountNumber.length - 4)}', style: const TextStyle(color: ClayColors.onSurfaceVariant)),
                        ],
                      ),
                    ),
                    if (account.isPrimary)
                      const Chip(label: Text('Primary', style: TextStyle(fontSize: 10)), backgroundColor: ClayColors.secondaryContainer),
                  ],
                ),
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
