enum AvailabilityStatus { available, busy, interning }

extension AvailabilityStatusLabel on AvailabilityStatus {
  String get label => switch (this) {
    AvailabilityStatus.available => 'Available',
    AvailabilityStatus.busy => 'Busy',
    AvailabilityStatus.interning => 'Interning',
  };
}
