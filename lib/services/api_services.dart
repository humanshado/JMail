import 'package:JMail/models/message_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final String url = 'https://run.mocky.io/v3/eb0ba626-b131-440d-99ff-9891d9be00bf';

Future<List<Message>> fetchMessages() async {
  http.Response response = await http.get(url);
  List data = json.decode(response.body);
  List<Message> messages = data.map((json) => Message.fromJson(json)).toList();
  return messages;
}
