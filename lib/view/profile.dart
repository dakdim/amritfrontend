import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.lightBlue],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Content
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                // Profile Picture with Shadow
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  child: const CircleAvatar(
                    radius: 55,
                    backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150', // Replace with actual URL
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // Name
                const Text(
                  "Shailesh Devkota",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                // Email
                const Text(
                  "devkotshailesh76@gmail.com",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 20),

                // Profile Options with Cards
                _buildProfileOption(Icons.settings, "Settings"),
                _buildProfileOption(Icons.history, "Medication History"),
                _buildProfileOption(Icons.help, "Help & Support"),
                _buildProfileOption(Icons.details, "Details"),

                // Logout Button
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                    ),
                    onPressed: () {
                      // Add logout functionality
                    },
                    icon: const Icon(Icons.logout),
                    label: const Text("Log Out"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to create profile options in card format
  Widget _buildProfileOption(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.blueAccent),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 18),
          onTap: () {
            // Add navigation functionality
          },
        ),
      ),
    );
  }
}
