import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class NotificationPage extends HookConsumerWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feed"),
      ),
      body:  Column(
        children: [
          ListView.builder(itemBuilder: (context, index) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.height * 0.02,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.4),
                borderRadius: BorderRadius.circular(15.0),
              ),
            );
          }),
        ],
    ));
  }

}