class MidtransPatchSubscriptionSchedule {
  /// Subscription interval specified by you.
  ///
  /// It's like a frequency of the subscription.
  ///
  /// e.g. If you set the interval to 1, the subscription will be charged every 1 intervalUnit.
  ///
  /// interval unit can be day, week, month, or year.
  ///
  /// The value must be greater than 0.
  final int? interval;

  MidtransPatchSubscriptionSchedule({
    this.interval,
  });

  factory MidtransPatchSubscriptionSchedule.fromJson(
          Map<String, dynamic> json) =>
      MidtransPatchSubscriptionSchedule(
        interval: json["interval"],
      );

  Map<String, dynamic> toJson() => {
        "interval": interval,
      };
}
