import 'package:flutter/material.dart';
import 'package:social_media/data/data.dart';
import 'package:social_media/widgets/cutomer_drawer.dart';
import 'package:social_media/widgets/following_users.dart';
import 'package:social_media/widgets/post_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          'EAGLEZ',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 10.0),
        ),
        bottom: TabBar(
            controller: _tabController,
            labelColor: Colors.white,
            labelStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 18,
            ),
            indicatorWeight: 3,
            tabs: <Widget>[
              Tab(text: 'Trending'),
              Tab(text: 'Latest'),
            ]),
      ),
      drawer: CustomeDrawer(),
      body: ListView(
        children: [
          FollowingUsers(),
          PostsCarousel(
            pageController: _pageController,
            title: 'Posts',
            posts: posts,
          )
        ],
      ),
    );
  }
}
