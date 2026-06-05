enum AppRoutePathEnum {
  login('/login'),
  dashboard('/dashboard'),
  scanner('/scanner');

  final String path;
  const AppRoutePathEnum(this.path);
}
