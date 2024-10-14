import 'package:flutter/material.dart';

class EditableProfilePage extends StatefulWidget {
  @override
  _EditableProfilePageState createState() => _EditableProfilePageState();
}

class _EditableProfilePageState extends State<EditableProfilePage> {
  // Default profile image URL (could be a placeholder image)
  String _profileImageUrl = 'https://via.placeholder.com/150';

  // Controllers for editable text fields
  final TextEditingController _nameController = TextEditingController(text: "");
  final TextEditingController _aboutController = TextEditingController(text: "");
  final TextEditingController _emailController = TextEditingController(text: "");
  final TextEditingController _eventsController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Colors.blueAccent, // Change the AppBar color
      ),
      backgroundColor: Colors.grey[900], // Dark background for the page
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Profile Picture (using a network image for now)
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(_profileImageUrl),
            ),
            SizedBox(height: 20),

            // Editable Name Field
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                filled: true,
                fillColor: Colors.grey[800], // Darker fill color
                labelStyle: TextStyle(color: Colors.white), // Light label text
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blueAccent), // Border color
                ),
              ),
              style: TextStyle(color: Colors.white), // White text color
            ),
            SizedBox(height: 20),

            // Editable About Me Field
            TextField(
              controller: _aboutController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'About Me',
                filled: true,
                fillColor: Colors.grey[800], // Darker fill color
                labelStyle: TextStyle(color: Colors.white), // Light label text
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blueAccent), // Border color
                ),
              ),
              style: TextStyle(color: Colors.white), // White text color
            ),
            SizedBox(height: 20),

            // Editable Email Field
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.grey[800], // Darker fill color
                labelStyle: TextStyle(color: Colors.white), // Light label text
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blueAccent), // Border color
                ),
              ),
              style: TextStyle(color: Colors.white), // White text color
            ),
            SizedBox(height: 20),

            // Editable Events Attended Field
            TextField(
              controller: _eventsController,
              maxLines: 2,
              decoration: InputDecoration(
                labelText: 'Events Attended',
                filled: true,
                fillColor: Colors.grey[800], // Darker fill color
                labelStyle: TextStyle(color: Colors.white), // Light label text
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blueAccent), // Border color
                ),
              ),
              style: TextStyle(color: Colors.white), // White text color
            ),
            SizedBox(height: 20),

            // Save Button
            ElevatedButton(
              onPressed: () {
                // Action when the save button is pressed
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Profile Updated')),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: StadiumBorder(),
                backgroundColor: Colors.blueAccent, // Button color
              ),
              child: Text('Save', style: TextStyle(fontSize: 18, color: Colors.white)), // White text
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: EditableProfilePage(),
  ));
}
