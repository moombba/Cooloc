import 'package:afgf_front/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/person/person.dart';
import '../providers/profile_provider.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    Person user = ref.watch(userProfileProvider);
    return Scaffold(
      body:  Center(child: Stack(
        children: [
              Positioned(
                top: MediaQuery.of(context).size.height * 0.11,
                left: MediaQuery.of(context).size.width * 0.35,
                child: const CircleAvatar(
                  radius: 70,
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: ClipOval(
                    child: Image(image: AssetImage("assets/jazz_harring.jpeg"),
                      ),
                    ),
                  ),
                ),
              ),
          Column(
            children: [
              Container(height: MediaQuery.of(context).size.height * 0.2, color: primaryColor.withOpacity(0.2),),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Text(user.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
              Text(user.score.toString() , style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: primaryColor)),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025),
              Row(children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                const Text("Mes badges", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
              ]),


            ]),
        ],
      )),
    );
  }
}