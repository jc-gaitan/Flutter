part of home_view;

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 226, 226, 226),
          appBar: AppBar(
            title: const Text("Home"),
          ),
        );
      },
    );
  }
}
