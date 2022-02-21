import 'package:flutter/material.dart';
import 'package:social_media/data/data.dart';
import 'package:social_media/models/user_model.dart';

class FollowingUsers extends StatefulWidget {
  const FollowingUsers({Key? key}) : super(key: key);

  @override
  _FollowingUsersState createState() => _FollowingUsersState();
}

class _FollowingUsersState extends State<FollowingUsers> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Text(
            'Following',
            style: TextStyle(
                fontSize: 24.0, fontWeight: FontWeight.bold, letterSpacing: 2),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 10),
          height: 80,
          // color: Colors.red,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              User user = users[index];
              return GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 2, color: Theme.of(context).primaryColor),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6,
                        )
                      ]),
                  child: ClipOval(
                    child: Image(
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                      image: AssetImage(user.profileImageUrl),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
