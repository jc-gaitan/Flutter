import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controllers/controller.dart';

class Home extends StatelessWidget {
  //
  Home({Key? key}) : super(key: key);

  final AnimalsController animalsController = Get.put(AnimalsController());

  final List<String> animals = [
    '🐸 Rana',
    '🦁 León',
    '🐶 Perro',
    '🐈 Gato',
    '🦛 Hipopótamo',
    '🐻 Oso',
    '🐼 Panda',
    '🐀 Ratón',
    '🦊 Zorro',
    '🐨 Koala',
    '🐷 Cerdito',
    '🐙 Pulpo',
    '🐬 Delfín'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<AnimalsController>(
        init: animalsController,
        builder: (AnimalsController animalsCtrl) {
          return ListView.builder(
            itemCount: animalsCtrl.list.length,
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(
                  animalsCtrl.list[index],
                  style: Theme.of(context).textTheme.headline6,
                ),
                trailing: IconButton(
                  onPressed: () => animalsCtrl.remove(index),
                  icon: const Icon(Icons.close),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(5.0),
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: Theme.of(context).primaryColor,
          ),
          child: const Text(
            'AÑADIR ANIMAL',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          onPressed: () {
            var rand = Random();
            animalsController.add(animals[rand.nextInt(animals.length)]);
          },
        ),
      ),
    );
  }
}
