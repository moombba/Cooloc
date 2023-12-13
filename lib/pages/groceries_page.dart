import 'package:afgf_front/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GroceriesPage extends HookConsumerWidget {
  const GroceriesPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // var list = ref.watch();

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 8 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.height * 0.02,
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
}}