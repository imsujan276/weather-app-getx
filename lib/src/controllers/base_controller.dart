import 'package:get/get.dart';

enum ViewState { idle, busy, retrived, eror }

class BaseController extends GetxController {
  final _state = ViewState.idle.obs;

  ViewState get state => _state.value;

  void setViewState(ViewState viewState) => _state.value = viewState;

  @override
  void onInit() {
    baseInit();
    super.onInit();
  }

  Future<void> baseInit() async {}
}
