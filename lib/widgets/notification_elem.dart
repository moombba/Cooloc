import 'package:cooloc/models/event/event.dart';
import 'package:cooloc/theme/colors.dart';
import 'package:flutter/material.dart';

class NotificationElem extends StatelessWidget {
  const NotificationElem({Key? key, required this.event}) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(event.date.day.toString()),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ), 
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          color: secondaryColor,
          child: Padding(
            padding:  EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(event.title,
                      style:
                          const TextStyle(fontWeight: FontWeight.bold)),
                  Text(event.description),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text('Voir évenement')),
                  Text(
                    event.date.toString(),
                    style: const TextStyle(fontSize: 13),
                  )
                ]),
          ),
        ),
      ],
    );
  }
}
