import 'package:JMail/screens/More.dart';
import 'package:JMail/screens/calendar.dart';
import 'package:JMail/screens/contacts.dart';
import 'package:JMail/screens/contactsSearchDelegate.dart';
import 'package:JMail/screens/inbox.dart';
import 'package:JMail/screens/messagesSearchDelegate.dart';
import 'package:JMail/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentScreenIndex = 0;

  static final List<Widget> _screens = [
    Inbox(),
    Contacts(),
    Calendar(),
    More(),
  ];

  @override
  Widget build(BuildContext context) {
    var oxfordBlue = createMaterialColor(Color(0XFF011638));
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "search",
                style: TextStyle(
                  fontSize: 15,
                  color: oxfordBlue,
                ),
              ),
              IconButton(
                color: oxfordBlue,
                iconSize: 30,
                icon: Icon(Icons.search),
                onPressed: () {
                  switch (_currentScreenIndex) {
                    case 0:
                      showSearch(
                          context: context, delegate: MessagesSearchDelegate());
                      break;
                    case 1:
                      showSearch(
                          context: context, delegate: ContactsSearchDelegate());
                      break;
                    default:
                      return;
                  }
                },
              ),
            ],
          ),
        ],
      ),
      drawer: _buildDrawer(),
      body: _screens[_currentScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox, color: Colors.grey[400]),
            title: Text('Inbox'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.userFriends,
              color: Colors.grey[400],
            ),
            title: Text('Contacts'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.calendarAlt, color: Colors.grey[400]),
            title: Text('Calendar'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_vert, color: Colors.grey[400]),
            title: Text('More'),
          ),
        ],
        selectedItemColor: oxfordBlue,
        onTap: (int index) {
          setState(() => _currentScreenIndex = index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: _currentScreenIndex == 1
            ? Icon(Icons.person_add)
            : Icon(Icons.edit),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text('john@example.com'),
            accountName: Text('John Doe'),
            currentAccountPicture: CircleAvatar(
              child: Icon(FontAwesomeIcons.userAlt),
            ),
            otherAccountsPictures: <Widget>[
              CircleAvatar(
                child: Icon(Icons.add),
              ),
            ],
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.inbox),
            title: Text('Inbox'),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.edit),
            title: Text('Draft'),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.paperPlane),
            title: Text('Sent'),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.archive),
            title: Text('Archive'),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.trash),
            title: Text('Trash'),
          ),
          Divider(),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                leading: Icon(FontAwesomeIcons.cog),
                title: Text('Settings'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
