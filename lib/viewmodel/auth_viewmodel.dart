import 'dart:convert';

import 'package:get/get.dart';
import 'package:task_app/model/apiModel/add_to_cart_model.dart';
import 'package:task_app/model/apiModel/get_product_res_model.dart';

import '../model/apiModel/user_model.dart';
import '../utils/prefrance.dart';

class AuthViewModel extends GetxController {
  List<UserModel> userNumberList = [];
  List<GetProductResModel> cartItemList = [];
  UserModel currentUser = UserModel();

  @override
  void onInit() {
    final userNumberListPref = PreferenceManagerUtils.getUserNumberList();
    if (userNumberList.isNotEmpty) {
      userNumberList =
          userNumberListPref.map((e) => UserModel.fromJson(e)).toList();
    }
    final currentUserPref = PreferenceManagerUtils.getCurrentUser();

    if (currentUserPref.isNotEmpty) {
      currentUser = UserModel.fromJson(jsonDecode(currentUserPref));
      getPreCart();
    }

    super.onInit();
  }

  void getPreCart(){
    final cartPref = PreferenceManagerUtils.getAddToCart();
    if (cartPref.isNotEmpty) {
      cartItemList = cartPref
          .map((e) => GetProductResModel.fromJson(e))
          .toList()
          .where((element) => element.userId == currentUser.phoneNumber)
          .toList();
    }
  }
  void addUser(UserModel user) {
    userNumberList.add(user);
    PreferenceManagerUtils.setUserNumberList(
        userNumberList.map((e) => e.toJson()).toList());

  }

  void checkUserExist(UserModel user) {
    final containIndex = userNumberList.indexWhere((element) =>
        element.phoneNumber == user.phoneNumber &&
        element.password == user.password);
    if (containIndex == -1) {
      addUser(user);
    }
    currentUser = user;
    getPreCart();
    PreferenceManagerUtils.setCurrentUser(jsonEncode(user.toJson()));
  }

  void setCart(GetProductResModel product,{bool isIncrement=false}) {
    final containIndex = cartItemList.indexWhere((element) =>
        element.id == product.id && element.userId == product.userId);
    if (containIndex == -1) {
      product.userId=currentUser.phoneNumber;
      cartItemList.add(product);
    } else {
      if(isIncrement){
        cartItemList[containIndex].qnt=(cartItemList[containIndex].qnt??1)+1;
      }else{
        if(cartItemList[containIndex].qnt==1){
          cartItemList.removeAt(containIndex);
        }else{
          cartItemList[containIndex].qnt=(cartItemList[containIndex].qnt??1)-1;
        }

      }
      // cartItemList[containIndex] = product;
    }
    PreferenceManagerUtils.setAddToCart(
        cartItemList.map((e) => e.toJson()).toList());
    update();
  }
}
