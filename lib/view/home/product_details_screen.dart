import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:task_app/commonwidget/custom_text.dart';
import 'package:task_app/model/apiModel/get_product_res_model.dart';
import 'package:task_app/utils/color_utils.dart';
import 'package:task_app/utils/variable_utils.dart';
import 'package:task_app/viewmodel/auth_viewmodel.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key, required this.model}) : super(key: key);
  final GetProductResModel model;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  AuthViewModel authViewModel = Get.find<AuthViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.white,
      appBar: AppBar(
        backgroundColor: ColorUtils.green,
        title: Text(widget.model.title!),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 42.h,
            width: double.infinity,
            child: Image(
              image: NetworkImage(widget.model.image!),
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(1.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      title: widget.model.title!,
                      fontsize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    CustomText(
                        title: widget.model.category!,
                        fontsize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorUtils.grey),
                    CustomText(
                        title:
                            "${VariableUtils.rating} ${widget.model.rating?.rate}",
                        fontsize: 13.sp,
                        fontWeight: FontWeight.w500),
                    CustomText(
                        title: widget.model.description!, fontsize: 13.sp),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Card(
        elevation: 10,
        shadowColor: ColorUtils.grey,
        child: Container(
          height: 7.h,
          // width: 400,
          decoration: BoxDecoration(
              // color: Colors.orange,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6.w),
                  topRight: Radius.circular(6.w))),
          child: Padding(
            padding: EdgeInsets.all(2.5.w),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 40.w,
                  // height: 9.h,
                  // decoration: BoxDecoration(color: Colors.orange.shade200),
                  child: Center(
                    child: CustomText(
                        title:
                            "${VariableUtils.rsSymbol} ${widget.model.price}",
                        fontWeight: FontWeight.bold,
                        fontsize: 18.sp),
                  ),
                ),
                InkWell(
                  onTap: () {

                    GetProductResModel model=widget.model;
                    model.qnt=1;
                    authViewModel.setCart(model);
                    Get.snackbar("Add to Cart", "product added successfully");
                  },
                  child: Container(
                    width: 45.w,
                    decoration: BoxDecoration(
                        color: ColorUtils.green,
                        borderRadius: BorderRadius.circular(4.w)),
                    child: Center(
                      child: CustomText(
                          title: VariableUtils.addToCart,
                          fontWeight: FontWeight.bold,
                          fontsize: 15.sp,
                          color: ColorUtils.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
