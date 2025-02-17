import 'package:get/get.dart';
import '../controllers/widget_controller.dart';
import '../controllers/example_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(WidgetController());
    Get.put(ExampleController());
  }
} 