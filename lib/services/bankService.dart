part of 'services.dart';

class BankService {
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
