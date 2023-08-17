import 'package:get_storage/get_storage.dart';

class PreferenceManagerUtils {
  static final getStorage = GetStorage();

  static const userNumberList = "USER_NUMBER_LIST";
  static const currentUser = "CURRENT_USER";
  static const addToCart = "ADD_TO_CART";

  /// USER NUMBER LIST
  static Future<void> setUserNumberList(List<Map<String,dynamic>> list) async {
    await getStorage.write(userNumberList, list);
  }

  static List getUserNumberList() {
    return getStorage.read(userNumberList) ?? [];
  }

  /// CURRENT USER
  static Future<void> setCurrentUser(String value) async {
    await getStorage.write(currentUser, value);
  }

  static String getCurrentUser() {
    return getStorage.read(currentUser) ?? "";
  }

  /// ADD TO CART
  static Future<void> setAddToCart(List<Map<String,dynamic>> list) async {
    await getStorage.write(addToCart, list);
  }

  static List getAddToCart() {
    return getStorage.read(addToCart) ?? [];
  }
}
