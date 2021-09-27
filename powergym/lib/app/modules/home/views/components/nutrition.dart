part of home_view;

class Nutrition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) {
        return Container(
          color: Color.fromRGBO(72, 83, 101, 1),
          child: Center(
            child: Text('N = ${_.page}'),
          ),
        );
      },
    );
  }
}
