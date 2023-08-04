import 'package:flutter/material.dart';
import 'package:social_media_app/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onProfileTap;
  final void Function()? onSignOutTap;
  const MyDrawer({super.key, this.onProfileTap, this.onSignOutTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //header
          Column(
            children: [
              const DrawerHeader(
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 64,
                ),
              ),
              //home list
              MyListTile(
                icon: Icons.home,
                text: 'H O M E',
                onTap: () => Navigator.pop(context),
              ),

              //profile list
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: MyListTile(
                  icon: Icons.person,
                  text: 'P R O F I L E',
                  onTap: onProfileTap,
                ),
              ),
            ],
          ),

          //logout
          MyListTile(
            icon: Icons.logout,
            text: 'L O G O U T',
            onTap: onSignOutTap,
          ),
        ],
      ),
    );
  }
}
