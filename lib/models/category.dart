part of 'models.dart';

class Category extends Equatable {
  final int? categoryId;
  final String? categoryName;

  Category({
    this.categoryId,
    this.categoryName,
  });

  factory Category.fromJson(Map<String, dynamic> data) => Category(
        categoryId: data['categoryId'] ?? 0,
        categoryName: data['categoryName'] ?? '',
      );

  @override
  // TODO: implement props
  List<Object> get props => [
        categoryId ?? 0,
        categoryName ?? '',
      ];
}
