class XenditEwalletAccount {
  final String? name;
  final dynamic balance;
  final dynamic pointBalance;
  final String? accountDetails;

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
        "name": name,
        "balance": balance,
        "point_balance": pointBalance,
        "account_details": accountDetails,
      };
}
