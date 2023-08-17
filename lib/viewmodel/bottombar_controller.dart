import 'package:get/get.dart';

class BottomBarController extends GetxController {
  RxInt selectedIndex = RxInt(0);

  pageChange(int index) {
    selectedIndex.value = index;
    update();
  }

  @override
  void dispose() {
    super.dispose();
    pageChange(0);
  }
}
