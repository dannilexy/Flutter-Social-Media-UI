import 'package:flutter/material.dart';
import 'package:social_media/data/data.dart';
import 'package:social_media/screens/home_screen.dart';
import 'package:social_media/screens/login_screen.dart';
import 'package:social_media/screens/profile_screen.dart';

class CustomeDrawer extends StatelessWidget {
  const CustomeDrawer({Key? key}) : super(key: key);

  _buildDrawerOption(Icon icon, String title, {required Function() onTap}) {
    return ListTile(
      onTap: onTap,
      leading: icon,
      title: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Stack(
          children: [
            Image(
              height: 200.0,
              width: double.infinity,
              image: AssetImage(
                currentUser.backgroundImageUrl,
              ),
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 20.0,
              left: 20.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 3.0,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    child: ClipOval(
                      child: Image(
                        image: AssetImage(
                          currentUser.profileImageUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 6.0),
                  Text(
                    currentUser.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        _buildDrawerOption(
          Icon(Icons.dashboard),
          'Home',
          onTap: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => HomeScreen(),
            ),
          ),
        ),
        _buildDrawerOption(Icon(Icons.chat), 'Chat', onTap: () {}),
        _buildDrawerOption(Icon(Icons.location_on), 'Map', onTap: () {}),
        _buildDrawerOption(
          Icon(Icons.account_circle),
          'Your Profile',
          onTap: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => ProfileScreen(currentUser),
            ),
          ),
        ),
        _buildDrawerOption(Icon(Icons.settings), 'Settings', onTap: () {}),
        Expanded(
            child: Align(
          alignment: FractionalOffset.bottomCenter,
          child: _buildDrawerOption(
            Icon(Icons.directions_run),
            'Logout',
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => LoginScreen(),
              ),
            ),
          ),
        ))
      ],
    ));
  }
}
