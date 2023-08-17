import 'dart:convert';
import 'dart:developer';

import '../../apiModel/get_product_res_model.dart';
import '../../apiService/api_service.dart';
import '../../apiService/base_service.dart';

class ProductApiRepo extends BaseService {
  Future<List<GetProductResModel>> userTokenNotificationDateRepo() async {
    var response = await ApiService()
        .getResponse(apiType: APIType.aGet, url: getProductDetails);

    if (response == null) {
      return [];
    }

    final result = (response as List)
        .map((e) => GetProductResModel.fromJson(e))
        .toList();
    log('=======${result}');

    return result;
  }


  // Future userTokenNotificationDateRepo() async {
  //   var response = await ApiService().getResponse(
  //       apiType: APIType.aGet,
  //       url: getProductDetails,
  //   );
  //   log("===============allNotificationDate Res:====================$response");
  //   if (response == null) {
  //     return [];
  //   }
  //   return jsonDecode(response);
  // }
}
