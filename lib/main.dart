import 'package:JMail/providers/messages_provider.dart';
import 'package:JMail/screens/Home.dart';
import 'package:JMail/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => MessagesProvider(),
      child: MaterialApp(
        title: 'JMail',
        theme: ThemeData(
          primarySwatch: createMaterialColor(Color(0XFFeaf2ef)),
          accentColor: createMaterialColor(Color(0XFF011638)),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: Home(title: 'JMail'),
      ),
    );
  }
}
