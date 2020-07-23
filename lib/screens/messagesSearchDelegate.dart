import 'package:JMail/models/message_model.dart';
import 'package:JMail/providers/messages_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessagesSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Text('messages search query: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    MessagesProvider messagesProvider = Provider.of<MessagesProvider>(context);
    List<Message> filteredMessages = messagesProvider.searchMessages(query);

    return filteredMessages == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.separated(
            itemCount: filteredMessages != null ? filteredMessages.length : 0,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text('$index'),
                ),
                title: Text(filteredMessages[index].subject),
                subtitle: Text(filteredMessages[index].body),
                trailing: Text('2.35PM'),
              );
            });
  }
}
