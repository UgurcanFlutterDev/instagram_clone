import 'package:get/get.dart';

class SharedController extends GetxController {
  final RxInt _currentPageIndex = RxInt(0);
  int get currentPageIndex => _currentPageIndex.value;

  void changeCurrentPage(int index) {
    _currentPageIndex.value = index;
  }
}
