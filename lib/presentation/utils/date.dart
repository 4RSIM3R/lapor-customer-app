import 'package:intl/intl.dart';

String toMysqlDate(DateTime dateTime) {
  return DateFormat('yyyy-MM-dd').format(dateTime);
}