class DonerModel {
  String medicineName, date, imageUrl;
  int qantity;

  DonerModel({this.medicineName, this.date, this.qantity, this.imageUrl});

  DonerModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) return;
    medicineName = map['medicineName'];
    date = map['date'];
    qantity = map['qantity'];
    imageUrl = map['imageUrl'];
  }

  toJson() {
    return {
      'medicineName': medicineName,
      'date': date,
      'qantity': qantity,
      'imageUrl': imageUrl
    };
  }
}
