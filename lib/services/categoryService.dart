part of 'services.dart';

class CategoryService {
  static Future<ApiReturnValue> getAll() async {
    try {
      var response = await dio.get('/category');
      if (response.data['code'] == '00') {
        var data = response.data;
        // print(data);
        print(response.data);
        List<Category> categories = (response.data as Iterable)
            .map((e) => Category.fromJson(e))
            .toList();
        print(categories);
        return ApiReturnValue(
            message: response.data['message'], value: categories);
      } else {
        return ApiReturnValue(
            message: response.data['message'], value: response.data);
      }
    } catch (e) {
      return ApiReturnValue(message: e.toString(), value: null);
    }
  }

  static Future<ApiReturnValue> getUserBank(int userId) async {
    try {
      var response = await dio.get('userId/${userId}');
      if (response.data['code'] == '00') {
        return ApiReturnValue(
            message: response.data['message'], value: response.data);
      } else {
        return ApiReturnValue(message: 'Failed', value: response.data);
      }
    } catch (e) {
      return ApiReturnValue(message: 'Error', value: e.toString());
    }
  }

  static Future<ApiReturnValue> addBankUser(
      String bankName, int totalBalance, int userId) async {
    try {
      var response = await dio.post('bank/add-bank-user', data: {
        "bankName": bankName,
        "totalBalance": totalBalance,
        "userId": userId
      });
      if (response.data['code'] == '00') {
        return ApiReturnValue(
            message: response.data['message'], value: response.data);
      } else {
        return ApiReturnValue(message: 'Failed', value: response.data);
      }
    } catch (e) {
      return ApiReturnValue(message: 'Error', value: e.toString());
    }
  }
}
