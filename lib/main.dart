import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JMail',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(title: 'JMail'),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List messages = [
    {'subject': 'First Email', 'body': 'This is the email message for the receiver to read.'},
    {'subject': 'Second Email', 'body': 'This is the email message for the receiver to read.'},
    {'subject': 'Third Email', 'body': 'This is the email message for the receiver to read.'},
    {'subject': 'Fourth Email', 'body': 'This is the email message for the receiver to read.'},
    {'subject': 'Fifth Email', 'body': 'This is the email message for the receiver to read.'},
    {'subject': 'Sixth Email', 'body': 'This is the email message for the receiver to read.'},
    {'subject': 'Seventh Email', 'body': 'This is the email message for the receiver to read.'},
    {'subject': 'Eighth Email', 'body': 'This is the email message for the receiver to read.'},
    {'subject': 'Nineth Email', 'body': 'This is the email message for the receiver to read.'},
    {'subject': 'Tenth Email', 'body': 'This is the email message for the receiver to read.'},
    {'subject': 'Eleventh Email', 'body': 'This is the email message for the receiver to read.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemCount: messages.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            leading: CircleAvatar(child: Text('$index'),),
            title: Text(messages[index]['subject']),
            subtitle: Text(messages[index]['body']),
            trailing: Text('2.35PM'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'compose',
        child: Icon(Icons.edit),
      ),
    );
  }
}
