import 'package:cloud_firestore/cloud_firestore.dart';

class UserWeightModel {
  String? name;
  String? weight;
  String? documentId;

  UserWeightModel({this.name, this.weight, this.documentId});

  UserWeightModel.fromMap(DocumentSnapshot data) {
    name = data["name"];
    weight = data["weight"];
    documentId = data.id;
  }
}
