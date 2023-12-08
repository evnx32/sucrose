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

  /// The generated QR code to be scanned by the end user in order to perform the action
  final String? qrCode;

  /// desktop_web_checkout_url
  final String? desktopWebCheckoutUrl;

  /// mobile_web_checkout_url
  final String? mobileWebCheckoutUrl;

  /// mobile_deeplink_checkout_url
  final String? mobileDeeplinkCheckoutUrl;

  /// qr_checkout_string
  final String? qrCheckoutString;

  /// If status=REQUIRES_ACTION, this contains objects that detail the possible next steps in order to complete a payment. Only one of the provided actions is required to be fulfilled. If no further action is needed, this parameter will be an empty array [].
  XenditActions({
    this.method,
    this.urlType,
    this.action,
    this.url,
    this.qrCode,
    this.desktopWebCheckoutUrl,
    this.mobileWebCheckoutUrl,
    this.mobileDeeplinkCheckoutUrl,
    this.qrCheckoutString,
  });

  factory XenditActions.fromJson(Map<String, dynamic> json) => XenditActions(
        method: json["method"],
        urlType: json["url_type"],
        action: json["action"],
        url: json["url"],
        qrCode: json["qr_code"],
        desktopWebCheckoutUrl: json["desktop_web_checkout_url"],
        mobileWebCheckoutUrl: json["mobile_web_checkout_url"],
        mobileDeeplinkCheckoutUrl: json["mobile_deeplink_checkout_url"],
        qrCheckoutString: json["qr_checkout_string"],
      );

  Map<String, dynamic> toJson() => {
        if (method != null) "method": method,
        if (urlType != null) "url_type": urlType,
        if (action != null) "action": action,
        if (url != null) "url": url,
        if (qrCode != null) "qr_code": qrCode,
        if (desktopWebCheckoutUrl != null)
          "desktop_web_checkout_url": desktopWebCheckoutUrl,
        if (mobileWebCheckoutUrl != null)
          "mobile_web_checkout_url": mobileWebCheckoutUrl,
        if (mobileDeeplinkCheckoutUrl != null)
          "mobile_deeplink_checkout_url": mobileDeeplinkCheckoutUrl,
        if (qrCheckoutString != null) "qr_checkout_string": qrCheckoutString,
      };
}
