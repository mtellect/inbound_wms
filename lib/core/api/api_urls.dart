part of base_api;

class ApiUrl {
  //Base Instance
  static final EnvConfigurationsModel base = getIt.get<EnvConfigurationsModel>();
  static String baseApiUrl = base.baseUrl;

  static final String authDomain = '${baseApiUrl}auth/';
  static final String customerDomain = '${baseApiUrl}customer/';
  static final String driverDomain = '${baseApiUrl}driver/';
  static final String vehiclesDomain = '${baseApiUrl}vehicles/';
  static final String locationsDomain = '${baseApiUrl}locations/';
  static final String userDomain = '${authDomain}user/';
  static final String riderDomain = '${baseApiUrl}rider/';
  static final String createRiderPath = '${riderDomain}create-new-rider';
  static final String foodDomain = '${baseApiUrl}food/';
  static final String menuDomain = '${foodDomain}menu/';
  static final String foodSearchPath = '${menuDomain}list/search';

  /// [Authentication]
  static final String loginPath = '${userDomain}signin';
  static final String registerPath = '${userDomain}signup';
  static final String logoutPath = '${authDomain}logout';
  static final String forgotPasswordPath = '${baseApiUrl}forgot/password';
  static final String validateResetPasswordPath = '${forgotDomain}confirm-otp';
  static final String resetPasswordPath = '${baseApiUrl}forgot/password/reset';
  static final String confirmOtpPath = '${userDomain}confirm-otp';
  static final String verifyTwoFactorPath = '${authDomain}verify-two-factor';
  static final String mePath = '${userDomain}me';
  static final String updatePasswordPath = '${userDomain}change-pasword';
  static final String broadcastingAuthPath = '${baseApiUrl}broadcasting/auth';
  static final String updateLocationPath = '${userDomain}update-location';
  static final String requestAccountDeletionPath = '${userDomain}delete/account';
  static final String signoutPath = '${userDomain}signout';
  static final String googleAuthCallbackPath = '${authDomain}google/callbacks';
  static final String appleAuthCallbackPath = '${authDomain}apple/callbacks';

  /// [Profile]
  static final String getCustomerProfilePath = '${customerDomain}profile';
  static final String getDriverProfilePath = '${driverDomain}profile';
  static final String updateCustomerProfilePath = '${customerDomain}profile';
  static final String updateDriverProfilePath = '${driverDomain}profile';
  static final String updateVendorDetailsPath = '${baseApiUrl}user/profile/update-vendor-details';

  static final String forgotDomain = '${baseApiUrl}forgot/password/';
  static final String resendOtpPath = '${forgotDomain}resend-otp';
  static final String updateRiderDetailsPath = '${baseApiUrl}user/profile/update-rider-details';

  /// [Location]
  static final String locationStatesPath = '${locationsDomain}states';
  static final String locationStatesWithCitiesPath = '${locationsDomain}states-with-cities';
  static final String locationCitiesSearchPath = '${locationsDomain}cities/search';
  static final String locationCitiesPopularPath = '${locationsDomain}cities/popular';
  static final String locationCitiesNearbyPath = '${locationsDomain}cities/nearby';
  static final String locationAddressAutocompletePath = '${locationsDomain}address/autocomplete';
  static final String locationAddressSearchPath = '${locationsDomain}address/search';
  static final String locationAddressDetailsPath = '${locationsDomain}address/details';

  static String locationStateByCodePath(String code) => '${locationsDomain}states/$code';
  static String locationStateCitiesPath(String code) => '${locationsDomain}states/$code/cities';
  static String locationCityByIdPath(String id) => '${locationsDomain}cities/$id';

  /// [Google Maps Public]
  static const String googleMapsAutocompletePath =
      'https://maps.googleapis.com/maps/api/place/autocomplete/json';
  static const String googleMapsTextSearchPath =
      'https://maps.googleapis.com/maps/api/place/textsearch/json';
  static const String googleMapsPlaceDetailsPath =
      'https://maps.googleapis.com/maps/api/place/details/json';
  static const String googleMapsReverseGeocodePath =
      'https://maps.googleapis.com/maps/api/geocode/json';

  /// [Tags]
  static final String tagsDomain = '${customerDomain}tags';
  static final String tagsDraftDomain = '$tagsDomain/draft';
  static final String tagsUpdateDomain = '$tagsDomain/update';
  static final String tagDraftActivePath = '$tagsDomain/draft/active';
  static String tagDraftPath({required String id}) => '$tagsDomain/$id/draft';
  static String tagSummaryPath({required String id}) => '$tagsDomain/$id/summary';
  static String payTagPath({required String id}) => '$tagsDomain/$id/pay';
  static String cancelTagPath({required String id}) => '$tagsDomain/$id/cancel';
  static String rateTagPath({required String id}) => '$tagsDomain/$id/rate';
  static String tagPath({required String id}) => '$tagsDomain/$id';

  /// [Payment Methods]
  static final String paymentMethodsDomain = '${baseApiUrl}payment-methods';
  static final String paymentMethodsPath = paymentMethodsDomain;
  static final String paymentMethodsSetupIntentPath = '$paymentMethodsDomain/setup-intent';
  static final String paymentMethodsDefaultPath = '$paymentMethodsDomain/default';
  static String paymentMethodByIdPath({required String id}) => '$paymentMethodsDomain/$id';
  static String paymentMethodSetDefaultPath({required String id}) =>
      '$paymentMethodsDomain/$id/set-default';
  static String paymentMethodDeletePath({required String id}) => '$paymentMethodsDomain/$id';

  /// [Delivery Addresses]
  static final String deliveryAddressesDomain = '${customerDomain}delivery-addresses';
  static final String deliveryAddressesPath = deliveryAddressesDomain;
  static final String deliveryAddressesDefaultPath = '$deliveryAddressesDomain/default';
  static String deliveryAddressByIdPath({required String id}) => '$deliveryAddressesDomain/$id';
  static String deliveryAddressSetDefaultPath({required String id}) =>
      '$deliveryAddressesDomain/$id/set-default';

  /// [Bank Accounts]
  static final String majorBanksPath = '${driverDomain}bank-accounts/major-banks';
  static String lookupRoutingPath({required String number}) =>
      '${driverDomain}bank-accounts/lookup-routing/$number';

  // CRUD endpoints
  static final String bankAccountPath = '${driverDomain}bank-accounts';
  static String bankAccountByIdPath({required String id}) => '${driverDomain}bank-account/$id';
  static final String bankAccountVerificationStatusPath =
      '${driverDomain}bank-account/verification-status';

  // Bank V2 Endpoints
  static final String createBankAccountV2Path = '${baseApiUrl}bank/account/create';
  static final String bankAccountListsV2Path = '${baseApiUrl}bank/account/lists';
  static final String bankListsVendorRiderPath = '${baseApiUrl}bank/lists/vendor-rider';
  static String deleteBankAccountV2Path({required String id}) =>
      '${baseApiUrl}bank/delete-account/$id';
  static final String walletWithdrawPath = '${baseApiUrl}user/wallet/withdraw';
  static final String verifyBankAccountPath = '${baseApiUrl}user/bank/verify-account';
  static final String initiatePaymentPath = '${baseApiUrl}payment/initiate-payment';
  static String verifyPaymentPath(String reference) => '${baseApiUrl}payment/verify/$reference';

  /// [Settings]
  static final String settingsPath = '${baseApiUrl}settings';
  static final String settingsDarkModeTogglePath = '$settingsPath/dark-mode/toggle';
  static final String settingsTwoFactorMethodsPath = '$settingsPath/two-factor/methods';
  static final String settingsTwoFactorEnablePath = '$settingsPath/two-factor/enable';
  static final String settingsTwoFactorDisablePath = '$settingsPath/two-factor/disable';
  static final String settingsTwoFactorChangeMethodPath = '$settingsPath/two-factor/change-method';
  static final String settingsTwoFactorTotpSetupPath = '$settingsPath/two-factor/totp/setup';
  static final String settingsTwoFactorTotpConfirmPath = '$settingsPath/two-factor/totp/confirm';
  static final String settingsTwoFactorRecoveryCodesPath =
      '$settingsPath/two-factor/recovery-codes';
  static final String settingsTwoFactorRecoveryCodesRegeneratePath =
      '$settingsPath/two-factor/recovery-codes/regenerate';

  /// [Account Appeals]
  static final String accountAppealsPath = '${baseApiUrl}account-appeals';
  static final String accountAppealsStatusPath = '$accountAppealsPath/status';
  static String accountAppealByIdPath(String id) => '$accountAppealsPath/$id';

  /// [Driver Tags]
  static final String driverTagsPath = '${baseApiUrl}driver/tags';
  static final String driverAvailableTagsPath = '$driverTagsPath/available';
  static String driverTagByIdPath(String id) => '$driverTagsPath/$id';
  static String driverAcceptTagPath(String id) => '$driverTagsPath/$id/accept';
  static String driverUpdateTagStatusPath(String id) => '$driverTagsPath/$id/update-status';
  static String mapboxDirectionsPath({
    required double startLng,
    required double startLat,
    required double endLng,
    required double endLat,
  }) => 'https://api.mapbox.com/directions/v5/mapbox/driving/$startLng,$startLat;$endLng,$endLat';
  static String mapboxGeocodingPath({
    required double lng,
    required double lat,
  }) => 'https://api.mapbox.com/geocoding/v5/mapbox.places/$lng,$lat.json';

  /// [Documents]
  static final String driverDocumentsPath = '${baseApiUrl}driver/documents';
  static final String driverUploadDocumentPath = '$driverDocumentsPath/upload';
  static String driverDocumentByIdPath(String id) => '$driverDocumentsPath/$id';

  /// [Preferences]
  static final String driverPreferencesPath = '${baseApiUrl}driver/preferences';
  static final String driverPreferenceOptionsPath = '$driverPreferencesPath/options';
  static final String driverToggleAutoAcceptPath = '$driverPreferencesPath/toggle-auto-accept';
  static final String driverDeliveryTypesOptionsPath =
      '$driverPreferenceOptionsPath/delivery-types';

  /// [Availability]
  static final String driverAvailabilityPath = '${baseApiUrl}driver/availability';
  static final String driverToggleAvailabilityPath =
      '${baseApiUrl}driver/profile/toggle-availability';
  static final String updateKitchenAvailabilityPath = '${baseApiUrl}kitchen/update-availability';
  static final String updateRiderAvailabilityPath = '${baseApiUrl}update-rider-availability';

  /// [Earnings]
  static final String driverEarningsPath = '${baseApiUrl}driver/earnings';
  static final String driverEarningsSummaryPath = '$driverEarningsPath/summary';
  static final String driverEarningsAveragePath = '$driverEarningsPath/average';
  static final String driverRequestPayoutPath = '$driverEarningsPath/request-payout';
  static final String riderEarningsPath = '${baseApiUrl}rider/earnings';

  /// [Driver Eligibility]
  static final String driverRegistrationProgressPath =
      '${customerDomain}driver-registration-progress';
  static final String driverEligibilityPath = '${customerDomain}driver-eligibility';
  static final String registerAsDriverPath = '${customerDomain}register-as-driver';

  /// [Support Tickets]
  static final String supportTicketsPath = '${baseApiUrl}support-tickets';
  static final String supportTicketsCategoriesPath = '${baseApiUrl}support-tickets/categories';
  static final String supportTicketsPrioritiesPath = '${baseApiUrl}support-tickets/priorities';
  static String supportTicketIdPath(String id) => '${baseApiUrl}support-tickets/$id';
  static String supportTicketReplyPath(String id) => '${baseApiUrl}support-tickets/$id/reply';
  static String supportTicketClosePath(String id) => '${baseApiUrl}support-tickets/$id/close';
  static String supportTicketReopenPath(String id) => '${baseApiUrl}support-tickets/$id/reopen';

  /// [Chat]
  static final String chatPath = '${baseApiUrl}chat';
  static String chatTagMessagesPath(String tagId) => '$chatPath/tags/$tagId/messages';
  static String chatTagUnreadCountPath(String tagId) => '$chatPath/tags/$tagId/unread-count';
  static String chatMessageReadPath(String messageId) => '$chatPath/messages/$messageId/read';

  /// [Notifications]
  static final String notificationsPath = '${baseApiUrl}user/notifications';
  static final String notificationsUnreadCountPath = '$notificationsPath/count';
  static String notificationMarkAsReadPath(String id) => '$notificationsPath/read/$id';

  /// [Accounts]
  static final String addAddressPath = '${ordersDomain}add-delivery-address';
  static final String updatePrimaryAddressPath = '$baseApiUrl/update-primary-address';
  static String removeDeliveryAddressPath(String id) =>
      '${ordersDomain}remove-delivery-address/$id';
  static final String deleteAccountPath = '$baseApiUrl/delete_account';

  /// [Orders]
  static final String ordersDomain = '${baseApiUrl}order/';
  static final String mostOrderedFoodsPath = '${ordersDomain}most-ordered-foods';
  static final String myRunningOrdersPath = '${ordersDomain}my-running-orders';
  static final String completeOrderPath = '${ordersDomain}complete-order';
  static final String cancelOrderedFoodPath = '${ordersDomain}cancel-ordered-food';
  static final String acceptOrderedFoodPath = '${ordersDomain}accept-ordered-food';
  static final String myOngoingOrdersPath = '${ordersDomain}my-ongoing-orders';
  static final String customerActiveOrdersPath = '${ordersDomain}customer-active-orders';
  static final String customerOrdersHistoryPath = '${historyDomain}orders';
  static final String placeOrderPath = '${ordersDomain}place-order';
  static final String placeGiftOrderPath = '${ordersDomain}place-gift-order';
  static final String placeCombinedOrderPath = '${ordersDomain}combined-order';
  static final String findRiderPath = '${ordersDomain}find-rider';
  static final String riderDetailsPath = '${ordersDomain}rider-details';
  static final String requestRiderPath = '${ordersDomain}place/request-rider';
  static final String vendorCodesPath = '${ordersDomain}vendor-codes';
  static final String trackOrderPath = '${ordersDomain}track-order';
  static String confirmOrderDetailsPath(String id) => '${ordersDomain}confirm-order-details/$id';
  static String orderDetailsByIdPath(String id) => '${ordersDomain}order-details/$id';
  static String aboutVendorPath(String vendorId) => '${ordersDomain}about-vendor/$vendorId';
  static final String kitchenTimetablePath = '${ordersDomain}vendor/search/kitchen-timetable';

  /// [Vendor]
  static final String vendorDomain = '${baseApiUrl}vendor/';
  static final String timetableDomain = '${baseApiUrl}time-table/';
  static final String vendorDashboardPath = '${vendorDomain}my-dashboard';
  static final String fetchMyAddonsPath = '${vendorDomain}fetch-my-addons';
  static final String createAddonPath = '${vendorDomain}create-addon';
  static String updateAddonPath(String id) => '${vendorDomain}addons/$id';
  static final String updateAddonsPath = '${vendorDomain}addons/update';
  static String deleteAddonPath(String id) => '${vendorDomain}addon/$id/delete';
  static final String storeFoodMenuAddonPath = '${vendorDomain}food-menu-addons/store';
  static String myFoodDetailsPath(String menuId) => '${vendorDomain}my-food-details/$menuId';
  static final String myFoodListPath = '${vendorDomain}my-food-list';

  static final String vendorTimetablePath = '${timetableDomain}vendor-time-table';
  static final String storeTimetablePath = '${timetableDomain}store';
  static String deleteTimetablePath(String id) => '${timetableDomain}delete-time-table/$id';

  /// [Kitchen]
  static final String kitchenDomain = '${baseApiUrl}kitchen/';
  static final String kitchenStorePath = '${kitchenDomain}store';
  static final String allKitchensPath = '${kitchenDomain}all-kitchens';
  static final String fetchKitchensPath = '${kitchenDomain}fetch-kitchens';
  static final String kitchenLocationDeliveryPath = '${kitchenDomain}location-delivery';
  static String kitchenDetailsPath(String id) => '${kitchenDomain}details/$id';
  static String kitchenByIdPath(String id) => '$kitchenDomain$id';

  /// [Delivery]
  static final String deliveryDomain = '${baseApiUrl}delivery/';
  static final String historyDomain = '${baseApiUrl}history/';
  static final String deliveryTypesPath = '${deliveryDomain}types';
  static final String availableDeliveriesPath = '${baseApiUrl}rider/available-deliveries';
  static String riderDeliveryDetailsPath(String id) => '${baseApiUrl}rider/delivery-details/$id';
  static final String acceptDeliveryPath = '${riderDomain}accept-delivery';
  static final String startDeliveryPath = '${riderDomain}start-delivery';
  static final String sendConfirmOrderCodePath = '${riderDomain}send-confirm-order-code';
  static final String dropoffDeliveryPath = '${riderDomain}dropoff-delivery';

  static final String deliveriesInProgressPath =
      '${deliveryDomain}rider/vendor/deliveries-in-progress';
  static final String completedDeliveriesPath = '${deliveryDomain}rider/completed-deliveries';
  static final String deliveryHistoryPath = '${historyDomain}delivery-histories';
  static final String ordersHistoryPath = '${historyDomain}orders';
  static String deliveryDetailsPath(String id) => '${historyDomain}delivery-history-details/$id';
  static final String transactionHistoriesPath = '${historyDomain}transaction-histories';
  static String transactionHistoryDetailsPath(String id) =>
      '${historyDomain}transaction-history-details/$id';

  static final String storeDeliveryDetailsPath = '${deliveryDomain}store/delivery-details';
  static final String storeDeliveryDetailsImagePath =
      '${deliveryDomain}store/delivery-details-image';
  static final String cancelDeliveryPath = '${deliveryDomain}cancel-delivery';
  static final String feesServiceChargePath = '${deliveryDomain}fees-service-charge';
  static final String ongoingDeliveriesPath = '${deliveryDomain}rider/ongoing-deliveries';

  /// [Food]
  static final String foodItemsCategoriesPath = '${foodDomain}items/categories';
  static final String foodItemsImagesPath = '${foodDomain}items/food-images';
  static final String foodTimeTablesPath = '${foodDomain}items/time-tables';
  static final String foodMealTypesPath = '${foodDomain}items/time-tables/meal-types';
  static final String toogleFoodPath = '${foodDomain}items/toogle-food';
  static final String storeFoodMenuPath = '${menuDomain}store';
  static String updateMenuPath(String id) => '${menuDomain}update/$id';
  static String deleteMenuPath(String id) => '${menuDomain}delete/$id';
  static String foodMenuDetailsPath(String id) => '$menuDomain$id/details';

  /// [Ads]
  static final String adsDomain = '${baseApiUrl}ads/';
  static final String bannerAdsPath = '${adsDomain}banner-ads';
  static final String allAdsPath = '${adsDomain}all-ads';
  static final String vendorAdsDomain = '${adsDomain}vendor/';
  static final String vendorShowAdsPath = '${vendorAdsDomain}show-ads';
  static final String vendorAllAdsPath = '${vendorAdsDomain}all-ads';
  static final String vendorPlaceAdsPath = '${vendorAdsDomain}place-ads';

  /// [Reviews]
  static String kitchenReviewsPath(String kitchenId) => '${customerDomain}reviews/$kitchenId';
  static String foodReviewsPath(String foodId) => '${customerDomain}customer-food-reviews/$foodId';

  /// [Food Categories]
  static final String foodCategoriesPath = '${foodDomain}items-categories';
  static String categoryDetailsPath(String id) => '${menuDomain}category-details/$id';

  /// [Bidding]
  static final String highestBiddersPath = '${baseApiUrl}bid/highest-bidders';

  /// [Meal Plan]
  static final String mealPlanLinkPath = '${baseApiUrl}mealplan/link';

  /// [Favorites]
  static final String favouritesDomain = '${baseApiUrl}favourites/';
  static final String favouriteFoodItemsPath = '${favouritesDomain}food-items';
  static final String favouriteRestaurantsPath = '${favouritesDomain}restaurants';
  static final String favouriteStoreItemsPath = '${favouritesDomain}store-items';
  static final String favouriteRemoveItemsPath = '${favouritesDomain}remove-items';

  /// [Cart]
  static final String cartDomain = '${baseApiUrl}cart/';
  static final String myCartItemsPath = '${cartDomain}my-cart-items';
  static final String addToCartPath = '${cartDomain}add-to-cart';
  static final String updateQuantityPath = '${cartDomain}update-quantity';
  static final String updateAddonQuantityPath = '${cartDomain}update-addon-quantity';
  static String removeItemPath(String id) => '${cartDomain}remove-item/$id';
  static String removeAddonItemPath(String id) => '${cartDomain}remove-addon-item/$id';
  static final String clearCartPath = '${cartDomain}clear';
  static final String checkoutSummaryPath = '${cartDomain}checkout-summary';
  static final String addGifteeLocationPath = '${cartDomain}add-giftee-location';

  /// [Checkout & Orders]
  static final String checkoutDeliveryAddressesPath = '${ordersDomain}delivery-addresses';
}
