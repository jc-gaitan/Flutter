import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_ui/business_view/business_controller.dart';
import 'package:flutter_ui/config/routes/app_pages.dart';
import 'package:flutter_ui/widgets/leading_button.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

import '../calificaciones.dart';
import '../calificar.dart';

class BusinessView extends StatefulWidget {
  const BusinessView({Key? key}) : super(key: key);

  @override
  State<BusinessView> createState() => _BusinessViewState();
}

class _BusinessViewState extends State<BusinessView> {
  //
  BusinessController controller = Get.put(BusinessController());

  @override
  Widget build(BuildContext context) {
    return GetX<BusinessController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            leading: const LeadingButton(),
            title: const Text("NOMBRE NEGOCIO"),
          ),
          bottomNavigationBar: navBar(),
          body: body(),
        );
      },
    );
  }

  Widget navBar() {
    return Container(
      width: double.infinity,
      height: 50.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: const Color.fromRGBO(46, 46, 46, 1.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.ac_unit_rounded),
            iconSize: 35.0,
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.ac_unit_rounded),
            iconSize: 35.0,
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.ac_unit_rounded),
            iconSize: 35.0,
            color: Colors.white,
          ),
          IconButton(
            onPressed: () => Get.offAllNamed(Routes.home),
            icon: const Icon(Icons.home_rounded),
            iconSize: 35.0,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget body() {
    return Stack(
      children: [
        image(),
        content(),
        socialNetwork(),
      ],
    );
  }

  Widget image() {
    return Container(
      width: double.infinity,
      height: Get.height * 0.2567,
      decoration: const BoxDecoration(
        color: Colors.red,
        border: Border(
          bottom: BorderSide(
            color: Color.fromRGBO(46, 46, 46, 1.0),
            width: 1.2,
          ),
        ),
      ),
    );
  }

  Widget socialNetwork() {
    return Container(
      width: double.infinity,
      height: 50.0,
      margin: EdgeInsets.only(
        bottom: 5.0,
        left: 20.0,
        right: 20.0,
        top: Get.height * 0.2288,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
        border: Border.all(
          color: const Color.fromRGBO(46, 46, 46, 1.0),
          width: 1.2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Text("Síganos: "),
          Icon(
            Icons.ac_unit_rounded,
            size: 40.0,
          ),
          Icon(
            Icons.ac_unit_rounded,
            size: 40.0,
          ),
          Icon(
            Icons.ac_unit_rounded,
            size: 40.0,
          ),
          Icon(
            Icons.ac_unit_rounded,
            size: 40.0,
          ),
          Icon(
            Icons.ac_unit_rounded,
            size: 40.0,
          ),
        ],
      ),
    );
  }

  Widget content() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      //color: Colors.yellow,
      margin: EdgeInsets.only(
        bottom: 0.0,
        left: 0.0,
        right: 0.0,
        top: Get.height * 0.2567,
      ),
      padding: const EdgeInsets.only(
        top: 25.0,
        left: 0.0,
        right: 0.0,
        bottom: 2.0,
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 60.0,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color.fromRGBO(46, 46, 46, 0.6),
                  width: 1.2,
                ),
              ),
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(
                  Icons.ac_unit_rounded,
                  size: 40.0,
                ),
                Icon(
                  Icons.ac_unit_rounded,
                  size: 40.0,
                ),
                Icon(
                  Icons.ac_unit_rounded,
                  size: 40.0,
                ),
                Icon(
                  Icons.ac_unit_rounded,
                  size: 40.0,
                ),
                Icon(
                  Icons.ac_unit_rounded,
                  size: 40.0,
                ),
              ],
            ),
          ),
          feedback(),
        ],
      ),
      alignment: Alignment.center,
    );
  }

  Widget feedback() {
    return Expanded(
      child: Scrollbar(
        isAlwaysShown: true,
        showTrackOnHover: true,
        thickness: 6.0,
        radius: const Radius.circular(20),
        interactive: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text("Si no ha calificado negocio poner -----"),
                const ListTile(
                  title: Text(
                    "Califica este negocio",
                    style: TextStyle(
                      fontSize: 16.0,
                      //fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  subtitle: Text("Comparte tu opinión con otros usuarios"),
                  contentPadding: EdgeInsets.all(0.0),
                ),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  glow: false,
                  wrapAlignment: WrapAlignment.spaceBetween,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemSize: 30.0,
                  onRatingUpdate: (rating) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Calificar()));
                  },
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Si ya ha calificado negocio poner -----"),
                ),
                const ListTile(
                  title: Text(
                    "Tu opinión",
                    style: TextStyle(
                      fontSize: 16.0,
                      //fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  contentPadding: EdgeInsets.all(0.0),
                ),
                Row(
                  children: [
                    const CircleAvatar(),
                    const SizedBox(width: 20.0),
                    Flexible(
                      child: ListTile(
                        title: const Text("Nombre Usuario"),
                        subtitle: Row(
                          children: [
                            RatingBar.builder(
                              initialRating: 5,
                              minRating: 1,
                              direction: Axis.horizontal,
                              ignoreGestures: true,
                              itemCount: 5,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 1.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemSize: 20.0,
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            const SizedBox(width: 10.0),
                            const Text("04/04/20"),
                          ],
                        ),
                        contentPadding: const EdgeInsets.all(0.0),
                      ),
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                      ),
                      child: PopupMenuButton(
                        tooltip: "",
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        icon: const Icon(Icons.more_vert),
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            child: Text("Editar"),
                            value: 1,
                          ),
                          const PopupMenuItem(
                            child: Text("Eliminar"),
                            value: 2,
                          )
                        ],
                        iconSize: 25.0,
                        onSelected: (value) {
                          if (value == 1) {
                            print("Editar");
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Calificar()));
                          } else {
                            print("Eliminar");
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                InkWell(
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    controller.descTextShowFlag.value =
                        !controller.descTextShowFlag.value;
                  },
                  child: Text(
                    controller.descTextShowFlag.value
                        ? controller.descText
                        : "${controller.descText}...",
                    maxLines: controller.descTextShowFlag.value ? null : 3,
                    textAlign: TextAlign.start,
                    overflow: controller.descTextShowFlag.value
                        ? null
                        : TextOverflow.ellipsis,
                    //softWrap: true,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Calificaciones y opiniones",
                      style: TextStyle(
                        fontSize: 20.0,
                        //fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const Calificaciones())),
                      icon: const Icon(Icons.arrow_forward),
                      splashRadius: 20.0,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "4.4",
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Flexible(
                      child: ListTile(
                        title: RatingBar.builder(
                          initialRating: 4.4,
                          minRating: 1,
                          direction: Axis.horizontal,
                          ignoreGestures: true,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 1.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemSize: 20.0,
                          onRatingUpdate: (rating) {
                            //print(rating);
                          },
                        ),
                        subtitle: const Text(" 29.756.728"),
                        contentPadding: const EdgeInsets.all(0.0),
                      ),
                    ),
                  ],
                ),
                publications(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget publications() {
    return ExpansionTile(
      title: const Text("Publicaciones"),
      tilePadding: const EdgeInsets.all(0.0),
      initiallyExpanded: true,
      expandedAlignment: Alignment.topLeft,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Titulo",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(controller.descText),
              const SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Publicado el 08/05/2022 a las 20:59"),
                  likeButton(),
                ],
              ),
            ],
          ),
          decoration: const BoxDecoration(
            //color: Colors.red,
            border: Border(
              top: BorderSide(
                color: Color.fromRGBO(239, 239, 239, 1.0),
                width: 1.2,
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Titulo",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(controller.descText),
              const SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Publicado el 08/05/2022 a las 20:59"),
                  likeButton(),
                ],
              ),
            ],
          ),
          decoration: const BoxDecoration(
            //color: Colors.red,
            border: Border(
              top: BorderSide(
                color: Color.fromRGBO(239, 239, 239, 1.0),
                width: 1.2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget likeButton() {
    return const LikeButton(
      //onTap: (){},
      size: 25.0,
      likeCount: 0,
    );
  }
}
