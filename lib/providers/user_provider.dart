import 'package:finance_management/models/models.dart';
import 'package:finance_management/services/services.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  // AuthService _authService = AuthService();
  int? _userId;
  bool _isLoading = false;
  ApiReturnValue? _resultRegister;
  ApiReturnValue? _resultAddBank;

  bool get isLoading => _isLoading;
  int? get userId => _userId;
  ApiReturnValue? get resultRegister => _resultRegister;
  ApiReturnValue? get resultAddBakn => _resultAddBank;

  Future<void> register(String name, String email, String username,
      String password, String bankName, int totalBalance) async {
    _isLoading = true;
    notifyListeners();
    try {
      ApiReturnValue response =
          await AuthService.register(name, email, username, password);
      if (response.value['code'] == '00') {
        _userId = response.value['data'];
        _resultRegister = response;

        ApiReturnValue<dynamic> responseBank =
            await BankService.addBankUser(bankName, totalBalance, _userId!);
        if (responseBank.value['code'] == "00") {
          _isLoading = false;
          _resultAddBank = responseBank;
        } else {
          _isLoading = false;
          _resultAddBank =
              ApiReturnValue(message: "Bank registration failed", value: null);
        }
        print(responseBank);
      } else {
        _resultRegister =
            ApiReturnValue(message: "User registration failed", value: null);
        _isLoading = false;
      }
    } catch (e) {
      _userId = null;
      _resultRegister = ApiReturnValue(message: e.toString(), value: null);
      _resultAddBank = ApiReturnValue(message: e.toString(), value: null);
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
