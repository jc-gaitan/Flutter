part of home_view;

class MyActivity extends StatelessWidget {
  //
  late final UserModel user;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'MyActivity',
      builder: (_) {
        if (_.isLoading.value) {
          return Container(
            color: Color.fromRGBO(72, 83, 101, 1),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          user = _.user.value!;
          return SafeArea(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Color.fromRGBO(72, 83, 101, 1),
              child: Column(
                children: [
                  Text(user.name),
                  Text(user.phoneNumber),
                  Text(user.gender),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
