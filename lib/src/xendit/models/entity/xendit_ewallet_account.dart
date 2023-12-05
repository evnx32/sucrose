class XenditEwalletAccount {
  /// Name of the eWallet account holder. This will be null if unavailable.
  final String? name;

  /// Current available balance in the eWallet. This will be null if unavailable.
  final int? balance;

  /// Current available points in the eWallet for consumption. This will be null if unavailable.
  final int? pointBalance;

  /// Masked public identifier for the eWallet account. This typically contains the masked mobile number registered to the eWallet account. This will be null if unavailable.
  final String? accountDetails;

  /// Object that contains information of the linked eWallet account. Will be null if information is not available.
  XenditEwalletAccount({
    this.name,
    this.balance,
    this.pointBalance,
    this.accountDetails,
  });

  factory XenditEwalletAccount.fromJson(Map<String, dynamic> json) =>
      XenditEwalletAccount(
        name: json["name"],
        balance: json["balance"],
        pointBalance: json["point_balance"],
        accountDetails: json["account_details"],
      );

  Map<String, dynamic> toJson() => {
        if (name != null) "name": name,
        if (balance != null) "balance": balance,
        if (pointBalance != null) "point_balance": pointBalance,
        if (accountDetails != null) "account_details": accountDetails,
      };
}
