import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnhub/features/login/presentation/cubit/log_out_cubit.dart';
import '../../../core/managers/shared_perference_manager.dart';
import '../../../core/navigation/routes.dart';

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
      'Edit Account',
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
      final TextEditingController textController = TextEditingController();

      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Edit Account'),
            content: TextField(
              controller: textController,
              decoration: const InputDecoration(hintText: 'Enter new Name'),
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
                  setState(() {
                    // log(textController.text);
                    // log(SharedPreferencesManager.getName().toString());
                    SharedPreferencesManager.setName(textController.text);
                    // log(SharedPreferencesManager.getName().toString());
                  });
                  Navigator.of(context).pop();
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
            padding: const EdgeInsets.symmetric(vertical: 12.0),
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
                          color: Colors.grey,
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
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  BlocProvider.of<LogOutCubit>(context).signOut();
                                  log('logout Success');
                                  Navigator.pushReplacementNamed(context, Routes.login);
                                },
                              )
                      
                        : Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Icon(
                              icon,
                              color: Colors.grey,
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
