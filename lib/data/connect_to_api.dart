import 'dart:convert';
import 'dart:developer';

import 'package:cooloc/models/task/task.dart';
import 'package:http/http.dart' as http;

abstract class NetworkAction {
  NetworkAction();
  Future<dynamic> doStuf(http.Client client);
}

class GetAction implements NetworkAction {
  @override
  Future<List<Task>> doStuf(http.Client client) async {
    var otherClient = http.Client();
    try {
      var res = await otherClient.get(Uri.parse(
          'https://85d1-2a01-cb14-850-6700-60b6-207f-9f3-a464.ngrok-free.app/tasks'));

      var body = jsonDecode(res.body);
      print(body);
      var tasks = body.map<Task>((e) => Task.fromJson(e) ).toList(); 
      return tasks as List<Task>;
    } on Exception catch (e) {
      throw Exception("Error getting tasks $e");
    }
  }
}

class PostAction implements NetworkAction {
  @override
  doStuf(http.Client client) {
    throw UnimplementedError();
  }
}

class PutAction implements NetworkAction {
  @override
  doStuf(http.Client client) {
    throw UnimplementedError();
  }
}

class DeleteAction implements NetworkAction {
  @override
  doStuf(http.Client client) {
    throw UnimplementedError();
  }
}

class NetworkLayer {
  late NetworkAction _action;
  var client = http.Client();

  NetworkLayer();

  setAction(NetworkAction newAction) {
    _action = newAction;
  }

  Future<dynamic> doStuff() {
    try {
     return _action.doStuf(client);
    } catch (e) {
      log("an http error occured");
      throw Exception("An http error occured");
    }
  }
}
