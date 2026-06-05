part of 'base_extension.dart';

extension ContextExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  bool get isMobile => width < 600;
  bool get isTablet => width >= 600 && width < 700;
  bool get isDesktop => width >= 700;

  double get responsiveHorizontalPadding => isDesktop ? 32.0 : 16.0;
  double get responsiveVerticalPadding => isDesktop ? 32.0 : 24.0;
  
  EdgeInsets get responsivePadding => EdgeInsets.symmetric(
        horizontal: responsiveHorizontalPadding,
        vertical: responsiveVerticalPadding,
      );

}

extension BoxConstraintsExtension on BoxConstraints {
  bool get isDesktop => maxWidth > 700;
}
