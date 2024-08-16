import 'package:finance_management/models/models.dart';
import 'package:finance_management/services/services.dart';
import 'package:flutter/material.dart';

class BankProvider extends ChangeNotifier {
  // AuthService _authService = AuthService();
  List<Bank>? _banks;
  bool _isLoading = false;
  List<Bank>? get getAll => _banks;

  List<Bank>? _userBanks;
  List<Bank>? get userBanks => _userBanks;

  bool get isLoading => _isLoading;
  // int? get userId => _userId;

  Future<void> addBankUser(int bankId, int userId, int totalBalance) async {
    _isLoading = true;
    notifyListeners();
    try {
      ApiReturnValue result =
          await BankService.addBankUser(bankId, userId, totalBalance);
      print('result ${result.value}');
      _banks = result.value;
      // _userId = result.value['data'];
    } catch (e) {
      _banks = [];
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> GetALlBank() async {
    _isLoading = true;
    notifyListeners();
    try {
      ApiReturnValue result = await BankService.getAllBank();
      print('result ${result.value}');

      _banks = result.value;
      Map<int, String> bankMap = {
        for (var bank in result.value) bank.bankId!: bank.bankName!
      };
      print(bankMap);
      _isLoading = false;
      // _userId = result.value['data'];
    } catch (e) {
      _isLoading = false;
      _banks = [];
      // _userId = null;
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> GetUserBank(int userId) async {
    _isLoading = true;
    notifyListeners();
    try {
      ApiReturnValue result = await BankService.getUserBank(userId);
      print('result ${result.value}');

      _userBanks = result.value;

      _isLoading = false;
      // _userId = result.value['data'];
    } catch (e) {
      _isLoading = false;
      _userBanks = [];
      // _userId = null;
    }
    _isLoading = false;
    notifyListeners();
  }

  /// Removes all items from the cart.
  void login() {
    notifyListeners();
  }

  void logout() {}
}
