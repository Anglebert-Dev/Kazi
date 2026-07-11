enum HiringStatus { hiring, notHiring }

extension HiringStatusLabel on HiringStatus {
  String get label => switch (this) {
    HiringStatus.hiring => 'Hiring',
    HiringStatus.notHiring => 'Not Hiring',
  };
}
