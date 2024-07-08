class SuretiesModel {
  String? distributor;
  String? amount;
  String? unitPrice;
  String? prefix;
  String? deadLine;
  String? id;

  SuretiesModel(
      {this.distributor,
      this.amount,
      this.unitPrice,
      this.prefix,
      this.deadLine,
      this.id});

  SuretiesModel.fromJson(Map<String, dynamic> json) {
    distributor = json["distributor"];
    amount = json["amount"];
    unitPrice = json["unitPrice"];
    prefix = json["prefix"];
    deadLine = json["deadLine"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["distributor"] = distributor;
    data["amount"] = amount;
    data["unitPrice"] = unitPrice;
    data["prefix"] = prefix;
    data["deadLine"] = deadLine;
    data["id"] = id;
    return data;
  }
}
