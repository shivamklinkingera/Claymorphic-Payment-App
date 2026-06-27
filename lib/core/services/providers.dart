import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/database.dart';
import '../data/repositories.dart';
import 'security_service.dart';
import 'transaction_service.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

final userRepositoryProvider = Provider<UserRepository>((ref) => UserRepository(ref.watch(databaseProvider)));
final bankRepositoryProvider = Provider<BankRepository>((ref) => BankRepository(ref.watch(databaseProvider)));
final transactionRepositoryProvider = Provider<TransactionRepository>((ref) => TransactionRepository(ref.watch(databaseProvider)));
final contactRepositoryProvider = Provider<ContactRepository>((ref) => ContactRepository(ref.watch(databaseProvider)));

final securityServiceProvider = Provider<SecurityService>((ref) => SecurityService());

final transactionServiceProvider = Provider<TransactionService>((ref) => TransactionService(
  bankRepository: ref.watch(bankRepositoryProvider),
  transactionRepository: ref.watch(transactionRepositoryProvider),
));

final currentUserProvider = StateProvider<User?>((ref) => null);

final userTransactionsProvider = FutureProvider<List<Transaction>>((ref) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) return [];
  // Use a refreshable future or stream to ensure updates are reflected
  return ref.watch(transactionRepositoryProvider).getTransactionsForUser(user.id);
});

final userAccountsProvider = FutureProvider<List<BankAccount>>((ref) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) return [];
  return ref.watch(bankRepositoryProvider).getAccountsForUser(user.id);
});

final userContactsProvider = FutureProvider<List<Contact>>((ref) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) return [];
  return ref.watch(contactRepositoryProvider).getContacts(user.id);
});
