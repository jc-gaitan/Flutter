import 'package:flutter/material.dart';

import 'package:componentes_flutter/src/pages/alert_page.dart';
import 'package:componentes_flutter/src/pages/avatar_page.dart';
import 'package:componentes_flutter/src/pages/home_page.dart';
import 'package:componentes_flutter/src/pages/home_temp.dart';
import 'package:componentes_flutter/src/pages/card_page.dart';
import 'package:componentes_flutter/src/pages/animated_container.dart';
import 'package:componentes_flutter/src/pages/input_page.dart';
import 'package:componentes_flutter/src/pages/slider_page.dart';
import 'package:componentes_flutter/src/pages/listview_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'home': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    AvatarPage.pageName: (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'homeTemp': (BuildContext context) => HomePageTemp(),
    'animatedContainer': (BuildContext context) => AnimetedContainerPage(),
    'inputs': (BuildContext context) => InputPage(),
    'slider': (BuildContext context) => SliderPage(),
    'list': (BuildContext context) => ListaPage(),
  };
}
