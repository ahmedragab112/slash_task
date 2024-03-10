import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/feature/features/deatils/presentation/manager/productdetils_cubit.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
         await context.read<ProductdetilsCubit>().getProductDetails(id: '10');
        },
      ),
    );
  }
}
