import 'package:cloud_firestore/cloud_firestore.dart';

class UserWeightModel {
  String? name;
  String? weight;
  String? documentId;
  Timestamp? dateTime;

  UserWeightModel({this.name, this.weight, this.documentId, this.dateTime});

  UserWeightModel.fromMap(DocumentSnapshot data) {
    name = data["name"];
    weight = data["weight"];
    dateTime = data["time"] as Timestamp;
    documentId = data.id;
  }
}
