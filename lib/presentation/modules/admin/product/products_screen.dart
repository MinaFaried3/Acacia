import 'package:acacia/app/shared/common/printer_manager.dart';
import 'package:acacia/presentation/resources/color_manager.dart';
import 'package:acacia/presentation/resources/routes/routes_manager.dart';
import 'package:acacia/presentation/resources/styles_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  // Create a CollectionReference called users that references the firestore collection
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  final TextEditingController fullName = TextEditingController();
  final TextEditingController company = TextEditingController();
  final TextEditingController age = TextEditingController();

  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'full_name': fullName.text, // John Doe
          'company': company.text, // Stokes and Sons
          'age': age.text, // 42
        })
        .then((DocumentReference userDocRef) async {
          print('value.path ${userDocRef.path}');
          print('value.id ${userDocRef.id}');
          print('value.firestore ${userDocRef.firestore}');
          print("User Added");
          // Now add a subcollection 'orders' to this new user
          CollectionReference orders = userDocRef.collection('orders');

          await orders.add({
            'product': 'Laptop',
            'price': 2000,
            'date': Timestamp.now(),
          });

          print("User and order added successfully");
        })
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    printer('ProductsScreen build called', color: ConsoleColor.green);
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 200,
                height: 100,
                color: AppColors.deepOlive,
                child: Text(
                  'Add User',
                  style: get600SemiBoldStyle(
                    fontSize: 40,
                    color: AppColors.deepOlive,
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 100,
                color: AppColors.deepOlive,
                child: Text(
                  'Add User',
                  style: get600SemiBoldStyle(
                    fontSize: 40,
                    color: AppColors.deepOlive,
                  ),
                ),
              ),
              Text(
                'Add User',
                style: get600SemiBoldStyle(
                  fontSize: 40,
                  color: AppColors.deepOlive[200]!,
                ),
              ),
              Text(
                'Add User',
                style: get600SemiBoldStyle(
                  fontSize: 40,
                  color: AppColors.deepOlive[500]!,
                ),
              ),
              Text(
                'Welcome to the Products Screen!',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              TextButton(
                onPressed: () =>
                    context.push(Routes.productDetails.absolutePath),
                child: Text('Go to Product Details'),
              ),
              TextFormField(
                controller: fullName,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  hintText: 'Enter your full name',
                ),
              ),
              TextFormField(
                controller: company,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  hintText: 'Enter your full name',
                ),
              ),
              TextFormField(
                controller: age,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  hintText: 'Enter your full name',
                ),
              ),
              TextButton(
                onPressed: () {
                  addUser();
                  fullName.clear();
                  company.clear();
                  age.clear();
                },
                child: Text(
                  'Add User',
                  style: get500MediumStyle(color: AppColors.deepOlive),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
