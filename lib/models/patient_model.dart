class PatientModel {
  String name, medicineName, city, imageUrl, phoneNumber;
  int age;

  PatientModel(
      {this.name,
      this.phoneNumber,
      this.age,
      this.medicineName,
      this.city,
      this.imageUrl});

  PatientModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) return;
    name = map['name'];
    phoneNumber = map['phoneNumber'];
    age = map['age'];
    medicineName = map['medicineName'];
    city = map['city'];
    imageUrl = map['imageUrl'];
  }

  toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'age': age,
      'medicineName': medicineName,
      'city': city,
      'imageUrl': imageUrl
    };
  }
}
