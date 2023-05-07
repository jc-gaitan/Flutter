import 'package:flutter/material.dart';
//import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fractivity/config/routes/app_pages.dart';
import 'package:fractivity/controller/home_controller.dart';
import 'package:fractivity/utils/assets_constant.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Container(
            width: Get.width,
            height: Get.height,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250.0,
                  height: 250.0,
                  child: Image.asset(ImagesConstant.logo),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    button('Aprender ', Routes.learn),
                    const SizedBox(height: 10.0),
                    button('Practicar ', Routes.challenge),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      /*floatingActionButton: Obx(
        () => SpeedDial(
          icon: Icons.settings,
          activeIcon: Icons.close,
          spacing: 3,
          //mini: true,
          openCloseDial: _controller.isDialOpen,
          onPress: () =>
              _controller.isDialOpen.value = !_controller.isDialOpen.value,
          //
          childPadding: const EdgeInsets.all(5),
          spaceBetweenChildren: 4,
          children: [
            SpeedDialChild(
              child: _controller.audio.value
                  ? const Icon(Icons.volume_up)
                  : const Icon(Icons.volume_off),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              onTap: () => _controller.mute(),
            ),
            SpeedDialChild(
                child: const Icon(Icons.thumb_up),
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                onTap:
                    () {} //=> _controller.launchInBrowser('www.facebook.com', ''),
                ),
          ],
        ),
      ),*/
    );
  }

  ElevatedButton button(String text, String route) {
    return ElevatedButton(
      onPressed: () => _controller.goToRoute(route),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 14.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
