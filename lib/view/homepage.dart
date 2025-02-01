import 'package:flutter/material.dart';
import 'medication.dart';
import 'profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // List of pages for each navigation tab
  final List<Widget> _pages = [
    HomeFeedPage(),
    const MedicationPage(),
    const Center(
        child: Text('Notification Page', style: TextStyle(fontSize: 24))),
    const ProfilePage(),
  ];

  // Function to handle bottom navigation bar taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(199, 58, 82, 236),
        title: const Text('Amrit'),
      ),
      body: _pages[_selectedIndex], // Show the page based on the selected tab
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medication),
            label: 'Medication',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex, // Update the selected tab
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped, // Update the index on tap
      ),
    );
  }
}

class HomeFeedPage extends StatelessWidget {
  final List<Map<String, String>> posts = [
    {
      "username": "Madan",
      "image": "https://via.placeholder.com/400",
      "caption": "Enjoying the beautiful view!"
    },
    {
      "username": "Dhane",
      "image": "https://via.placeholder.com/400",
      "caption": "Great day for football!"
    },
    {
      "username": "Swostika",
      "image": "https://via.placeholder.com/400",
      "caption": "Love this moment!"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return PostCard(
          username: posts[index]['username']!,
          imageUrl: posts[index]['image']!,
          caption: posts[index]['caption']!,
        );
      },
    );
  }
}

class PostCard extends StatelessWidget {
  final String username;
  final String imageUrl;
  final String caption;

  const PostCard({
    required this.username,
    required this.imageUrl,
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            child: Text(username[0]),
          ),
          title: Text(username, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Image.network(imageUrl, fit: BoxFit.cover),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(caption, style: TextStyle(fontSize: 14)),
        ),
        Divider(),
      ],
    );
  }
}
