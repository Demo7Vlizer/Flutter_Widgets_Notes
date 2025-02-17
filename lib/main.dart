import 'package:flutter/material.dart';
import 'package:flutter_widgets/controllers/example_controller.dart';
import 'package:get/get.dart';
import 'screens/home/home_screen.dart';
import 'screens/basic_widgets/basic_widgets_screen.dart';
import 'screens/basic_widgets/text/basic_text_screen.dart';
import 'screens/basic_widgets/text/rich_text_screen.dart';
import 'screens/layout_widgets/layout_widgets_screen.dart';
import 'screens/input_widgets/input_widgets_screen.dart';
import 'screens/widget_details_screen.dart';
import 'screens/widget_docs_screen.dart';
import 'bindings/app_binding.dart';
import 'package:flutter_widgets/controllers/widget_controller.dart';
import 'screens/basic_widgets/text/selectable_text_screen.dart';
import 'screens/basic_widgets/buttons/button_widgets_screen.dart';
import 'screens/basic_widgets/buttons/elevated_button_screen.dart';
import 'screens/basic_widgets/buttons/text_button_screen.dart';
import 'screens/basic_widgets/buttons/outlined_button_screen.dart';
import 'screens/basic_widgets/buttons/icon_button_screen.dart';
import 'screens/basic_widgets/media/icon_image_screen.dart';
import 'screens/basic_widgets/media/icon_screen.dart';
import 'screens/basic_widgets/media/image_screen.dart';
import 'screens/basic_widgets/media/circle_avatar_screen.dart';
import 'screens/basic_widgets/layout/container_screen.dart';
import 'screens/basic_widgets/layout/row_column_screen.dart';
import 'screens/basic_widgets/layout/stack_screen.dart';
import 'screens/basic_widgets/input/textfield_screen.dart';
import 'screens/basic_widgets/input/checkbox_screen.dart';
import 'screens/basic_widgets/input/radio_screen.dart';
import 'screens/basic_widgets/input/switch_screen.dart';
import 'screens/basic_widgets/container/card_screen.dart';
import 'screens/basic_widgets/container/listtile_screen.dart';
import 'screens/basic_widgets/container/expanded_screen.dart';
import 'screens/basic_widgets/layout/wrap_screen.dart';
import 'screens/basic_widgets/layout/animated_container_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  print('Starting app...');
  print('Registered routes:');
  print(Get.routeTree);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Widgets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: AppBinding(),
      home: const HomeScreen(),
      getPages: [
        GetPage(
          name: '/basic',
          page: () => const BasicWidgetsScreen(),
          binding: BindingsBuilder(() {
            Get.put(ExampleController());
          }),
        ),
        GetPage(name: '/layout', page: () => const LayoutWidgetsScreen()),
        GetPage(name: '/input', page: () => const InputWidgetsScreen()),
        GetPage(
          name: '/basic/text/basic',
          page: () => const BasicTextScreen(),
          preventDuplicates: true,
        ),
        GetPage(
          name: '/basic/text/rich',
          page: () => const RichTextScreen(),
          preventDuplicates: true,
        ),
        GetPage(
          name: '/basic/text/selectable',
          page: () => const SelectableTextScreen(),
          preventDuplicates: true,
        ),
        GetPage(
          name: '/widget-details',
          page: () => const WidgetDetailsScreen(),
          preventDuplicates: true,
        ),
        GetPage(
          name: '/widget-docs',
          page: () => const WidgetDocsScreen(),
          preventDuplicates: true,
        ),
        GetPage(
          name: '/basic/buttons',
          page: () => const ButtonWidgetsScreen(),
          preventDuplicates: true,
        ),
        GetPage(
          name: '/basic/buttons/elevated',
          page: () => const ElevatedButtonScreen(),
          preventDuplicates: true,
        ),
        GetPage(
          name: '/basic/buttons/text',
          page: () => const TextButtonScreen(),
          preventDuplicates: true,
        ),
        GetPage(
          name: '/basic/buttons/outlined',
          page: () => const OutlinedButtonScreen(),
          preventDuplicates: true,
        ),
        GetPage(
          name: '/basic/buttons/icon',
          page: () => const IconButtonScreen(),
          preventDuplicates: true,
        ),
        GetPage(
          name: '/basic/media',
          page: () => const IconImageScreen(),
          preventDuplicates: true,
        ),
        GetPage(
          name: '/basic/media/icon',
          page: () => const IconScreen(),
          preventDuplicates: true,
        ),
        GetPage(
          name: '/basic/media/image',
          page: () => const ImageScreen(),
          preventDuplicates: true,
        ),
        GetPage(
          name: '/basic/media/circle-avatar',
          page: () => const CircleAvatarScreen(),
          preventDuplicates: true,
        ),
        GetPage(
          name: '/basic/layout/container',
          page: () => const ContainerScreen(),
          preventDuplicates: true,
        ),
        GetPage(
          name: '/basic/layout/row-column',
          page: () => const RowColumnScreen(),
          preventDuplicates: true,
        ),
        GetPage(
          name: '/basic/layout/stack',
          page: () => const StackScreen(),
          preventDuplicates: true,
        ),
        GetPage(
          name: '/basic/input/textfield',
          page: () => const TextFieldScreen(),
          preventDuplicates: true,
        ),
        GetPage(
          name: '/basic/input/checkbox',
          page: () => const CheckboxScreen(),
          preventDuplicates: true,
        ),
        GetPage(
          name: '/basic/input/radio',
          page: () => const RadioScreen(),
          preventDuplicates: true,
        ),
        GetPage(
          name: '/basic/input/switch',
          page: () => const SwitchScreen(),
          preventDuplicates: true,
        ),
        GetPage(
          name: '/basic/container/card',
          page: () => const CardScreen(),
          preventDuplicates: true,
        ),
        GetPage(
          name: '/basic/container/listtile',
          page: () => const ListTileScreen(),
          preventDuplicates: true,
        ),
        GetPage(
          name: '/basic/container/expanded',
          page: () => const ExpandedScreen(),
          preventDuplicates: true,
        ),
        GetPage(
          name: '/basic/layout/wrap',
          page: () => const WrapScreen(),
          preventDuplicates: true,
        ),
        GetPage(
          name: '/basic/layout/animated-container',
          page: () => const AnimatedContainerScreen(),
          preventDuplicates: true,
        ),
      ],
    );
  }
}
