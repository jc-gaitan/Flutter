import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fractivity/controller/challenge_controller.dart';
import 'package:fractivity/utils/assets_constant.dart';
import 'package:fractivity/widget/appbar_widget.dart';
import 'package:get/get.dart';

class ChallengeScreen extends StatelessWidget {
  ChallengeScreen({super.key});

  final _controller = Get.put(ChallengeController());

  final TextStyle style = TextStyle(
    fontSize: Get.width * 0.0223,
  );

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: appBar("PRACTICAR"),
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
              child: act(_controller.gen.value),
            ),
          ],
        ),
      ),
    );
  }

  Widget act(bool gen) {
    switch (_controller.posMenu.value) {
      case 0:
        return simples(_controller.gen.value);
      case 1:
        return suma(_controller.gen.value);
      case 2:
        return resta(_controller.gen.value);
      case 3:
        return multi(_controller.gen.value);
      case 4:
        return div(_controller.gen.value);
      default:
        return Container();
    }
  }

  Widget div(bool x) {
    var rng = Random();
    int num = rng.nextInt(10) + 1;
    int dem = rng.nextInt(10) + 2;

    int num2 = rng.nextInt(10) + 1;
    int dem2 = rng.nextInt(10) + 2;

    int ubiRes = rng.nextInt(4);

    int resnum = num * dem2;
    int resdem = dem * num2;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        space(),
        Text(
          "¿Cuál es el resultado de la división de las fracciones?",
          style: style,
        ),
        space(),
        operation(num, dem, num2, dem2, "÷"),
        space(),
        SizedBox(
          width: double.infinity,
          height: Get.height * 0.5749,
          child: GridView.count(
            shrinkWrap: true,
            primary: true,
            crossAxisCount: 2,
            childAspectRatio: 4.0,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              (ubiRes == 0)
                  ? buttonTwo(resnum, resdem, true)
                  : buttonTwo(rng.nextInt(10) + 2, rng.nextInt(10) + 2, false),
              (ubiRes == 1)
                  ? buttonTwo(resnum, resdem, true)
                  : buttonTwo(rng.nextInt(20) + 2, rng.nextInt(20) + 2, false),
              (ubiRes == 2)
                  ? buttonTwo(resnum, resdem, true)
                  : buttonTwo(rng.nextInt(20) + 2, rng.nextInt(20) + 2, false),
              (ubiRes == 3)
                  ? buttonTwo(resnum, resdem, true)
                  : buttonTwo(rng.nextInt(20) + 2, rng.nextInt(20) + 2, false),
            ],
          ),
        ),
      ],
    );
  }

  Widget multi(bool x) {
    var rng = Random();
    int num = rng.nextInt(10) + 1;
    int dem = rng.nextInt(10) + 2;

    int num2 = rng.nextInt(10) + 1;
    int dem2 = rng.nextInt(10) + 2;

    int ubiRes = rng.nextInt(4);

    int resnum = num * num2;
    int resdem = dem * dem2;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        space(),
        Text(
          "¿Cuál es el resultado de la multiplicación de las fracciones?",
          style: style,
        ),
        space(),
        operation(num, dem, num2, dem2, "x"),
        space(),
        SizedBox(
          width: double.infinity,
          height: Get.height * 0.5749,
          child: GridView.count(
            shrinkWrap: true,
            primary: true,
            crossAxisCount: 2,
            childAspectRatio: 4.0,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              (ubiRes == 0)
                  ? buttonTwo(resnum, resdem, true)
                  : buttonTwo(rng.nextInt(10) + 2, rng.nextInt(10) + 2, false),
              (ubiRes == 1)
                  ? buttonTwo(resnum, resdem, true)
                  : buttonTwo(rng.nextInt(20) + 2, rng.nextInt(20) + 2, false),
              (ubiRes == 2)
                  ? buttonTwo(resnum, resdem, true)
                  : buttonTwo(rng.nextInt(20) + 2, rng.nextInt(20) + 2, false),
              (ubiRes == 3)
                  ? buttonTwo(resnum, resdem, true)
                  : buttonTwo(rng.nextInt(20) + 2, rng.nextInt(20) + 2, false),
            ],
          ),
        ),
      ],
    );
  }

  Widget resta(bool x) {
    var rng = Random();
    int num = rng.nextInt(10) + 1;
    int dem = rng.nextInt(10) + 2;

    int num2 = rng.nextInt(10) + 1;
    int dem2 = rng.nextInt(10) + 2;

    int ubiRes = rng.nextInt(4);

    int resnum = 0;
    int resdem = 0;

    if (num == num2) {
      num2 = rng.nextInt(10) + 1;
    }

    if (!x) {
      dem2 = dem;
    }

    if (dem != dem2) {
      resnum = num * dem2 - num2 * dem;
      resdem = dem * dem2;
    } else {
      resnum = num - num2;
      resdem = dem;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        space(),
        Text(
          "¿Cuál es el resultado de la resta de las fracciones?",
          style: style,
        ),
        space(),
        operation(num, dem, num2, dem2, "-"),
        space(),
        SizedBox(
          width: double.infinity,
          height: Get.height * 0.5749,
          child: GridView.count(
            shrinkWrap: true,
            primary: true,
            crossAxisCount: 2,
            childAspectRatio: 4.0,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              (ubiRes == 0)
                  ? buttonTwo(resnum, resdem, true)
                  : buttonTwo(rng.nextInt(10) + 2, rng.nextInt(10) + 2, false),
              (ubiRes == 1)
                  ? buttonTwo(resnum, resdem, true)
                  : buttonTwo(rng.nextInt(20) + 2, rng.nextInt(20) + 2, false),
              (ubiRes == 2)
                  ? buttonTwo(resnum, resdem, true)
                  : buttonTwo(rng.nextInt(20) + 2, rng.nextInt(20) + 2, false),
              (ubiRes == 3)
                  ? buttonTwo(resnum, resdem, true)
                  : buttonTwo(rng.nextInt(20) + 2, rng.nextInt(20) + 2, false),
            ],
          ),
        ),
      ],
    );
  }

  Widget suma(bool x) {
    var rng = Random();
    int num = rng.nextInt(10) + 1;
    int dem = rng.nextInt(10) + 2;

    int num2 = rng.nextInt(10) + 1;
    int dem2 = rng.nextInt(10) + 2;

    int ubiRes = rng.nextInt(4);

    int resnum = 0;
    int resdem = 0;

    if (!x) {
      dem2 = dem;
    }

    if (dem != dem2) {
      resnum = num * dem2 + num2 * dem;
      resdem = dem * dem2;
    } else {
      resnum = num + num2;
      resdem = dem;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        space(),
        Text(
          "¿Cuál es el resultado de la suma de las fracciones?",
          style: style,
        ),
        space(),
        operation(num, dem, num2, dem2, "+"),
        space(),
        SizedBox(
          width: double.infinity,
          height: Get.height * 0.5749,
          child: GridView.count(
            shrinkWrap: true,
            primary: true,
            crossAxisCount: 2,
            childAspectRatio: 4.0,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              (ubiRes == 0)
                  ? buttonTwo(resnum, resdem, true)
                  : buttonTwo(rng.nextInt(10) + 2, rng.nextInt(10) + 2, false),
              (ubiRes == 1)
                  ? buttonTwo(resnum, resdem, true)
                  : buttonTwo(rng.nextInt(20) + 2, rng.nextInt(20) + 2, false),
              (ubiRes == 2)
                  ? buttonTwo(resnum, resdem, true)
                  : buttonTwo(rng.nextInt(20) + 2, rng.nextInt(20) + 2, false),
              (ubiRes == 3)
                  ? buttonTwo(resnum, resdem, true)
                  : buttonTwo(rng.nextInt(20) + 2, rng.nextInt(20) + 2, false),
            ],
          ),
        ),
      ],
    );
  }

  InkWell buttonTwo(int num, int dem, bool c) {
    return InkWell(
      onTap: () => (c) ? _controller.correct() : _controller.incorrect(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1395),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: fraction(num, dem),
      ),
    );
  }

  Row operation(int num, int dem, int num2, int dem2, String simb) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        fraction(num, dem),
        const SizedBox(width: 10.0),
        Text(
          simb,
          style: TextStyle(
            fontSize: Get.width * 0.0268,
            fontWeight: FontWeight.bold,
          ),
        ),
        spaceW(),
        fraction(num2, dem2),
        spaceW(),
        /*const Text(
          "=",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),*/
      ],
    );
  }

  SizedBox spaceW() => const SizedBox(width: 10.0);

  Widget fraction(int num, int dem) {
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black),
              ),
            ),
            child: Text(
              "$num",
              style: style.copyWith(
                color: Colors.blue,
                fontSize: Get.width * 0.0335,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.black),
              ),
            ),
            child: Text(
              "$dem",
              style: style.copyWith(
                color: Colors.red,
                fontSize: Get.width * 0.0335,
              ),
            ),
          )
        ],
      ),
    );
  }

  Column simples(bool x) {
    var rng = Random();
    int num = 0;
    int dem = 0;
    if (x) {
      num = rng.nextInt(100) + 2;
      //num = 2 * num;
      dem = rng.nextInt(100) + 2;
    } else {
      num = rng.nextInt(100) + 2;
      //num = 2 * num + 1;
      dem = rng.nextInt(100) + 2;
    }
    //debugPrint("${rng.nextInt(900) + 2}");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          "¿Cuáles son las partes de la siguiente fracción?",
          style: style,
        ),
        space(),
        fraction(num, dem),
        space(),
        (num % 2 == 0)
            ? button("El numerador es $num y el denominador es $dem", true)
            : button("El numerador es $dem y el denominador es $num", false),
        space(),
        (num % 2 == 0)
            ? button("El numerador es $dem y el denominador es $num", false)
            : button("El numerador es $num y el denominador es $dem", true),
      ],
    );
  }

  SizedBox space() => const SizedBox(height: 10.0);

  ElevatedButton button(String text, bool c) {
    return ElevatedButton(
      onPressed: () => (c) ? _controller.correct() : _controller.incorrect(),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        shape: const StadiumBorder(),
      ),
      child: Text(
        text,
        style: TextStyle(
            fontSize: Get.width * 0.0179, fontWeight: FontWeight.bold),
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

  ListTile optionTile(String txt, int pos, BoxFit fit, List<String> activity) {
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
      onTap: () => _controller.changeActivity(pos),
      contentPadding: EdgeInsets.all(Get.height * 0.0314),
    );
  }
}
