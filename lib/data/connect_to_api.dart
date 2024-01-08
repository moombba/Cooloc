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
  doStuf(http.Client client ) async {

    var otherClient = http.Client();
    var res = await otherClient.get(Uri.parse('https://e7aa-2a01-e0a-984-b0a0-54fe-5bb5-b047-970b.ngrok-free.app/tasks'));

    var body = jsonDecode(res.body);
    if (body.length > 0) {
      List<Task> tasks = body.map((e) => Task.fromJson(e)).toList();
      return tasks;
    }

    throw Exception("Error getting tasks");
}

}
class PostAction implements NetworkAction {
  @override
  doStuf(http.Client client ) {
    throw UnimplementedError();
  }
}
class PutAction implements NetworkAction {
  @override
  doStuf(http.Client client ) {
    throw UnimplementedError();
  }
}
class DeleteAction implements NetworkAction {
  @override
  doStuf(http.Client client ) {
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

  doStuff() {
    try {
      _action.doStuf(client);
      
    } catch (e) {
      log("an http error occured");
    }
  }

}