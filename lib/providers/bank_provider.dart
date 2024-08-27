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

  Map? _dataDetailBankUser;
  Map? get dataDetailBankUser => _dataDetailBankUser;

  // int? get userId => _userId;

  ApiReturnValue? _resultEdit;
  ApiReturnValue? get resultEdit => _resultEdit;

  ApiReturnValue? _resultDelete;
  ApiReturnValue? get resultDelete => _resultDelete;

  int? _totalBalance;
  int? get totalBalance => _totalBalance;

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
        _resultAdd = result;
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

  Future<void> editBankUser(
      int userId, int bankId, int totalBalance, int currentBankId) async {
    _addUserBankLoading = true;
    notifyListeners();
    try {
      ApiReturnValue result = await BankService.editBankUser(
          userId, bankId, totalBalance, currentBankId);
      print('result ${result.value}');
      if (result.value['code'] == "00") {
        _resultEdit = result;
        _addUserBankLoading = false;
      } else {
        _resultEdit = result.value;
        _addUserBankLoading = false;
      }

      // _userId = result.value['data'];
    } catch (e) {
      _resultEdit = null;
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

  Future<void> GetDetailUserBank(int userId, int bankId) async {
    print(userId);
    _isLoading = true;
    notifyListeners();
    try {
      ApiReturnValue result =
          await BankService.getDetailUserBank(userId, bankId);
      print('result ${result.value}');
      _dataDetailBankUser = result.value;
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      _dataDetailBankUser = {};
      // _userId = null;
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> DeleteBankUser(int userId, int bankId) async {
    _isLoading = true;
    notifyListeners();
    try {
      ApiReturnValue result = await BankService.deleteBankUser(userId, bankId);
      print('result ${result.value}');
      _resultDelete = result.value;
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      _resultDelete = null;
      // _userId = null;
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> GetTotalBalance(int userId) async {
    _isLoading = true;
    notifyListeners();
    try {
      ApiReturnValue result = await BankService.GetTotalBalance(userId);
      print('result ${result.value}');
      _totalBalance = result.value['data'];
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      _totalBalance = null;
      // _userId = null;
    }
    _isLoading = false;
    notifyListeners();
  }
}
