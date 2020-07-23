import 'package:JMail/models/message_model.dart';
import 'package:JMail/services/api_services.dart';
import 'package:flutter/material.dart';

class MessagesProvider extends ChangeNotifier {
  List<Message> _messages;

  MessagesProvider() {
    loadMessages();
  }

  List<Message> get messages => _messages;

  Future loadMessages() async {
    var _allMessages = await fetchMessages();
    _messages = _allMessages;
    notifyListeners();
  }

  Iterable<Message> searchMessages(query) {
    var _filtered = messages.where((msg) =>
        msg.subject.toLowerCase().contains(query.toLowerCase()) ||
        msg.body.toLowerCase().contains(query.toLowerCase()));
    return _filtered.toList();
  }

  deleteMessage(index) {
    _messages.removeAt(index);
    notifyListeners();
  }
}
