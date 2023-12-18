import 'package:sucrose/src/midtrans/models/entity/midtrans_address.dart';

class MidtransSellerDetail {
  /// Seller's ID.
  final String? id;

  /// Seller's name.
  final String? name;

  /// Seller's email address.
  final String? email;

  /// Seller's website URL.
  final String? url;

  /// Object of seller's address.
  final MidtransAddress? address;

  MidtransSellerDetail({
    this.id,
    this.name,
    this.email,
    this.url,
    this.address,
  });

  factory MidtransSellerDetail.fromJson(Map<String, dynamic> json) =>
      MidtransSellerDetail(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        url: json["url"],
        address: json["address"] == null
            ? null
            : MidtransAddress.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "url": url,
        "address": address?.toJson(),
      };
}
