import 'database.dart';
import 'package:drift/drift.dart';

class UserRepository {
  final AppDatabase db;
  UserRepository(this.db);

  Future<User?> getUserById(int id) =>
    (db.select(db.users)..where((u) => u.id.equals(id))).getSingleOrNull();

  Future<User?> getUserByPhone(String phone) =>
    (db.select(db.users)..where((u) => u.phoneNumber.equals(phone))).getSingleOrNull();

  Future<int> createUser(UsersCompanion user) =>
    db.into(db.users).insert(user);

  Future<void> updateMPIN(int userId, String mpin) =>
    (db.update(db.users)..where((u) => u.id.equals(userId))).write(UsersCompanion(mpin: Value(mpin)));
}

class BankRepository {
  final AppDatabase db;
  BankRepository(this.db);

  Future<List<BankAccount>> getAccountsForUser(int userId) =>
    (db.select(db.bankAccounts)..where((a) => a.userId.equals(userId))).get();

  Future<BankAccount?> getPrimaryAccount(int userId) =>
    (db.select(db.bankAccounts)..where((a) => a.userId.equals(userId) & a.isPrimary.equals(true))).getSingleOrNull();

  Future<int> addAccount(BankAccountsCompanion account) =>
    db.into(db.bankAccounts).insert(account);

  Future<void> updateBalance(int accountId, double newBalance) =>
    (db.update(db.bankAccounts)..where((a) => a.id.equals(accountId))).write(BankAccountsCompanion(balance: Value(newBalance)));
}

class TransactionRepository {
  final AppDatabase db;
  TransactionRepository(this.db);

  Future<List<Transaction>> getTransactionsForUser(int userId) =>
    (db.select(db.transactions)
      ..where((t) => t.senderId.equals(userId) | t.receiverId.equals(userId))
      ..orderBy([(t) => OrderingTerm(expression: t.timestamp, mode: OrderingMode.desc)]))
    .get();

  Future<int> createTransaction(TransactionsCompanion transaction) =>
    db.into(db.transactions).insert(transaction);
}

class ContactRepository {
  final AppDatabase db;
  ContactRepository(this.db);

  Future<List<Contact>> getContacts(int userId) =>
    (db.select(db.contacts)..where((c) => c.userId.equals(userId))).get();

  Future<int> addContact(ContactsCompanion contact) =>
    db.into(db.contacts).insert(contact);
}
