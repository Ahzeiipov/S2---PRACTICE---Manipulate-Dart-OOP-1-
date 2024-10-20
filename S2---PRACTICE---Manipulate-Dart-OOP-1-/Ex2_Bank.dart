import '../../../instruction/STRAT CODE/EX-2.dart';

class InsufficientFundsException implements Exception {
  final String message;
  InsufficientFundsException(this.message);

  @override
  String toString() {
    return message;
  }
}

class bankAccount {
  final String accHolder;
  final String accID;
  double balance;
  final String accType;
  final String creationDate;
  bankAccount(
      {required this.accHolder,
      required this.accID,
      this.balance = 0.0,
      required this.accType,
      required this.creationDate,
      });

//   current balance

  String Getbalance() {
    return "The balance is:  \$${balance.toStringAsFixed(0)}";
  }

//  withdraw money
  void withdraw(double amount) {
    try {
      if (amount <= 0) {
        throw Exception("the withdraw must be greater than 0");
      }
      if (balance - amount < 0) {
        throw Exception("Insufficient funds for withdrawal of \${$amount}.");
      }
      balance -= amount;
      print("Balance => after withdraw : \$${balance.toStringAsFixed(0)}");
    } catch (e) {
      print("${e.toString()}");
    }
  }

//  deposit
  void credit(double amount) {
    try {
      if (amount <= 0) {
        throw ("The amount should greater than 0");
      }
      double Balance1 = balance;
      double balance2 = balance += amount;
      print(
          "The balance \$${Balance1.toStringAsFixed(0)} and after deposit  with \$$amount = \$$balance2");
    } catch (e) {
      print("${e.toString()}");
    }
  }
}

class Bank {
  String name;
  String location;
  List<bankAccount> accounts = [];
  Bank({
    required this.name,
    required this.location,
    List<bankAccount>? accounts,
  }) : accounts = accounts ?? [];
// check the ID
  void createAcc(int accountID, String accOwner) {
    if (accounts.any((account) => account.accID == accountID.toString())) {
      throw Exception("Account ID $accountID already exists.");
    }

    // create new acc
    bankAccount newAcc = bankAccount(
        accHolder: accOwner,
        accID: accountID.toString(),
        // balance: 0.0,
        accType: "saving ",
        creationDate: DateTime.now().toIso8601String());

    accounts.add(newAcc);
    print(
        "Account created: ID = ${newAcc.accID}, Holder = ${newAcc.accHolder}");
  }
}

void main() {
  bankAccount Acc = bankAccount(
      accHolder: "sreypov",
      accID: "1234",
      balance: 10,
      accType: "saving",
      creationDate: "10.20.2005");
  Bank bank = Bank(name: "ABA", location: "phnom penh");
  try {
    bank.createAcc(1234, "yaya pengpos");
    bank.createAcc(1234, "yaya pengpos");
  } catch (e) {
    print(e);
  }
  Acc.credit(10);
  Acc.withdraw(20);
  print(Acc.Getbalance());
}
