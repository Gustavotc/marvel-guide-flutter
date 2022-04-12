import 'package:flutter/material.dart';

class UserHeader extends StatelessWidget {
  final String username;
  final VoidCallback logout;

  const UserHeader({Key? key, required this.username, required this.logout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Bem vindo, $username!',
          style: theme.bodyMedium,
        ),
        IconButton(
          onPressed: logout,
          icon: const Icon(Icons.exit_to_app_outlined),
          color: Colors.white60,
        )
      ],
    );
  }
}
