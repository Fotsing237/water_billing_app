class BillsModel {
  final int id;
  final int oldIndex;
  final int newIndex;
  final int difference;
  final double amount;
  final bool debtStatus;
  final double debtAmount;
  final double totalAmount;
  final DateTime date;
  final int userId;
  
  BillsModel({
    required this.id,
    required this.oldIndex,
    required this.newIndex,
    required this.difference,
    required this.amount,
    required this.debtStatus,
    required this.debtAmount,
    required this.totalAmount,
    required this.date,
    required this.userId,
  });

  factory BillsModel.fromJson(Map<String, dynamic> json) {
    return BillsModel(
      id: json['id'] as int,
      oldIndex: json['oldIndex'] as int,
      newIndex: json['newIndex'] as int,
      difference: json['difference'] as int,
      amount: json['amount'] as double,
      debtStatus: json['debtStatus'] as bool,
      debtAmount: json['debtAmount'] as double,
      totalAmount: json['totalAmount'] as double,
      date: DateTime.fromMillisecondsSinceEpoch(json['date'] as int),
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'oldIndex': oldIndex,
    'newIndex': newIndex,
    'difference': difference,
    'amount': amount,
    'debtStatus': debtStatus,
    'debtAmount': debtAmount,
    'totalAmount': totalAmount,
    'date': date.millisecondsSinceEpoch,
    'userId': userId,
  };
}
