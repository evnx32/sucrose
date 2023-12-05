class XenditActions {
  /// HTTP method for calling the url.
  final String? method;

  /// Type of url for the specific action.
  ///
  /// Possible values are: `WEB` , `DEEP_LINK`,`API` and `MOBILE`
  ///
  /// `API` - The provided url is a server-side API, merchant will need to provide necessary information to the API
  ///
  /// `WEB` - The provided redirect url is optimized for desktop or web interface. This can also be used if no MOBILE url is provided. Merchant will need to redirect their end user to this page to complete payment authentication.
  ///
  /// `MOBILE` - The provided redirect url is optimized for mobile devices. Merchant will need detect the mobile device and redirect their end user to this page to complete payment authentication.
  ///
  /// DEEPLINK - The provided redirect url utilizes deep linking to the channel partner’s platform. Merchant will need detect the mobile device and redirect their end user to this page to complete payment authentication.
  final String? urlType;

  /// Describes the purpose the corresponding action
  final String? action;

  /// The generated URL to hit in order to perform the action
  final String? url;

  /// If status=REQUIRES_ACTION, this contains objects that detail the possible next steps in order to complete a payment. Only one of the provided actions is required to be fulfilled. If no further action is needed, this parameter will be an empty array [].
  XenditActions({
    this.method,
    this.urlType,
    this.action,
    this.url,
  });

  factory XenditActions.fromJson(Map<String, dynamic> json) => XenditActions(
        method: json["method"],
        urlType: json["url_type"],
        action: json["action"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "method": method,
        "url_type": urlType,
        "action": action,
        "url": url,
      };
}
