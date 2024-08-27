part of 'services.dart';

class CategoryService {
  static Future<ApiReturnValue> getAll() async {
    try {
      var response = await dio.get('category');
      if (response.data['code'] == '00') {
        var data = response.data['data'];
        // print(data);

        List<Category> categories =
            (data as Iterable).map((e) => Category.fromJson(e)).toList();
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

  static Future<ApiReturnValue> getCategoryUser(int userId) async {
    try {
      var response = await dio.get('category/userId/${userId}');
      if (response.data['code'] == '00') {
        var data = response.data['data'];
        print(data);
        List<Category> categories =
            (data as Iterable).map((e) => Category.fromJson(e)).toList();
        print(categories);
        return ApiReturnValue(
            message: response.data['message'], value: categories);
      } else {
        return ApiReturnValue(message: 'Failed', value: response.data);
      }
    } catch (e) {
      return ApiReturnValue(message: 'Error', value: e.toString());
    }
  }

  static Future<ApiReturnValue> addCategoryUser(
      int userId, int categoryId) async {
    try {
      var response = await dio.post('category/add-user-category', data: {
        "userId": userId,
        "categoryId": categoryId,
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

  static Future<ApiReturnValue> addCategory(String name, int userId) async {
    try {
      var response = await dio
          .post('category/add', data: {"name": name, "userId": userId});
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
