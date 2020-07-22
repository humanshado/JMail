import 'package:JMail/models/message_model.dart';
import 'package:JMail/providers/messages_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class Inbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MessagesProvider messagesProvider = Provider.of<MessagesProvider>(context);
    List<Message> _messages = messagesProvider.messages;

    return _messages == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.separated(
            itemCount: _messages != null ? _messages.length : 0,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (BuildContext context, int index) {
              return Slidable(
                key: ObjectKey(_messages[index]),
                actionPane: SlidableDrawerActionPane(),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text('$index'),
                  ),
                  title: Text(_messages[index].subject),
                  subtitle: Text(_messages[index].body),
                  trailing: Text('2.35PM'),
                ),
                actions: <Widget>[
                  IconSlideAction(
                    caption: 'Archive',
                    color: Colors.blue,
                    icon: Icons.archive,
                    onTap: () => {},
                  ),
                  IconSlideAction(
                    caption: 'Share',
                    color: Colors.indigo,
                    icon: Icons.share,
                    onTap: () => {},
                  ),
                ],
                secondaryActions: <Widget>[
                  IconSlideAction(
                    caption: 'More',
                    color: Colors.black45,
                    icon: Icons.more_horiz,
                    onTap: () => {},
                  ),
                  IconSlideAction(
                    caption: 'Delete',
                    color: Colors.red,
                    icon: Icons.delete,
                    onTap: () => {},
                  ),
                ],
              );
            },
          );
  }
}
