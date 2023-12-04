// To parse this JSON data, do
//
//     final xenditIndividualDetail = xenditIndividualDetailFromJson(jsonString);

import 'dart:convert';

import 'package:sucrose/sucrose.dart';

XenditIndividualDetail xenditIndividualDetailFromJson(String str) =>
    XenditIndividualDetail.fromJson(json.decode(str));

String xenditIndividualDetailToJson(XenditIndividualDetail data) =>
    json.encode(data.toJson());

class XenditIndividualDetail {
  final String givenNames;
  final String? givenNamesNonRoman;
  final String surname;
  final String? surnameNonRoman;
  final String? nationality;
  final String? dateOfBirth;
  final String? placeOfBirth;
  final XenditCustomerGender? gender;
  final String? employment;

  XenditIndividualDetail({
    required this.givenNames,
    this.givenNamesNonRoman,
    required this.surname,
    this.surnameNonRoman,
    this.nationality,
    this.dateOfBirth,
    this.placeOfBirth,
    this.gender,
    this.employment,
  });

  factory XenditIndividualDetail.fromJson(Map<String, dynamic> json) =>
      XenditIndividualDetail(
        givenNames: json["given_names"],
        givenNamesNonRoman: json["given_names_non_roman"],
        surname: json["surname"],
        surnameNonRoman: json["surname_non_roman"],
        nationality: json["nationality"],
        dateOfBirth: json["date_of_birth"],
        placeOfBirth: json["place_of_birth"],
        gender: XenditCustomerGender.values.firstWhere(
          (element) => element.name == json["gender"],
        ),
        employment: json["employment"],
      );

  Map<String, dynamic> toJson() => {
        "given_names": givenNames,
        "surname": surname,
        if (givenNamesNonRoman != null)
          "given_names_non_roman": givenNamesNonRoman,
        if (surnameNonRoman != null) "surname_non_roman": surnameNonRoman,
        if (nationality != null) "nationality": nationality,
        if (dateOfBirth != null) "date_of_birth": dateOfBirth,
        if (placeOfBirth != null) "place_of_birth": placeOfBirth,
        if (gender != null) "gender": gender?.name,
        if (employment != null) "employment": employment,
      };
}
