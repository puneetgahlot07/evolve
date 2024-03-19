class ApiUrls {
  static const String domain =
      "https://v5.checkprojectstatus.com/evolve/public/";

  // static const String domain = "https://app.trvlbag.com/"; // live Url
  static const String baseUrl = "${domain}api/v1/";

  // Sign In And Login Api
  static const String login = "${baseUrl}login";
  static const String register = "${baseUrl}register";
  static const String profile = "${baseUrl}profile";
  static const String forgotpassword = "${baseUrl}forgotpassword";
  static const String changepassword = "${baseUrl}changepassword";
  static const String profileUpdate = "${baseUrl}profileUpdate";

//Cart
  static const String cartCategory = "${baseUrl}category";
  static const String cartSubCategory = "${baseUrl}subCategory";

  //Subscription Plan
  static const String subscriptionPlan = "${baseUrl}plan";

  //Favourites
  static const String favouriteList = "${baseUrl}favouriteList";

  //CMS Pages
  static const String cmsPages = "${baseUrl}page";
}
