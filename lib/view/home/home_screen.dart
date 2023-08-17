import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/model/apiModel/get_product_res_model.dart';
import 'package:task_app/model/apis/api_response.dart';
import 'package:task_app/utils/color_utils.dart';
import 'package:task_app/utils/prefrance.dart';
import 'package:task_app/view/auth/login.dart';
import 'package:task_app/view/home/product_details_screen.dart';
import 'package:task_app/viewmodel/product_viewmodel.dart';
import 'package:sizer/sizer.dart';

import '../../commonwidget/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductViewModel productViewModel = Get.find();

  // GetProductResModel? res;

  @override
  void initState() {
    apiCall();
    super.initState();
  }

  apiCall() async {
    await productViewModel.getProductViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorUtils.green,
        title: const CustomText(title: "Products", fontsize: 20),
        actions: [
          IconButton(
              onPressed: () async {
                await PreferenceManagerUtils.setCurrentUser("");
                Get.offAll(() => Login());
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: GetBuilder<ProductViewModel>(builder: (controller) {
        if (controller.getProductResponse.status == Status.LOADING) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.getProductResponse.status == Status.ERROR) {
          return const Center(child: Text('Error'));
        }
        if (controller.getProductResponse.status == Status.COMPLETE) {}
        return GridView.builder(
          itemCount: controller.getProductResModel.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              mainAxisExtent: Get.width * 0.95),
          itemBuilder: (BuildContext context, int index) {
            log('======abcd======${controller.getProductResModel[index].title}');

            return GestureDetector(
              onTap: () {
                Get.to(() => ProductDetailsScreen(
                      model: controller.getProductResModel[index],
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Card(
                  elevation: 0,
                  color: Colors.green.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Container(
                    margin: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                      // color: Colors.orange,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                            child: Image(
                              width: double.infinity,
                              height: 20.h,
                              image: NetworkImage(
                                  controller.getProductResModel[index].image!),
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          CustomText(
                            title: controller.getProductResModel[index].title!,
                            fontWeight: FontWeight.bold,
                            fontsize: 3.w,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(5.w)),
                            child: Padding(
                              padding: EdgeInsets.all(3.w),
                              child: CustomText(
                                title:
                                    "₹ ${controller.getProductResModel[index].price}",
                                fontsize: 20,
                                fontWeight: FontWeight.bold,
                                color: ColorUtils.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          CustomText(
                              title:
                                  "Rating:- ${controller.getProductResModel[index].rating!.rate}",
                              fontsize: 14,
                              fontWeight: FontWeight.w500),
                          SizedBox(
                            height: 1.h,
                          ),
                          CustomText(
                              title:
                                  "category:- ${controller.getProductResModel[index].category}",
                              fontsize: 14,
                              fontWeight: FontWeight.w500),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
