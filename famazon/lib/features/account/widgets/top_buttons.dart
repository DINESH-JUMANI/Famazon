import 'package:famazon/features/account/services/account_services.dart';
import 'package:famazon/features/account/widgets/account_button.dart';
import 'package:famazon/features/auth/services/auth_service.dart';
import 'package:famazon/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();
    final user = Provider.of<UserProvider>(context).user;
    void turnSeller() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Are you sure'),
              content: const Text(
                'You want to change your account to seller?',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () {
                    authService.updateUser(user, context);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Yes'),
                ),
              ],
            );
          });
    }

    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              text: 'Your Orders',
              onPressed: () {},
            ),
            AccountButton(
              text: 'Turn Seller',
              onPressed: turnSeller,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            AccountButton(
              text: 'Log Out',
              onPressed: () => AccountServices().logOut(context),
            ),
            AccountButton(
              text: 'Your Wish List',
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
