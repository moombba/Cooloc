import 'package:afgf_front/models/event/event.dart';
import 'package:afgf_front/widgets/notification_elem.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class NotificationPage extends HookConsumerWidget {
  NotificationPage({super.key});

  Event event = Event(
    id: 1,
    title: "Test",
    description: "Test",
    date: DateTime.now(),
  );

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feed"),
      ),
      body:  Column(
        children: [
          Expanded(
            child: ListView.builder(itemCount: 1, itemBuilder: (context, index) {
              return NotificationElem(event: Event(
              id: index,
              title: "Test",
              description: "Test",
              date: DateTime.now()));
            }),
          ),
        ],
    ));
  }

}