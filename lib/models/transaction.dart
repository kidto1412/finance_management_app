part of 'models.dart';

class Transaction extends Equatable {
  final String? id;
  final String? title;
  final String? date;
  final int? userId;
  final int? bankId;
  final String? bankName;
  final int? categoryId;
  final String? categoryName;
  final int? amount;
  final String? type;
  // final String? createdAt;
  // final String? updatedAt;
  Transaction({
    this.id,
    this.title,
    this.date,
    this.userId,
    this.bankId,
    this.bankName,
    this.categoryId,
    this.categoryName,
    this.amount,
    this.type,
    // this.createdAt,
    // this.updatedAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> data) => Transaction(
        id: data['id'],
        title: data['title'],
        date: data['date'],
        userId: data['userId'],
        bankId: data['bankId'],
        bankName: data['bankName'],
        categoryId: data['categoryId'],
        categoryName: data['categoryName'],
        amount: data['amount'],
        type: data['type'],
        // createdAt: data['createdAt'],
        // updatedAt: data['updatedAt'],
      );

  @override
  // TODO: implement props
  List<Object> get props => [
        id ?? '',
        title ?? '',
        date ?? '',
        userId ?? 0,
        bankId ?? 0,
        bankName ?? '',
        categoryId ?? 0,
        categoryName ?? '',
        amount ?? 0,
        type ?? '',
        // createdAt ?? '',
        // updatedAt ?? '',
      ];
}
