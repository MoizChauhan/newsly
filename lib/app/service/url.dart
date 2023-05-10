// ignore_for_file: non_constant_identifier_names

class URL {
  static String Base_Url = "http://dev.saturncube.com:9005/api/";
  // static String Base_Url = "http://145.14.158.99:9005/api/"; //Client
  static String Map_Base_Url = "https://maps.googleapis.com/maps/api/place/";
  static String SaveTokenURL = "user/save-token/";
  static String LoginUrl = "user/login/token";
  static String UpdatePhoneUrl = "user/edit-phone/";
  static String UpdateUserProfileUrl = "user/edit/";
  static String AddCategoryUrl = "category";
  static String AllRestaurantCategory = "category";
  static String ActiveRestaurantCategory = "category/active";
  static String ActiveMenuCategory = "menu/category/active";
  static String RestaurantSubCategory = "category/sub?id=";
  static String Restaurant = "restaurant";
  static String Update = "/update/";
  static String Menu_category = "menu/category/active";
  static String MenuItems = "menu/";
  static String AddMenuCategoryUrl = "menu/category";
  static String AddSubCategoryUrl = "category/sub";
  static String VipBadge = "vip_badge/";
  static String AllMenuCategory = "menu/category?page={page}&limit=100&search";
  static String AllRestaurantSubCategory =
      "category/sub?id={id}&page={page}&limit=100&search";
  static String UpdateRestaurantCategory = "category/update/{id}";
  static String UpdateMenuCategory = "menu/category/update/{id}";
  static String UpdateSubRestaurantCategory = "category/sub/update/{id}";
  static String Favorite = "favourite";
}
