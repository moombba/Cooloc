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
    "https://ba88-2a02-8440-5240-d317-4031-1f8a-40e5-bd0.ngrok-free.app";

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

class PostAction implements NetworkAction {
  @override
  Future<void> doStuf(http.Client client, [Task? newTask]) async {
    Map<String, String> body = newTask!.toJ() ;
    print("body => $body");
    var res = await client.post(Uri.parse('$urlBuilder/tasks'), body: jsonEncode({
      newTask.toJson()
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
