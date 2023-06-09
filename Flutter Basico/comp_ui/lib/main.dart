import 'package:autocomplete_dropdown/articlesFeed.dart';
import 'package:autocomplete_dropdown/drop.dart';
import 'package:autocomplete_dropdown/newsFeed.dart';
import 'package:autocomplete_dropdown/onboarding.dart';
import 'package:autocomplete_dropdown/onboardingtwo.dart';
import 'package:autocomplete_dropdown/profile.dart';
import 'package:autocomplete_dropdown/settingsOne.dart';
import 'package:autocomplete_dropdown/settingstwo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NewsFeedPage2(),
    );
  }
}
