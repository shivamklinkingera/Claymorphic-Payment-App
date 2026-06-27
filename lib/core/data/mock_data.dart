import 'package:drift/drift.dart';
import 'database.dart';

class MockDataSeeder {
  static Future<void> seed(AppDatabase db) async {
    final users = await db.select(db.users).get();
    if (users.isNotEmpty) return;

    final userId = await db.into(db.users).insert(
      UsersCompanion.insert(
        name: 'Rahul',
        phoneNumber: '9876543210',
        upiId: 'rahul@payclay',
        avatarUrl: const Value('https://lh3.googleusercontent.com/aida-public/AB6AXuC1UXkIjzi-Mf8yVx8X3u4QQyqyYH-IEYoQ2MjoFi1C-3juuhfOVvINz6WW7eVBJH3RPhCFm1bShlXGkYYRZqGqdIyeqYFCzpnnGjCXe4AZ_hObtjYDHTH3zJzaAMGPFcXSFHVchhxYUdkzEoym_WEUPg3GhJwlYmUUdwNKhyx4ilyScbj_FFDCf1Wy6RxeFAkLTc8EAYHWYCbokKC5nfDTJrojaH1YwNO5lU7eBGHU85wjdQtgjzJopXz3M2v2h18hEFZD3r0SZY3L'),
        mpin: const Value('1234'),
      ),
    );

    await db.into(db.bankAccounts).insert(
      BankAccountsCompanion.insert(
        userId: userId,
        bankName: 'State Bank of India',
        accountNumber: '•••• 4521',
        ifsc: 'SBIN0001234',
        balance: const Value(12450.75),
        isPrimary: const Value(true),
      ),
    );

    final contacts = [
      ['Priya', '9876500001', 'priya@upi', 'https://lh3.googleusercontent.com/aida-public/AB6AXuBfODQG7ojsOZVFsIR98dUNjRT2baCdJiIMaaX-X4MA2Qqn7lUfkou9e1bylRi8Gpq1zWemkrMBTq-_5dhB9k-4Zbg_NKZPMfS7cbMDQk4QNrJEDwIzjfDB8LXqzutnePe-pt2PzRFsoVR6yHE_RYuva78XA8Pdn2nmsW18_5-VEdJPscqSHu5lmYTEz9hRBlMQA4aEbLGBOgbEI-ak07YgQHxGaZr17V3rgX4n8aR4E4LxerCM7uXHs8hBkj-YnmMHlOG7gqXILHRp'],
      ['Amit', '9876500002', 'amit@upi', 'https://lh3.googleusercontent.com/aida-public/AB6AXuBy4qpecGrdOkNmkBf4Vitcm8o_C4c8SNICzqt5oSxdz6QlTDKS09OWCfSVNF16XnkdA_Dygy87SHK22udtVBcgLbl8MwrOm1P86xfF3S5VLqUpaldEVEP5X_uQDOECRcD2oXZSws94PEeTWtYJejlqpy6cytZMyzo559QdzLnRFaJ1Ks6eghGn8IqR2TC0YVX-sHWd_VbWTdZN4grRPNpzqjve86bX1QcS6-ZjRhg5qs8ohgYMTGRtiBaOsaRhKcfhqAE0M6fRmp3W'],
    ];

    for (var contact in contacts) {
      await db.into(db.contacts).insert(
        ContactsCompanion.insert(
          userId: userId,
          name: contact[0],
          phoneNumber: contact[1],
          upiId: contact[2],
          avatarUrl: Value(contact[3]),
        ),
      );
    }

    await db.into(db.transactions).insert(
      TransactionsCompanion.insert(
        senderId: Value(userId),
        senderName: 'Rahul',
        receiverName: 'Priya',
        amount: 500,
        status: 'success',
        type: 'transfer',
        referenceId: 'REF123456789',
        timestamp: Value(DateTime.now().subtract(const Duration(hours: 2))),
      ),
    );
  }
}
