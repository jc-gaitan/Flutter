part of home_view;

class IconsHome extends StatelessWidget {
  const IconsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 310.0,
      child: GridView.count(
        padding: const EdgeInsets.only(top: 5.0),
        crossAxisCount: 4,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 8.0,
        children: List.generate(
          choices.length,
          (index) {
            return Center(
              child: SelectCard(choice: choices[index]),
            );
          },
        ),
      ),
    );
  }
}

class Choice {
  const Choice({required this.title, required this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = <Choice>[
  Choice(title: 'Domicilios', icon: Icons.home),
  Choice(title: 'Taxi', icon: Icons.contacts),
  Choice(title: 'Vida social', icon: Icons.map),
  Choice(title: 'Tecnologia', icon: Icons.phone),
  Choice(title: 'Entretenimiento', icon: Icons.camera_alt),
  Choice(title: 'Eventos', icon: Icons.settings),
  Choice(title: 'Comida rapida', icon: Icons.photo_album),
  Choice(title: 'Vacaciones', icon: Icons.wifi),
  Choice(title: 'Tenderos', icon: Icons.wifi),
  Choice(title: 'Peluquerias', icon: Icons.wifi),
  Choice(title: 'Outfit', icon: Icons.wifi),
  Choice(title: 'Licores', icon: Icons.wifi),
];

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    // TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      //color: Colors.orange,
      child: InkWell(
        onTap: () {},
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(child: Icon(choice.icon, size: 40.0)),
              Text(
                choice.title,
                style: const TextStyle(
                  fontSize: 10.0,
                  overflow: TextOverflow.ellipsis,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5.0),
            ],
          ),
        ),
      ),
    );
  }
}
