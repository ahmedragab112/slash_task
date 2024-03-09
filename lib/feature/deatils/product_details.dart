import 'package:flutter/material.dart';
import 'package:slash_task/config/router/routes.dart';

class ProductDeatils extends StatelessWidget {
  const ProductDeatils({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.homeProducts);
            },
            child: const Text('go to home')),
      ),
    );
  }
}
