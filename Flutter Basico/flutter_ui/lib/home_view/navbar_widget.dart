part of home_view;

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  //

  final padding = const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0);
  double gap = 10.0;

  //PageController controller = PageController();
  final HomeController controller = Get.put(HomeController());

  List<Color> colors = [
    Colors.purple,
    Colors.pink,
    Colors.amber[600]!,
    Colors.teal
  ];

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      init: controller,
      builder: (_) {
        return Container(
          margin: const EdgeInsets.only(
            top: 1.0,
            bottom: 5.0,
            left: 10.0,
            right: 10.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            boxShadow: [
              BoxShadow(
                spreadRadius: -10,
                blurRadius: 60,
                color: Colors.black.withOpacity(.4),
                offset: const Offset(0, 25),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3),
            child: GNav(
              tabs: [
                GButton(
                  gap: gap,
                  iconActiveColor: Colors.purple,
                  iconColor: Colors.black,
                  textColor: Colors.purple,
                  backgroundColor: Colors.purple.withOpacity(.2),
                  iconSize: 24,
                  padding: padding,
                  icon: Icons.home_rounded,
                  text: 'Home',
                ),
                GButton(
                  gap: gap,
                  iconActiveColor: Colors.pink,
                  iconColor: Colors.black,
                  textColor: Colors.pink,
                  backgroundColor: Colors.pink.withOpacity(.2),
                  iconSize: 24,
                  padding: padding,
                  icon: Icons.favorite_rounded,
                  text: "Favoritos",
                ),
                GButton(
                  gap: gap,
                  iconActiveColor: Colors.amber[600],
                  iconColor: Colors.black,
                  textColor: Colors.amber[600],
                  backgroundColor: Colors.amber[600]!.withOpacity(.2),
                  iconSize: 24,
                  padding: padding,
                  icon: Icons.notifications,
                  text: 'Notificación',
                ),
                GButton(
                  gap: gap,
                  iconActiveColor: Colors.teal,
                  iconColor: Colors.black,
                  textColor: Colors.teal,
                  backgroundColor: Colors.teal.withOpacity(.2),
                  iconSize: 24,
                  padding: padding,
                  icon: Icons.apps_outlined,
                  text: 'More',
                )
              ],
              selectedIndex: controller.selectedIndex.value,
              onTabChange: (index) {
                controller.selectedIndex.value = index;
                //controller.jumpToPage(index);
              },
            ),
          ),
        );
      },
    );
  }
}
