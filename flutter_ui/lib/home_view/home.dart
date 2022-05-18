part of home_view;

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          image(),
          iconsHome(),
          serachButton(),
        ],
      ),
    );
  }

  Widget image() {
    return Container(
      width: double.infinity,
      height: Get.height * 0.3348,
      color: Colors.red,
      child: Image.asset(
        'assets/images/image_home.png',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget iconsHome() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.yellow,
      margin: EdgeInsets.only(
        bottom: 5.0,
        left: 0.0,
        right: 0.0,
        top: Get.height * 0.3348,
      ),
      padding: const EdgeInsets.only(
        top: 30.0,
        left: 10.0,
        right: 10.0,
      ),
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const IconsHome(),
            carouselSlider(),
          ],
        ),
      ),
    );
  }

  Widget serachButton() {
    return InkWell(
      onTap: () => Get.toNamed(Routes.business),
      child: Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          border: Border.all(
            color: const Color.fromRGBO(239, 239, 239, 1.0),
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        margin: EdgeInsets.only(
          bottom: 5.0,
          left: 20.0,
          right: 20.0,
          top: Get.height * 0.3069,
        ),
        child: Row(
          children: const [
            SizedBox(width: 10.0),
            Icon(Icons.search),
            SizedBox(width: 10.0),
            Text("Categorias"),
          ],
        ),
      ),
    );
  }

  Widget carouselSlider() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: Get.width,
      height: 190.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(
              'assets/images/image_home.png',
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: 3,
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        duration: 500,
        autoplayDelay: 3000,
        pagination: const SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: SwiperPagination.dots,
        ),
        onTap: (int i) {
          print("oprimio $i");
        },
      ),
      //color: Colors.red,
    );
  }
}
