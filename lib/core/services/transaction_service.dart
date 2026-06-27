import 'package:drift/drift.dart';
import '../data/database.dart';
import '../data/repositories.dart';

class TransactionService {
  final BankRepository bankRepository;
  final TransactionRepository transactionRepository;

  TransactionService({
    required this.bankRepository,
    required this.transactionRepository,
  });

  Future<bool> sendMoney({
    required int senderId,
    required int? receiverId,
    required String senderName,
    required String receiverName,
    required double amount,
    String? description,
  }) async {
    final senderAccount = await bankRepository.getPrimaryAccount(senderId);
    if (senderAccount == null || senderAccount.balance < amount) return false;

    await bankRepository.updateBalance(senderAccount.id, senderAccount.balance - amount);

    await transactionRepository.createTransaction(TransactionsCompanion(
      senderId: Value(senderId),
      receiverId: Value(receiverId),
      senderName: Value(senderName),
      receiverName: Value(receiverName),
      amount: Value(amount),
      description: Value(description),
      status: const Value('SUCCESS'),
      type: const Value('DEBIT'),
      referenceId: Value('TXN${DateTime.now().millisecondsSinceEpoch}'),
    ));
    return true;
  }

  Future<void> addMoneyToWallet(int userId, double amount) async {
    final account = await bankRepository.getPrimaryAccount(userId);
    if (account != null) {
      await bankRepository.updateBalance(account.id, account.balance + amount);
      await transactionRepository.createTransaction(TransactionsCompanion(
        receiverId: Value(userId),
        senderName: const Value('Bank'),
        receiverName: const Value('Wallet'),
        amount: Value(amount),
        status: const Value('SUCCESS'),
        type: const Value('CREDIT'),
        referenceId: Value('WAL${DateTime.now().millisecondsSinceEpoch}'),
      ));
    }
  }
}
