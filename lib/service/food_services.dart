part of 'services.dart';

class FoodServices{
  static Future<ApiReturnValue<List<Food>>> getFoods() async {
    await Future.delayed(Duration(seconds: 3));

    return ApiReturnValue(value: mockFoods);
  }
}