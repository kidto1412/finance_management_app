import 'package:finance_management/models/models.dart';
import 'package:finance_management/services/services.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  // AuthService _authService = AuthService();
  int? _userId;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  int? get userId => _userId;

  bool? _loadUserCategory = false;
  bool? get loadUserCategory => _loadUserCategory;

  List<Category>? _resultUserCategory;
  List<Category>? get resultUserCategory => _resultUserCategory;

  ApiReturnValue? _resultAdd;
  ApiReturnValue? get resultAdd => _resultAdd;

  List<Category>? _allCategories;
  List<Category>? get allCategories => _allCategories;

  Future<void> GetAll() async {
    _isLoading = true;
    notifyListeners();
    try {
      ApiReturnValue result = await CategoryService.getAll();
      _allCategories = result.value;
    } catch (e) {
      _userId = null;
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> GetCategoryUser(int userId) async {
    _isLoading = true;
    notifyListeners();
    try {
      ApiReturnValue result = await CategoryService.getCategoryUser(userId);
      _resultUserCategory = result.value;
    } catch (e) {
      _resultUserCategory = null;
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> AddCategory() async {
    _isLoading = true;
    notifyListeners();
    try {
      ApiReturnValue result = await CategoryService.getAll();
    } catch (e) {
      _userId = null;
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> AddCategoryUser() async {
    _isLoading = true;
    notifyListeners();
    try {
      ApiReturnValue result = await CategoryService.getAll();
    } catch (e) {
      _userId = null;
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
