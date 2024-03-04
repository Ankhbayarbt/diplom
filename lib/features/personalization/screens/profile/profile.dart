import 'package:ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  AuthenticationRepository.instance.logout();
                },
                child: const Text('Log out'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
