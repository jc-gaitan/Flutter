import 'package:flutter/material.dart';
import 'package:fractivity/controller/learn_controller.dart';
import 'package:fractivity/utils/assets_constant.dart';
import 'package:fractivity/utils/constants.dart';
import 'package:get/get.dart';

class LearnScreen extends StatelessWidget {
  LearnScreen({super.key});

  final _controller = Get.put(LearnController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: const Color.fromRGBO(252, 252, 255, 1.0),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: AppBar(
            centerTitle: true,
            elevation: 2.0,
            title: const Text(
              "APRENDER", //_controller.activity,
              style: titleStyle,
            ),
            actions: [
              _controller.act.length > 1
                  ? IconButton(
                      onPressed: () =>
                          _controller.nextActivity(_controller.act.length),
                      //mini: true,
                      icon: const Icon(Icons.arrow_forward_ios_rounded),
                      splashRadius: 16.0,
                    )
                  : Container(),
            ],
          ),
        ),
        body: Row(
          children: [
            Container(
              width: Get.width * 0.2902,
              height: Get.height,
              //color: Colors.blue,
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
              ),
              child: options(),
            ),
            Container(
              width: Get.width - Get.width * 0.2902,
              height: Get.height,
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              alignment: Alignment.centerLeft,
              child: Image.asset(
                _controller.activity.value,
              ),
            ),
          ],
        ),
        floatingActionButton:
            _controller.act[_controller.posAct.value].length > 1
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                        onPressed: () => _controller.backExp(
                            _controller.act[_controller.posAct.value].length),
                        mini: true,
                        child: const Icon(Icons.arrow_back_ios_rounded),
                      ),
                      const SizedBox(width: 10.0),
                      FloatingActionButton(
                        onPressed: () => _controller.nextExp(
                            _controller.act[_controller.posAct.value].length),
                        mini: true,
                        child: const Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ],
                  )
                : Container(),
      ),
    );
  }

  ListView options() {
    return ListView(
      children: [
        //const SizedBox(height: 10.0),
        optionTile(
          "Simples",
          0,
          BoxFit.fitHeight,
          ActConstant.simples,
        ),
        optionTile(
          "Suma",
          1,
          BoxFit.cover,
          ActConstant.suma,
        ),
        optionTile(
          "Resta",
          2,
          BoxFit.cover,
          ActConstant.resta,
        ),
        optionTile(
          "Multiplicacíon",
          3,
          BoxFit.cover,
          ActConstant.multiplicacion,
        ),
        optionTile(
          "División",
          4,
          BoxFit.cover,
          ActConstant.division,
        ),
      ],
    );
  }

  ListTile optionTile(
      String txt, int pos, BoxFit fit, List<List<String>> activity) {
    return ListTile(
      tileColor: (pos == _controller.posMenu.value)
          ? Colors.blue
          : const Color.fromRGBO(252, 252, 255, 1.0),
      title: Text(
        txt,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: Get.width * 0.0223,
          letterSpacing: 2.0,
        ),
      ),
      leading: Container(
        margin: const EdgeInsets.only(right: 8.0),
        width: Get.width * 0.0446,
        height: Get.width * 0.0446,
        child: Image.asset(
          ImagesConstant.options[pos],
          fit: fit,
        ),
      ),
      onTap: () => _controller.changeActivity(activity, txt, pos),
      contentPadding: EdgeInsets.all(Get.height * 0.0314),
    );
  }
}
