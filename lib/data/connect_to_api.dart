// ignore_for_file: avoid_print

import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

import 'package:cooloc/models/task/task.dart';
import 'package:http/http.dart' as http;

abstract class NetworkAction {
  NetworkAction();
  Future<dynamic> doStuf(http.Client client, [Task? newTask]);
}

String urlBuilder =
    "https://708c-176-144-18-100.ngrok-free.app";

class GetAction implements NetworkAction {
  @override
  Future<List<Task>> doStuf(http.Client client, [Task? newTask]) async {
    try {
      var res = await client.get(Uri.parse('$urlBuilder/tasks'));

      var body = jsonDecode(res.body);
      print(body);
      var tasks = body.map<Task>((e) => Task.fromJson(e)).toList();
      return tasks as List<Task>;
    } on Exception catch (e) {
      log("an http error occured ${e.toString()}");
      rethrow;
    }
  }
}

class PostAction implements NetworkAction {
  @override
  Future<void> doStuf(http.Client client, [Task? newTask]) async {
    Map<String, String> body = newTask!.toJ() ;
    print("body => $body");
    var res = await client.post(Uri.parse('$urlBuilder/tasks'), body: jsonEncode({
        "name": "popo",
        "weight": 1,
        "isDone": false
      }));

    var resBody = jsonDecode(res.body);
    print(resBody);
  }
}

class PutAction implements NetworkAction {
  @override
  doStuf(http.Client client, [Task? newTask]) {
    throw UnimplementedError();
  }
}

class DeleteAction implements NetworkAction {
  @override
  doStuf(http.Client client, [Task? newTask]) {
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
