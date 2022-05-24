part of home_view;

class NavigationBar extends StatelessWidget {
  NavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      id: 'NavigationBar',
      builder: (_) {
        return Container(
          margin: EdgeInsets.only(
            right: Get.width * .04,
            left: Get.width * .04,
            bottom: Get.width * .015,
            top: Get.width * .01,
          ),
          height: Get.width * .155,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(
                46, 46, 46, 1), // aca se cambia el color de tab
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
            borderRadius: BorderRadius.circular(50),
          ),
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: Get.width * .02),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                _.page = index;
                _.update(['Home']);
                HapticFeedback.lightImpact();
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == _.page ? Get.width * .32 : Get.width * .18,
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: index == _.page ? Get.width * .12 : 0,
                      width: index == _.page ? Get.width * .32 : 0,
                      decoration: BoxDecoration(
                        color: index == _.page
                            ? const Color.fromRGBO(13, 206, 225, 1)
                                .withOpacity(.2) // color fondo seleccionado
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == _.page ? Get.width * .31 : Get.width * .18,
                    //alignment: Alignment.center,
                    child: Stack(
                      children: [
                        //texto
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == _.page
                                  ? Get.width * (_.tam(_.page) + .09)
                                  : 0,
                            ),
                            AnimatedOpacity(
                              opacity: index == _.page ? 1 : 0,
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: Text(
                                index == _.page ? listOfStrings[index] : '',
                                style: const TextStyle(
                                  color: Color.fromRGBO(13, 206, 225,
                                      1), //cambiar color texto seleccionado
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11, //CAMBIAR TAMAÑO TEXTO
                                ),
                              ),
                            ),
                          ],
                        ),
                        //icon
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == _.page
                                  ? Get.width * _.tam(_.page)
                                  : 20,
                            ),
                            Icon(
                              listOfIcons[index],
                              size: Get.width * .076,
                              color: index == _.page
                                  ? const Color.fromRGBO(
                                      13, 206, 225, 1) // CAMBIAR COLOR TEXTO
                                  : Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  final List<IconData> listOfIcons = [
    Icons.analytics_outlined,
    Icons.inventory_2_outlined,
    Icons.shopping_cart_outlined,
    Icons.swap_vert_outlined,
  ];

  final List<String> listOfStrings = [
    'Home',
    'Inventario',
    'Pedidos',
    'Entrada', //entrada - salida
  ];
}
