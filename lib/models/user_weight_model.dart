import 'package:cloud_firestore/cloud_firestore.dart';

class UserWeightModel {
  String? name;
  String? weight;

  UserWeightModel({this.name, this.weight});

  UserWeightModel.fromMap(DocumentSnapshot data) {
    name = data["name"];
    weight = data["weight"];
  }
}
