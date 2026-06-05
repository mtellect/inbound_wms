part of 'base_extension.dart';

extension NumCurrencyExtension on num {
  /// Formats the number as currency using the provided symbol and locale
  String toPrice(String symbol, [String? locale]) {
    // For common currencies, simpleCurrency handles symbol placement better
    if (symbol == '₦' || symbol == '\$' || symbol == '£' || symbol == '€') {
      final String? name = switch (symbol) {
        '₦' => 'NGN',
        '\$' => 'USD',
        '£' => 'GBP',
        '€' => 'EUR',
        _ => null,
      };
      
      return NumberFormat.simpleCurrency(
        locale: locale,
        name: name,
        decimalDigits: 2,
      ).format(this);
    }

    final formatter = NumberFormat.currency(
      symbol: symbol,
      decimalDigits: 2,
      locale: locale,
    );
    return formatter.format(this);
  }

  /// Formats the number as Naira currency (₦) - Deprecated: use toPrice instead
  String get toNaira {
    return toPrice('₦', 'en_NG');
  }

  /// Formats the number as currency with a custom symbol
  String toCurrency([String symbol = '₦']) {
    return toPrice(symbol);
  }
  
  /// Formats the number as currency without the symbol
  String get formatAmount {
    final formatter = NumberFormat.decimalPattern('en_US');
    return formatter.format(this);
  }
}
