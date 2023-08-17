import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_app/utils/prefrance.dart';
import 'package:task_app/view/auth/login.dart';
import 'package:task_app/view/bottombar.dart';
import 'package:task_app/viewmodel/auth_viewmodel.dart';
import 'package:task_app/viewmodel/bottombar_controller.dart';
import 'package:task_app/viewmodel/product_viewmodel.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return GetMaterialApp(
          title: 'Task App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: PreferenceManagerUtils.getCurrentUser().isEmpty
              ? Login()
              : BottomBar(),
        );
      },
    );
  }

  BottomBarController bottomBarController = Get.put(BottomBarController());
  ProductViewModel productViewModel = Get.put(ProductViewModel());
  AuthViewModel authViewModel = Get.put(AuthViewModel());
}
