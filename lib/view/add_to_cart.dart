import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/commonwidget/custom_text.dart';
import 'package:task_app/model/apiModel/add_to_cart_model.dart';
import 'package:task_app/model/apiModel/get_product_res_model.dart';
import 'package:task_app/utils/color_utils.dart';
import 'package:task_app/utils/const_utils.dart';
import 'package:task_app/utils/prefrance.dart';
import 'package:task_app/view/auth/login.dart';
import 'package:task_app/viewmodel/auth_viewmodel.dart';
import '../utils/variable_utils.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key, this.data}) : super(key: key);
  final GetProductResModel? data;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  AuthViewModel authViewModel = Get.find<AuthViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorUtils.green,
        title: const CustomText(
          title: "Cart",
          fontsize: 20,
        ),
        actions: [
          IconButton(
              onPressed: () async {
                await PreferenceManagerUtils.setCurrentUser("");
                Get.offAll(() => Login());
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<AuthViewModel>(
              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.cartItemList.length,
                  itemBuilder: (context, index) {
                    final cartItem = controller.cartItemList[index];
                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: ListTile(
                        leading: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(cartItem.image),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        title: CustomText(title: cartItem.title),
                        subtitle: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                authViewModel.setCart(cartItem,
                                    isIncrement: false);
                                // _decrementQuantity(cartItem);
                              },
                            ),
                            CustomText(title: cartItem.qnt.toString()),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                // _incrementQuantity(cartItem);
                                authViewModel.setCart(cartItem,
                                    isIncrement: true);
                              },
                            ),
                          ],
                        ),
                        trailing: CustomText(
                          title:
                              "${VariableUtils.rsSymbol} ${((cartItem.price ?? 0) * (cartItem.qnt ?? 0)).toStringAsFixed(2)}",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(title: "Total Amount:", fontsize: 16),
                GetBuilder<AuthViewModel>(
                  builder: (controller) {
                    if (controller.cartItemList.isEmpty) {
                      return SizedBox();
                    }
                    return CustomText(
                      title:
                          "${VariableUtils.rsSymbol} ${(controller.cartItemList.map((e) => (e.price ?? 0) * (e.qnt ?? 0)).toList()).reduce((value, element) => value + element).toStringAsFixed(2)}",
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                    );
                  },
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {},
            child: const CustomText(title: "Proceed to Checkout"),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
