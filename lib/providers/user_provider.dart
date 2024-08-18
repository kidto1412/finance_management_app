import 'package:finance_management/models/models.dart';
import 'package:finance_management/services/services.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

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

  Future<void> register(
      String name, String email, String username, String password) async {
    _isLoading = true;
    notifyListeners();
    try {
      ApiReturnValue response =
          await AuthService.register(name, email, username, password);
      if (response.value['code'] == '00') {
        _userId = response.value['data'];
        _resultRegister = response;
        _isLoading = false;
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
    // _isLoading = false;
    notifyListeners();

    // This call tells the widgets that are listening to this model to rebuild.
  }

  ApiReturnValue? _userLoggedin;
  ApiReturnValue? get userLoggedIn => _userLoggedin;

  Future<void> login(
    String username,
    String password,
  ) async {
    _isLoading = true;
    notifyListeners();
    try {
      ApiReturnValue response = await AuthService.login(username, password);
      if (response.value['code'] == '00') {
        print('userId ${response.value}');
        _userId = response.value['data'];
        localStorage.setItem("userId", _userId.toString());
        _userLoggedin = response;
        print(' response form provider ${response}');
        _isLoading = false;
      } else {
        _userLoggedin =
            ApiReturnValue(message: "User registration failed", value: null);
        _isLoading = false;
      }
    } catch (e) {
      _userId = null;
      _userLoggedin =
          ApiReturnValue(message: "User registration failed", value: null);
      _isLoading = false;
    }

    notifyListeners();
  }

  void logout() {}
}
