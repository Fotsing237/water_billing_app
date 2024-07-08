class ReceiptsModel {
  final int id;
  final double amount;
  final double avance;
  final double rest;
  final DateTime date;
  final String signature;
  final String paymentStatus;

  ReceiptsModel({
    required this.id,
    required this.amount,
    required this.avance,
    required this.rest,
    required this.date,
    required this.signature,
    required this.paymentStatus,
  });

  factory ReceiptsModel.fromJson(Map<String, dynamic> json) {
    return ReceiptsModel(
      id: json['id'] as int,
      amount: json['amount'] as double,
      avance: json['avance'] as double,
      rest: json['rest'] as double,
      date: DateTime.fromMillisecondsSinceEpoch(json['date'] as int),
      signature: json['signature'],
      paymentStatus: json['paymentStatus'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'amount': amount,
    'avance': avance,
    'rest': rest,
    'date': date.millisecondsSinceEpoch,
    'signature': signature,
    'paymentStatus': paymentStatus,
  };
}
