import 'package:finance_management/models/models.dart';
import 'package:finance_management/services/services.dart';
import 'package:flutter/material.dart';

class BankProvider extends ChangeNotifier {
  // AuthService _authService = AuthService();
  int? _userId;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  int? get userId => _userId;
  Future<void> addBankUser(
      String name, String username, String email, String password) async {
    _isLoading = true;
    notifyListeners();
    try {
      ApiReturnValue result =
          await AuthService.register(name, username, email, password);
      print('result ${result}');
      _userId = result.value['data'];
    } catch (e) {
      _userId = null;
    }
    _isLoading = false;
    notifyListeners();

    // This call tells the widgets that are listening to this model to rebuild.
  }

  /// Removes all items from the cart.
  void login() {
    notifyListeners();
  }

  void logout() {}
}
