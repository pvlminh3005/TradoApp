import 'package:intl/intl.dart';

String FormatPrice(int priceDecreaseSale) {
  return NumberFormat.currency(
    locale: 'id',
    decimalDigits: 0,
    symbol: '',
  ).format(priceDecreaseSale).toString();
}
