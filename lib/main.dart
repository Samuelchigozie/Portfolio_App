import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'about.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/about': (context) => AboutPage(), // Define AboutPage route
      },
      home: ProfileApp(),
    ));

class ProfileApp extends StatefulWidget {
  const ProfileApp({Key? key}) : super(key: key);

  @override
  State<ProfileApp> createState() => _ProfileAppState();
}

class _ProfileAppState extends State<ProfileApp> {
  late double coverHeight;
  late double profileHeight;
  late double top;

  @override
  void initState() {
    super.initState();
    coverHeight = 280;
    profileHeight = 144;
    top = coverHeight - profileHeight / 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.ltr, // Set text direction as needed
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildTop(),
              buildAbout(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTop() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        buildCoverImage(),
        Positioned(
          top: top,
          child: profileImage(),
        ),
        Positioned(
          top: coverHeight + profileHeight / 2,
          left: 16.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Samuel Chigozie',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.0),
              Row(
                children: [
                  Icon(Icons.people),
                  SizedBox(width: 4.0),
                  Text('Followers: 100'),
                  SizedBox(width: 12.0),
                  Icon(Icons.people_outline),
                  SizedBox(width: 4.0),
                  Text('Following: 50'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildAbout() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 140, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            'Fullstack developer passionate about Flutter. Excited to share my knowledge and learn from others.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          Text(
            'Connect with me:',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.facebook),
                onPressed: () {},
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.twitter), // Twitter icon
                onPressed: () {},
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.linkedin), // LinkedIn icon
                onPressed: () {},
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.github), // GitHub icon
                onPressed: () {},
              ),
              SizedBox(
                  width:
                      100), // Add a margin between the icons and the floating button
              FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/about');
                },
                child: Icon(Icons.info),
                backgroundColor:
                    Colors.blue, // Customize button color as needed
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.asset(
          'assets/profilebg.jpg',
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );

  Widget profileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: AssetImage('assets/profilepic.jpg'),
      );
}
