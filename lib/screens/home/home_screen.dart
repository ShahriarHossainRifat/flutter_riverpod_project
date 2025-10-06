import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_project/providers/cart_provider.dart';
import '../../providers/products_provider.dart';
import '../../shared/cart_icon.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(productsProvider);
    final cartProducts = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Garage Sale Products'),
        actions: [CartIcon()],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: allProducts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Image.asset(
                      allProducts[index].image,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    allProducts[index].title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5),
                  Text(
                    '\$${allProducts[index].price}',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),

                  if (cartProducts.contains(allProducts[index]))
                    ElevatedButton(
                      onPressed: () {
                        ref
                            .read(cartProvider.notifier)
                            .removeProduct(allProducts[index]);
                      },
                      child: Text('Remove'),
                    ),

                  if (!cartProducts.contains(allProducts[index]))
                    ElevatedButton(
                      onPressed: () {
                        ref
                            .read(cartProvider.notifier)
                            .addProduct(allProducts[index]);
                      },
                      child: Text('Add'),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
