class MidtransGopayPartner {
  /// Phone number linked to the customer's account.
  final String phoneNumber;

  /// Country code associated with the phone number.
  final String countryCode;

  ///	URL where user is redirected to after finishing the confirmation on Gojek app.
  final String? redirectUrl;

  ///	GoPay linking specific parameters.
  MidtransGopayPartner({
    required this.phoneNumber,
    required this.countryCode,
    this.redirectUrl,
  });

  factory MidtransGopayPartner.fromJson(Map<String, dynamic> json) =>
      MidtransGopayPartner(
        phoneNumber: json["phone_number"],
        countryCode: json["country_code"],
        redirectUrl: json["redirect_url"],
      );

  Map<String, dynamic> toJson() => {
        "phone_number": phoneNumber,
        "country_code": countryCode,
        "redirect_url": redirectUrl,
      };
}
