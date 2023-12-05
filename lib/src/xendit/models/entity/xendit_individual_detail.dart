import 'package:sucrose/src/xendit/enums/enums.dart';

class XenditIndividualDetail {
  /// Primary or first name/s of customer
  final String givenNames;

  ///
  final String? givenNamesNonRoman;

  ///  Last or family name of customer
  final String surname;
  final String? surnameNonRoman;

  /// Country code for customer's nationality
  ///
  /// Format ISO 3166-2 Country Code
  final String? nationality;

  /// Date of birth of the customer
  ///
  /// Format YYYY-MM-DD string
  final String? dateOfBirth;

  /// City or other relevant location for the customer’s birth place
  final String? placeOfBirth;

  /// Gender of customer
  final XenditCustomerGender? gender;

  /// Name of account holder as per the account provider
  final String? employment;

  /// Object containing details of the individual. Will be null if type is not `INDIVIDUAL`
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
