class MidtransAction {
  ///	Action name.
  final String? name;

  /// HTTP method used for the action.
  final String? method;

  /// HTTP URL target for the action.
  final String? url;

  /// Object containing the action name, HTTP method, and HTTP URL target.
  MidtransAction({
    this.name,
    this.method,
    this.url,
  });

  factory MidtransAction.fromJson(Map<String, dynamic> json) => MidtransAction(
        name: json["name"],
        method: json["method"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "method": method,
        "url": url,
      };
}
