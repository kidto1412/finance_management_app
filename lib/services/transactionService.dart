part of 'services.dart';

class TransactionService {
  static Future<ApiReturnValue> addTransaction(String title, String date,
      int userId, int bankId, int amount, int categoryId, String type) async {
    try {
      var response = await dio.post('transaction/add-transaction', data: {
        "title": title,
        "date": date,
        "userId": userId,
        "bankId": bankId,
        "amount": amount,
        "categoryId": categoryId,
        "type": type,
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

  static Future<ApiReturnValue> getTransactionUser(int userId) async {
    try {
      var response = await dio.get('transaction/userId/${userId}');
      if (response.data['code'] == '00') {
        var data = response.data['data'];
        print(data);
        // List<Transaction> transactions =
        //     (data as Iterable).map((e) => Transaction.fromJson(e)).toList();
        // print(transactions);
        return ApiReturnValue(
            message: response.data['message'], value: response.data);
      } else {
        return ApiReturnValue(message: 'Failed', value: response.data);
      }
    } catch (e) {
      return ApiReturnValue(message: 'Failed', value: null);
    }
  }
}
