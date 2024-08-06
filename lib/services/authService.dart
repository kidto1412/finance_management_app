part of 'services.dart';

class authService {
  static Future<ApiReturnValue> register(
      String username, String name, String email, String password) async {
    try {
      var response = await dio.post('users/register', data: {
        'name': name,
        'username': username,
        'email': email,
        'password': password
      });
      return ApiReturnValue(
          message: response.data.message,
          // Set the appropriate fields based on the response
          value: response.data);
    } catch (e) {
      return ApiReturnValue(
        message: e.toString(),
        value: e.toString(),
      );
    }
  }

  static Future<ApiReturnValue> login(
      String username, String name, String email, String password) async {
    try {
      var response = await dio
          .post('users/login', data: {'name': name, 'password': password});
      return ApiReturnValue(
          message: response.data.message, value: response.data);
    } catch (e) {
      return ApiReturnValue(message: e.toString(), value: e.toString());
    }
  }

  // static Future<ApiReturnValue> Logout(
  //     String username, String name, String email, String password) async {
  //   var response = await dio.post('users/register', data: {
  //     'name': name,
  //     'username': username,
  //     'email': email,
  //     'password': password
  //   });
  // }
}
