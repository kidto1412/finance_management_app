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

  bool? _addUserBankLoading;
  bool? get addUserBankLoading => _addUserBankLoading;

  ApiReturnValue? _resultAdd;
  ApiReturnValue? get resultAdd => _resultAdd;
  // int? get userId => _userId;

  Future<void> addBankUser(int userId, int bankId, int totalBalance) async {
    _addUserBankLoading = true;
    notifyListeners();
    try {
      ApiReturnValue result =
          await BankService.addBankUser(userId, bankId, totalBalance);
      print('result ${result.value}');
      if (result.value['code'] == "00") {
        _resultAdd = result;
        _addUserBankLoading = false;
      } else {
        _resultAdd = result.value;
        _addUserBankLoading = false;
      }

      // _userId = result.value['data'];
    } catch (e) {
      _resultAdd = null;
      _addUserBankLoading = false;
    }
    _addUserBankLoading = false;
    notifyListeners();
  }

  Future<void> GetALlBank() async {
    _isLoading = true;
    notifyListeners();
    try {
      ApiReturnValue result = await BankService.getAllBank();

      _banks = await result.value;

      _isLoading = false;
      // _userId = result.value['data'];
    } catch (e) {
      _isLoading = false;
      _banks = [];
      // _userId = null;
    }

    notifyListeners();
  }

  Future<void> GetUserBank(int userId) async {
    print(userId);
    _isLoading = true;
    notifyListeners();
    try {
      ApiReturnValue result = await BankService.getUserBank(userId);
      print('result ${result.value}');

      _userBanks = result.value;
      print(userBanks);

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
