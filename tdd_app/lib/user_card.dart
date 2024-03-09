import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tdd_app/source_enum.dart';
import 'package:tdd_app/user_model.dart';

import 'database.dart';

class UserCard extends StatelessWidget {
  final User user;
  final Source source;
  const UserCard({required this.user, required this.source, super.key});

  @override
  Widget build(BuildContext context) {
    Database database = Provider.of<Database>(context);

    return Card(
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${user.firstName} ${user.lastName}"),
            Row(
              children: [
                source == Source.active
                    ? GestureDetector(
                    onTap: () {
                      database.moveToArchived(user);
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                        content: Text("User moved to Archive"),
                        backgroundColor: Colors.deepPurple,
                      ));
                    },
                    child: const Icon(Icons.archive))
                    : GestureDetector(
                    onTap: () => database.moveToActive(user),
                    child: const Icon(CupertinoIcons.person_add_solid)),
                const SizedBox(width: 20),
                const Icon(CupertinoIcons.delete, color: Colors.red)
              ],
            )
          ],
        ),
      ),
    );
  }
}