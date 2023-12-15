class MidtransSubscriptionRetrySchedule {
  /// Subscription's retry interval given by merchant.
  final String? intervalUnit;

  /// Retry interval temporal unit.
  ///
  /// Note: Supports `minute`, `hour`, and `day`.
  final String? maxInterval;

  /// Maximum retry interval of subscription (up to 3 times). Subscription will end after maximum interval is reached.
  final int? interval;

  /// Subscription's retry interval given by merchant.
  ///
  /// Details of the retry scheudle
  MidtransSubscriptionRetrySchedule({
    this.intervalUnit,
    this.maxInterval,
    this.interval,
  });

  factory MidtransSubscriptionRetrySchedule.fromJson(
          Map<String, dynamic> json) =>
      MidtransSubscriptionRetrySchedule(
        intervalUnit: json["interval_unit"],
        maxInterval: json["max_interval"],
        interval: json["interval"],
      );

  Map<String, dynamic> toJson() => {
        "interval_unit": intervalUnit,
        "max_interval": maxInterval,
        "interval": interval,
      };
}
