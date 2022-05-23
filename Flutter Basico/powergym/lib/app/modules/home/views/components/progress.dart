part of home_view;

class MyProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) {
        return Container(
          color: Color.fromRGBO(72, 83, 101, 1),
          child: Center(
            child: Text('P = ${_.page}'),
          ),
        );
      },
    );
  }
}
