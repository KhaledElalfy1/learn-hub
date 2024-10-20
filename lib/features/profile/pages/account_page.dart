import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learnhub/core/managers/asset_manager.dart';

class AccountPage extends StatelessWidget {

    const AccountPage({super.key});

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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        title:const Text(
                    'Account',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Center(
              child: Column(
                children: [
                  ClipOval(
                    child: SvgPicture.asset(
                      SvgAssets.profile, 
                      width: 80, 
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                const SizedBox(height: 8)
                ],
              ),
            ),
          const SizedBox(height: 24),

            Expanded(
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
                          style:const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        index == 4? IconButton(
                          padding: EdgeInsets.all(0),
                          icon: Icon(icon , color: Colors.grey,),
                          onPressed: (){},
                        ):
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(icon , color: Colors.grey,),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
