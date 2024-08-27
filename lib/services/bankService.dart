part of 'services.dart';

class BankService {
  static Future<ApiReturnValue<List<Bank>>> getAllBank() async {
    try {
      var response = await dio.get('bank/all');
      if (response.statusCode == 200) {
        if (response.data['code'] == '00') {
          var data = response.data['data'];

          List<Bank> banks =
              (data as Iterable).map((e) => Bank.fromJson(e)).toList();
          // print('banks ${banks}');
          return ApiReturnValue(
              message: response.data['message'], value: banks);
        } else {
          return ApiReturnValue(message: 'Failed', value: response.data);
        }
      } else {
        return ApiReturnValue(message: 'Failed', value: response.data);
      }
    } catch (e) {
      return ApiReturnValue(message: 'Error', value: null);
    }
  }

  static Future<ApiReturnValue<List<Bank>>> getUserBank(int userId) async {
    try {
      var response = await dio.get('bank/userId/${userId}');
      if (response.data['code'] == '00') {
        var data = response.data['data'];
        List<Bank> banks =
            (data as Iterable).map((e) => Bank.fromJson(e)).toList();
        print(banks);
        return ApiReturnValue(message: response.data['message'], value: banks);
      } else {
        return ApiReturnValue(
            message: response.data['message'], value: response.data);
      }
    } catch (e) {
      return ApiReturnValue(message: e.toString(), value: null);
    }
  }

  static Future<ApiReturnValue<Bank>> getDetailUserBank(
      int userId, int bankId) async {
    try {
      var response = await dio.get('bank/get-bank-user',
          queryParameters: {"userId": userId, "bankId": bankId});
      if (response.data['code'] == '00') {
        return ApiReturnValue(
            message: response.data['message'], value: response.data);
      } else {
        return ApiReturnValue(
            message: response.data['message'], value: response.data);
      }
    } catch (e) {
      return ApiReturnValue(message: e.toString(), value: null);
    }
  }

  static Future<ApiReturnValue> addBankUser(
      int userId, int bankId, int totalBalance) async {
    print('bankId ${bankId}');
    print('userId ${userId}');
    print('totalBalance ${totalBalance}');
    try {
      var response = await dio.post('bank/add-bank-user', data: {
        "bankId": bankId,
        "totalBalance": totalBalance,
        "userId": userId
      });

      if (response.statusCode == 200) {
        if (response.data['code'] == '00') {
          return ApiReturnValue(
              message: response.data['message'], value: response.data);
        } else {
          return ApiReturnValue(message: 'Failed', value: response.data);
        }
      } else {
        return ApiReturnValue(message: 'Failed', value: response.data);
      }
    } catch (e) {
      return ApiReturnValue(message: 'Error', value: e.toString());
    }
  }

  static Future<ApiReturnValue> editBankUser(
      int userId, int bankId, int totalBalance, int currentBankId) async {
    try {
      var response = await dio
          .put('bank/edit-bank-user/bankId/${currentBankId}', data: {
        "bankId": bankId,
        "totalBalance": totalBalance,
        "userId": userId
      });

      if (response.statusCode == 200) {
        if (response.data['code'] == '00') {
          return ApiReturnValue(
              message: response.data['message'], value: response.data);
        } else {
          return ApiReturnValue(message: 'Failed', value: response.data);
        }
      } else {
        return ApiReturnValue(message: 'Failed', value: response.data);
      }
    } catch (e) {
      return ApiReturnValue(message: 'Error', value: e.toString());
    }
  }

  static Future<ApiReturnValue> deleteBankUser(int userId, int bankId) async {
    try {
      var response =
          await dio.delete('bank/delete-bank-user/${userId}/${bankId}');

      if (response.statusCode == 200) {
        if (response.data['code'] == '00') {
          return ApiReturnValue(
              message: response.data['message'], value: response.data);
        } else {
          return ApiReturnValue(message: 'Failed', value: response.data);
        }
      } else {
        return ApiReturnValue(message: 'Failed', value: response.data);
      }
    } catch (e) {
      return ApiReturnValue(message: 'Error', value: e.toString());
    }
  }

  static Future<ApiReturnValue> GetTotalBalance(int userId) async {
    try {
      var response = await dio.get('bank/balance/${userId}');

      if (response.statusCode == 200) {
        if (response.data['code'] == '00') {
          return ApiReturnValue(
              message: response.data['message'], value: response.data);
        } else {
          return ApiReturnValue(message: 'Failed', value: response.data);
        }
      } else {
        return ApiReturnValue(message: 'Failed', value: response.data);
      }
    } catch (e) {
      return ApiReturnValue(message: 'Error', value: e.toString());
    }
  }
}
