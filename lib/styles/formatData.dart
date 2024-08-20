import 'package:intl/intl.dart';

class FormatData {
  var numberFormat1 = NumberFormat("#,###", "en_US");
  var numberFormat2 = NumberFormat("#,###.0#", "en_US");

  DateFormat dateFormat1 = DateFormat('dd/MM/yyyy');
  DateFormat dateFormat2 = DateFormat('yyyy-MM-dd');
  DateFormat dateFormat3 = DateFormat('dd/MM/yyyy HH:mm:ss');
  DateFormat dateFormat4 = DateFormat('yyyy-MM-dd HH:mm:ss');
  DateFormat dateFormat5 = DateFormat('yyMMddHHmmss');

  String intNumberFormat(double number) {
    return numberFormat1.format(number);
  }

  String doubleNumberFormat(double number) {
    return numberFormat2.format(number);
  }

  String getDateFormat(DateTime date, int code) {
    String result = dateFormat1.format(date);
    if (code > 0 && code < 6) {
      switch (code) {
        case 1:
          result = dateFormat1.format(date);
        case 2:
          result = dateFormat2.format(date);
        case 3:
          result = dateFormat3.format(date);
        case 4:
          result = dateFormat4.format(date);
        case 5:
          result = dateFormat5.format(date);
      }
    }
    return result;
  }
}
