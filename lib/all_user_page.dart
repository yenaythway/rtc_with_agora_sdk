import 'package:flutter/material.dart';
import 'package:rtc_with_agora_sdk/extension.dart';

class AllUserPage extends StatelessWidget {
  const AllUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("All User"),
    );
  }
}

class EachUserWiget extends StatelessWidget {
  const EachUserWiget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            "-",
            style: context.bm!.copyWith(color: Colors.black),
          ),
          const Expanded(child: SizedBox()),
          InkWell(
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Container())),
              child: const Icon(Icons.add_circle_outline_rounded)),
          // const SizedBox(width: 20)
        ],
      ),
    );
  }
}
