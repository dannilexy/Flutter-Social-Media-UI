import 'package:flutter/material.dart';
import 'package:social_media/models/user_model.dart';
import 'package:social_media/widgets/cutomer_drawer.dart';
import 'package:social_media/widgets/post_carousel.dart';
import 'package:social_media/widgets/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  const ProfileScreen(this.user);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PageController _yourPostPageController = PageController();
  PageController _favoritesPostPageController = PageController();
  @override
  @override
  void initState() {
    super.initState();
    _yourPostPageController =
        PageController(initialPage: 0, viewportFraction: .8);
    _favoritesPostPageController =
        PageController(initialPage: 0, viewportFraction: .8);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomeDrawer(),
      body: SingleChildScrollView(
        // controller: controller,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    image: AssetImage(widget.user.backgroundImageUrl),
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () => _scaffoldKey.currentState!.openDrawer(),
                    iconSize: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                  top: 50,
                  left: 20,
                ),
                Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black45,
                              offset: Offset(0, 2),
                              blurRadius: 6)
                        ]),
                    child: ClipOval(
                      child: Image(
                        image: AssetImage(widget.user.profileImageUrl),
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  bottom: 10.0,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                widget.user.name,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Following',
                      style: TextStyle(fontSize: 22, color: Colors.black54),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      widget.user.following.toString(),
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Followers',
                      style: TextStyle(fontSize: 22, color: Colors.black54),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      widget.user.followers.toString(),
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
            PostsCarousel(
                pageController: _yourPostPageController,
                title: 'Your Posts',
                posts: widget.user.posts),
            PostsCarousel(
                pageController: _favoritesPostPageController,
                title: 'Favorite Posts',
                posts: widget.user.favorites),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
