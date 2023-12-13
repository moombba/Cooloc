import 'package:afgf_front/models/event/event.dart';
import 'package:afgf_front/theme/colors.dart';
import 'package:flutter/material.dart';

class NotificationElem extends StatelessWidget {
   const NotificationElem({Key? key, required this.event}) : super(key: key);

    final Event event;

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(event.date.day.toString()),
            Container(
              color: secondaryColor,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(children: [
                  Text(event.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(event.description),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ElevatedButton(onPressed: (){}, child: const Text('Voir évenement')),
                  ),
                  Text(event.date.toString(), style: TextStyle(fontSize: 13),)
                ]),
              ),
            ),
          ],
        ),
      );
    }
  }
