import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:register/provider/users.dart';

import '../widgets/user_tile.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<Users>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Lista de Contatos",
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                users.removeUser('1');
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: users.count,
          itemBuilder: (BuildContext context, int index) {
            return UserTile(user: users.byIndex(index));
          },
        ));
  }
}
