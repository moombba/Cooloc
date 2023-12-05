import 'package:afgf_front/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/person/person.dart';
import '../providers/profile_provider.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    Person user = ref.watch(userProfileProvider);
    return Scaffold(
      body:  Center(child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          const CircleAvatar(
            radius: 60,
            child: ClipOval(
            child: Image(image: AssetImage("assets/jazz_harring.jpeg"),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Text(user.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          Text(user.score.toString() , style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: primaryColor)),


        ])),
    );
  }
}