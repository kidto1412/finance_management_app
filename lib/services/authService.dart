part of 'services.dart';

class AuthService {
  static Future<ApiReturnValue> register(
      String name, String email, String username, String password) async {
    try {
      var response = await dio.post('users/register', data: {
        'name': name,
        'email': email,
        'username': username,
        'password': password
      });
      // print(response);
      if (response.data['code'] == '00') {
        print(response.data['code']);
        return ApiReturnValue(
            message: response.data['message'],
            // Set the appropriate fields based on the response
            value: response.data);
      } else {
        return ApiReturnValue(
            message: response.data['message'],
            // Set the appropriate fields based on the response
            value: response.data);
      }
    } catch (e) {
      return ApiReturnValue(
        message: e.toString(),
        value: null,
      );
    }
  }

  static Future<ApiReturnValue> login(String username, String password) async {
    try {
      var response = await dio.post('users/login',
          data: {'username': username, 'password': password});

      if (response.data['code'] == "00") {
        // print(data);
        print('response ${response}');
        print("data ${response.data}");

        return ApiReturnValue(
            message: response.data['message'], value: response.data);
      } else {
        return ApiReturnValue(
            message: response.data['message'], value: response.data);
      }

      // var data = response as Map<String, dynamic>;
    } catch (e) {
      return ApiReturnValue(message: e.toString(), value: e.toString());
    }
  }
}
