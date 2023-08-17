import 'dart:developer';

import 'package:get/get.dart';

import '../model/apiModel/get_product_res_model.dart';
import '../model/apis/api_response.dart';
import '../model/repo/product_repo/product_api_repo.dart';

class ProductViewModel extends GetxController {
  ApiResponse getProductResponse = ApiResponse.initial('Initial');

  List<GetProductResModel> getProductResModel=[];
  Future<void> getProductViewModel() async {

    getProductResponse = ApiResponse.loading('Loading');

   try {
      final response = await ProductApiRepo().userTokenNotificationDateRepo();
      print("response == ${response}");
      getProductResponse = ApiResponse.complete(response);
      getProductResModel=response;

      log("allNotificationApiResponse RES: ${getProductResModel.runtimeType})");
    } catch (e) {
      log('allNotificationApiResponse.....$e');
      getProductResponse = ApiResponse.error('error');
    }

    update();
  }
}
///=============all Notification View Model===============///




