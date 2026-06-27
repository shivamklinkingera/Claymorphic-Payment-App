import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/services/providers.dart';

class WalletDashboardPage extends ConsumerWidget {
  const WalletDashboardPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accounts = ref.watch(userAccountsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('My Wallet')),
      body: accounts.when(
        data: (data) => Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(children: [
            ClayContainer(
              color: ClayColors.primary, borderRadius: 24, padding: const EdgeInsets.all(24),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Balance', style: TextStyle(color: Colors.white70)),
                Text('₹${data.isEmpty ? "0.00" : data.first.balance}', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
              ]),
            ),
            const SizedBox(height: 32),
            _action(Icons.add, 'Add Money'),
            _action(Icons.history, 'History'),
          ]),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e,s) => const Center(child: Text('Error')),
      ),
    );
  }
  Widget _action(IconData i, String l) => ListTile(leading: ClayContainer(width: 40, height: 40, child: Icon(i)), title: Text(l));
}
