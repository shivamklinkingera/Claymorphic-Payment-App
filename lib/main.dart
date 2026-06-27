import 'core/theme/clay_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/routing/app_router.dart';
import 'core/data/mock_data.dart';
import 'core/services/providers.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  final db = container.read(databaseProvider);
  await MockDataSeeder.seed(db);
  final user = await container.read(userRepositoryProvider).getUserById(1);
  container.read(currentUserProvider.notifier).state = user;
  runApp(UncontrolledProviderScope(container: container, child: const PayClayApp()));
}
class PayClayApp extends StatelessWidget {
  const PayClayApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: 'PayClay', theme: ClayTheme.lightTheme, routerConfig: appRouter, debugShowCheckedModeBanner: false);
  }
}
