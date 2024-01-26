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
    "https://102a-2001-861-205-23a0-8cfa-2b56-985a-621c.ngrok-free.app";

class GetAction implements NetworkAction {
  @override
  Future<List<Task>> doStuf(http.Client client, [Task? newTask]) async {
    try {
      var res = await client.get(Uri.parse('$urlBuilder/tasks'));

      var body = jsonDecode(res.body);
      print(body);
      List<Task> tasks = body.map<Task>((e) => Task.fromJson(e)).toList();
      return tasks;
    } on Exception catch (e) {
      log("an http error occured ${e.toString()}");
      rethrow;
    }
  }
}

// fonction qui appelle les NetworkAction et fait la gestion d'erreur et autres gestion

class PostAction implements NetworkAction {
  @override
  Future<void> doStuf(http.Client client, [Task? newTask]) async {
    Map<String, String> body = newTask!.toJ() ;
    print("body => $body");
    var res = await client.post(Uri.parse('$urlBuilder/tasks'), body: jsonEncode(
      newTask.toJson()
      ));

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

class DeleteTaskAction implements NetworkAction {
  @override
  doStuf(http.Client client, [Task? task]) async {
    var res = await  client.delete(Uri.parse('$urlBuilder/tasks/${task!.name}'));
        var resBody =  jsonDecode(res.body);
    print(resBody);
    return resBody;
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
