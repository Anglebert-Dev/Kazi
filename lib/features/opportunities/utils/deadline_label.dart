import 'package:intl/intl.dart';

final _dateFormat = DateFormat('MMM d, yyyy');

String deadlineLabel(DateTime deadline) => 'Deadline: ${_dateFormat.format(deadline)}';
