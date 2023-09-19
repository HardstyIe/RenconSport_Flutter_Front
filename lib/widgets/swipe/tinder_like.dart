import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:renconsport/models/user/user.dart';
import 'package:renconsport/widgets/swipe/popup/popup_bio.dart';

class SwipeCard extends ConsumerWidget {
  const SwipeCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Container(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Bonjour ${user.first_name}  ${user.last_name}",
                style: TextStyle(color: Colors.amberAccent),
              ),
              IconButton(
                icon: Icon(Icons.close),
                iconSize: 55,
                color: Colors.red,
                onPressed: () {},
              ),
              PopupBio(),
              IconButton(
                icon: Icon(Icons.thumb_up_alt_sharp),
                iconSize: 50,
                color: Colors.blue,
                onPressed: () {},
              ),
            ]),
        height: MediaQuery.of(context).size.width * 2,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/muscu.png'), fit: BoxFit.cover)));
  }
}
