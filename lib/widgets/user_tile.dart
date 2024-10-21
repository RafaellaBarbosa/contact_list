import 'package:flutter/material.dart';

import '../models/user.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ListTile(
        leading: user.avatarUrl != null
            ? CircleAvatar(
                backgroundImage: NetworkImage(
                user.avatarUrl!,
              ))
            : const CircleAvatar(
                child: Icon(Icons.person),
              ),
        title: Text(
          user.name,
        ),
        subtitle: Text(user.email),
        trailing: SizedBox(
          height: 100,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    size: 18,
                  
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    size: 18,
                    color: Colors.red,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
