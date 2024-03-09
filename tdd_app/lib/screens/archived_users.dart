import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../database.dart';
import '../source_enum.dart';
import '../user_card.dart';
import 'active_user.dart';

class ArchivedUsers extends StatelessWidget {
  const ArchivedUsers({super.key});

  static String routeName = '/archive';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Archived Users"),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context)
                  .pushReplacementNamed(ActiveUsers.routeName),
              icon: const Icon(CupertinoIcons.archivebox))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
        child: Consumer<Database>(builder: (context, database, child) {
          return database.archivedUsers.isNotEmpty
              ? ListView.builder(
              itemCount: database.archivedUsers.length,
              itemBuilder: (context, index) => UserCard(
                  user: database.archivedUsers[index],
                  source: Source.archived))
              : const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("You have no archived users."),
                SizedBox(height: 5.0),
                Text("Users you move to archive will appear here"),
              ],
            ),
          );
        }),
      ),
    );
  }
}