import 'package:intl/intl.dart';

String convertDate(DateTime date) => DateFormat('HH:mm, dd/MM ').format(date);
