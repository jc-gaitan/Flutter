part of home_view;

class _Profile extends StatelessWidget {
  const _Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) {
        return Container(
          child: _.isLoading.value
              ? Align(
                  alignment: Alignment.topCenter,
                  child: CircularProgressIndicator())
              : Card(
                  child: ListTile(
                    title: Text(_.user.value?.name ?? "-"),
                    subtitle: Text(_.user.value?.phoneNumber ?? "-"),
                  ),
                ),
        );
      },
    );
  }
}
