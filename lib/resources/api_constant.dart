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
  static const String cart = "${baseUrl}cart/list";
  static const String addCart = "${baseUrl}cart";
  static const String removeCart = "${baseUrl}cart/remove";

//Category
  static const String category = "${baseUrl}category";
  static const String subCategory = "${baseUrl}subCategory";
  static const String documentation = "${baseUrl}documents";

  //Subscription Plan
  static const String getSubscriptionPlan = "${baseUrl}plan";
  static const String createSubscriptionPlan = "${baseUrl}subscription/create";

  //Card
  static const String addCard = "${baseUrl}card/add";
  static const String getCardList = "${baseUrl}card/list";
  static const String setDefaultCard = "${baseUrl}card/setdefault";
  static const String removeCard = "${baseUrl}card/remove";

  //Favourites
  static const String favouriteList = "${baseUrl}favouriteList";
  static const String favouriteAddRemove = "${baseUrl}favourite";
  static const String purchasedList = "${baseUrl}myPurchaseItem";

  //CMS Pages
  static const String cmsPages = "${baseUrl}page";
}
