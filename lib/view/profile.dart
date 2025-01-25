import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://via.placeholder.com/150', // Replace with profile picture URL
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "John Doe",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "johndoe@example.com",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
                // Add functionality here
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text("Order History"),
              onTap: () {
                // Add functionality here
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text("Help & Support"),
              onTap: () {
                // Add functionality here
              },
            ),
            ListTile(
              leading: const Icon(Icons.details),
              title: const Text("details"),
              onTap: () {
                // Add functionality here
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Log Out"),
              onTap: () {
                // Add functionality here
              },
            ),
          ],
        ),
      ),
    );
  }
}
