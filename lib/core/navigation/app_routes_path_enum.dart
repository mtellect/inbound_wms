enum AppRoutePathEnum {
  login('/login'),
  dashboard('/dashboard'),
  scanner('/scanner'),
  overview(''),
  purchaseOrders('purchase-orders'),
  shipments('shipments'),
  triage('triage'),
  products('products'),
  suppliers('suppliers'),
  users('users'),
  sessions('sessions');

  final String path;
  const AppRoutePathEnum(this.path);
}
