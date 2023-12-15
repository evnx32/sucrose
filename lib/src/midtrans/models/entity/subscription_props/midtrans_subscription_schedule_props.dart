class MidtransSubscriptionScheduleProps {
  /// Subscription's interval given by merchant.
  final int? interval;

  /// Interval temporal unit.
  ///
  /// Note: Supports `day`, `week`, and `month`.
  final String? intervalUnit;

  /// Maximum interval of subscription. Subscription will end after maximum interval is reached.
  final int? maxInterval;

  /// Timestamp of subscription in yyyy-MM-dd HH:mm:ss Z. The value must be after the current time. If specified, first payment will happen on start_time. If start_time is not specified, the default value for start_time will be the date after the first interval after current time.
  final String? startTime;

  /// Timestamp of subscription's previous charge schedule in yyyy-MM-dd HH:mm:ss Z +Timezone format.
  final String? previousExecutionAt;

  /// Update subscription's next charge schedule. Timestamp of schedule must be in yyyy-MM-dd HH:mm:ss Z +Timezone format. The value must be after the current time. Date should also be later than the created date/last charged date + interval, if you're updating an active subscription. Can also be used to reactive expired subscription.
  final String? nextExecutionAt;

  MidtransSubscriptionScheduleProps({
    this.interval,
    this.intervalUnit,
    this.maxInterval,
    this.startTime,
    this.previousExecutionAt,
    this.nextExecutionAt,
  });

  factory MidtransSubscriptionScheduleProps.fromJson(
          Map<String, dynamic> json) =>
      MidtransSubscriptionScheduleProps(
        interval: json["interval"],
        intervalUnit: json["interval_unit"],
        maxInterval: json["max_interval"],
        startTime: json["start_time"],
        previousExecutionAt: json["previous_execution_at"],
        nextExecutionAt: json["next_execution_at"],
      );

  Map<String, dynamic> toJson() => {
        "interval": interval,
        "interval_unit": intervalUnit,
        "max_interval": maxInterval,
        "start_time": startTime,
        "previous_execution_at": previousExecutionAt,
        "next_execution_at": nextExecutionAt
      };
}
