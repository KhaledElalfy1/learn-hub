import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnhub/features/login/presentation/cubit/log_out_cubit.dart';
import '../../../core/managers/shared_perference_manager.dart';
import '../../../core/navigation/routes.dart';
import '../../login/presentation/cubit/login_cubit.dart';
import 'account_page_body.dart';

class AccountOptionDetail extends StatefulWidget {
  const AccountOptionDetail({super.key});

  @override
  State<AccountOptionDetail> createState() => _AccountOptionDetailState();
}

class _AccountOptionDetailState extends State<AccountOptionDetail> {
  @override
  Widget build(BuildContext context) {
    final List<String> accountOptions = [
      'Favourite',
      'Edit Name',
      'Settings and Privacy',
      'Help',
      'Log Out'
    ];

    final List icons = [
      Icons.favorite,
      Icons.edit,
      Icons.settings,
      Icons.help,
      Icons.logout
    ];
    Future<void> openEditDialog() async {
      final TextEditingController textController = TextEditingController(
        text: SharedPreferencesManager.getName(),
      );

      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Edit'),
            content: TextFormField(
              controller: textController,
              decoration:   InputDecoration(
                  hintText: 'Edit your name',
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context)
                      .pop(); // Close the dialog without saving
                },
              ),
              TextButton(
                child: const Text('Save'),
                onPressed: () {
                  final newName = textController.text;
                  if (newName.isNotEmpty) {
                    BlocProvider.of<LoginCubit>(context).updateName(newName);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Name updated successfully!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          );
        },
      );
    }

    return Expanded(
      child: ListView.builder(
        itemCount: accountOptions.length,
        itemBuilder: (context, index) {
          final option = accountOptions[index];
          final icon = icons[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 7.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  option,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                index == 1
                    ? IconButton(
                        padding: const EdgeInsets.all(0),
                        icon: Icon(
                          icon,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          openEditDialog();
                        },
                      )
                    : index == 4
                        ? IconButton(
                                padding: const EdgeInsets.all(0),
                                icon: Icon(
                                  icon,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  BlocProvider.of<LogOutCubit>(context).signOut();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('logout done successfully!'),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                  Navigator.pushReplacementNamed(context, Routes.login);
                                },
                              )
                      
                        : Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Icon(
                              icon,
                              color: Colors.blue,
                            ),
                          )
              ],
            ),
          );
        },
      ),
    );
  }
}
