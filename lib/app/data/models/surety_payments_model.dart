class SuretyPaymentsModel {
  final int id;
  final double advance;
  final double rest;
  final String suretyStatus;
  final DateTime createAt;
  final DateTime updatedAt;
  
  SuretyPaymentsModel({
    required this.id,
    required this.advance,
    required this.rest,
    required this.suretyStatus,
    required this.createAt,
    required this.updatedAt,
  });

  factory SuretyPaymentsModel.fromJson(Map<String, dynamic> json) {
    return SuretyPaymentsModel(
      id: json['id'] as int,
      advance: json['advance'] as double,
      rest: json['rest'] as double,
      suretyStatus: json['suretyStatus'] as String,
      createAt: DateTime.fromMillisecondsSinceEpoch(json['createAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(json['updatedAt'] as int),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'advance': advance,
    'rest': rest,
    'suretyStatus': suretyStatus,
    'createAt': createAt.millisecondsSinceEpoch,
    'updatedAt': updatedAt.millisecondsSinceEpoch,
  };
}
