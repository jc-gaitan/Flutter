part of home_view;

class _Drawer extends StatelessWidget {
  const _Drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) {
        return Drawer(
          child: Column(
            children: [
              SizedBox(height: 25),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
                onTap: () => _.logout(),
              ),
            ],
          ),
        );
      },
    );
  }
}
