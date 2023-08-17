import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/utils/color_utils.dart';
import 'package:task_app/utils/product_text.dart';
import 'package:task_app/view/bottombar.dart';
import 'package:task_app/viewmodel/auth_viewmodel.dart';
import 'package:sizer/sizer.dart';

import '../../commonwidget/custom_btn.dart';
import '../../commonwidget/custom_text_field.dart';
import '../../model/apiModel/user_model.dart';
import '../../utils/regularexpression.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  RxBool isLoading = false.obs;
  UserModel reqModel = UserModel();
  final _formKey = GlobalKey<FormState>();
  AuthViewModel authViewModel = Get.find<AuthViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: ColorUtils.green,
        title: const ProductText(
          'Login',
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  CommonTextField(
                    titleText: "Phone No.",
                    regularExpression: RegularExpression.digitsPattern,
                    inputLength: 10,
                    validationType: ValidationType.PNumber,
                    onChange: (value) {
                      reqModel.phoneNumber = value;
                    },
                  ),
                  CommonTextField(
                    titleText: "Password",
                    regularExpression: RegularExpression.passwordPattern,
                    validationType: ValidationType.Password,
                    obscureValue: true,
                    onChange: (value) {
                      reqModel.password = value;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomBtn(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          authViewModel.checkUserExist(reqModel);
                          Get.offAll(() => BottomBar());
                        }
                      },
                      title: 'Login'),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
