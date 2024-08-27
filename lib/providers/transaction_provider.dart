import 'package:finance_management/models/models.dart';
import 'package:finance_management/services/services.dart';
import 'package:flutter/cupertino.dart';

class TransactionProvider extends ChangeNotifier {
  bool? _isLoading;
  bool? get isLoading => _isLoading;

  ApiReturnValue? _resultAddTrans;
  ApiReturnValue? get resultAddTrans => _resultAddTrans;

  bool? _loadTransaction;
  bool? get loadTransaction => _loadTransaction;

  List<Transaction>? _transactions;
  List<Transaction>? get transactions => _transactions;

  Future<void> addTransaction(String title, String date, int userId, int bankId,
      int amount, int categoryId, String type) async {
    _isLoading = true;
    notifyListeners();
    try {
      ApiReturnValue result = await TransactionService.addTransaction(
          title, date, userId, bankId, amount, categoryId, type);

      if (result.value['code'] == "00") {
        _resultAddTrans = result;

        _isLoading = false;
      } else {
        _resultAddTrans = result;
        _isLoading = false;
      }

      // _userId = result.value['data'];
    } catch (e) {
      _resultAddTrans = null;
      _isLoading = false;
    }

    notifyListeners();
  }

  Future<void> GetTransactionUser(int userId) async {
    notifyListeners();
    _loadTransaction = true;

    try {
      ApiReturnValue result =
          await TransactionService.getTransactionUser(userId);
      if (result.value['code'] == '00') {
        var data = result.value['data'];

        List<Transaction> transactions = await (data as Iterable)
            .map((e) => Transaction.fromJson(e))
            .toList();
        print('transactions ${transactions}');
        _transactions = transactions;
        print('value ${_transactions}');
        _loadTransaction = false;
      } else {
        _transactions = [];
        _loadTransaction = false;
      }
    } catch (e) {
      _transactions = [];
      _loadTransaction = false;
    }
    _loadTransaction = false;
    notifyListeners();
  }
}
