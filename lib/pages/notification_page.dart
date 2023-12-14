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
      body:  SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
  child: ListView.builder(
    itemCount: 4,
    itemBuilder: (context, index) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.3, // 50% of screen height
        width: MediaQuery.of(context).size.width * 0.4, // 100% of screen width
        child: NotificationElem(
          event: Event(
            id: index,
            title: "Oui",
            description: "Test",
            date: DateTime.now(),
          ),
        ),
      );
    },
  ),
),
          ],
          ),
      ));
  }

}