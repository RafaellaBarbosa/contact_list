import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:register/provider/users.dart';
import 'package:register/routes/app_routes.dart';

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
                icon: const Icon(
                  Icons.edit,
                  size: 18,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.userForm,
                    arguments: user,
                  );
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.delete,
                  size: 18,
                  color: Colors.red,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: const Text('Excluir o usuário'),
                        content: const Text('Você tem certeza???'),
                        actions: [
                          TextButton(
                            child: const Text('Excluir'),
                            onPressed: () {
                              Provider.of<Users>(context, listen: false)
                                  .removeUser(user.id!);
                              Navigator.of(context).pop(true);
                            },
                          ),
                          TextButton(
                            child: const Text('Cancelar'),
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                          )
                        ],
                      );
                    },
                  ).then(
                    (confirmed) {
                      if (confirmed && context.mounted) {
                        return ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Usuário Excluido com sucesso'),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
