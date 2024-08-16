part of 'models.dart';

class Bank extends Equatable {
  final int? bankId;
  final String? bankName;
  final int? totalBalance;

  Bank({this.bankId, this.bankName, this.totalBalance});

  factory Bank.fromJson(Map<String, dynamic> data) => Bank(
        bankId: data['bankId'],
        bankName: data['bankName'],
        totalBalance: data['totalBalance'] ?? 0,
      );

  @override
  // TODO: implement props
  List<Object> get props => [
        bankId ?? 0,
        bankName ?? '',
        totalBalance ?? 0,
      ];
}
