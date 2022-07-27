import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_thingies/domain/view_models/user_view_model.dart';

import '../../domain/user.dart';

class FutureProviderExp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future provider"),
      ),
      body: Center(
        child: Column(
          children: [
            FutureProvider<User>(
              create: (_) => context.read<UserViewModel>().getUser(),
              initialData: User(name: "Initial user", age: 0),
              child: Consumer<User>(
                builder: (c, usr, child) {
                  return Center(
                    child: Text("User name is = ${usr.name}"),
                  );
                },
              ),
            ),
            Consumer<UserViewModel>(
              builder: (c, vm, child) {
                return Consumer<int>(
                  builder: (ctx, n, child) {
                    return Text("Number is $n");
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
