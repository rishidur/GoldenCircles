import 'package:flutter/material.dart';

class Event {
  final String name;
  final String creatorName; // Creator's name
  final String creatorContact; // Creator's contact information
  final String description;
  final List<String> tags;

  Event({
    required this.name,
    required this.creatorName,
    required this.creatorContact,
    required this.description,
    required this.tags,
  });
}

class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  // Local in-memory event store
  List<Event> _events = [];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _creatorNameController = TextEditingController(); // Creator's name
  final TextEditingController _creatorContactController = TextEditingController(); // Creator's contact info
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _tagsController = TextEditingController();

  // Function to add an event to the overall list
  void _addEvent() {
    String name = _nameController.text;
    String creatorName = _creatorNameController.text;
    String creatorContact = _creatorContactController.text; // Creator's contact info
    String description = _descriptionController.text;
    List<String> tags = _tagsController.text.split(',').map((tag) => tag.trim()).toList();

    if (name.isNotEmpty && creatorName.isNotEmpty && creatorContact.isNotEmpty && description.isNotEmpty) {
      setState(() {
        _events.add(Event(
          name: name,
          creatorName: creatorName,
          creatorContact: creatorContact,
          description: description,
          tags: tags,
        ));
      });
      _clearControllers();
      Navigator.of(context).pop(); // Close the dialog after adding
    }
  }

  // Function to clear input controllers
  void _clearControllers() {
    _nameController.clear();
    _creatorNameController.clear(); // Clear creator's name
    _creatorContactController.clear(); // Clear creator's contact info
    _descriptionController.clear();
    _tagsController.clear();
  }

  // Function to show a dialog for adding events
  void _showAddEventDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Event'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(hintText: 'Event Name'),
            ),
            TextField(
              controller: _creatorNameController,
              decoration: InputDecoration(hintText: 'Your Name'), // Creator's name input
            ),
            TextField(
              controller: _creatorContactController,
              decoration: InputDecoration(hintText: 'Your Contact Info'), // Creator's contact info input
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(hintText: 'Description'),
            ),
            TextField(
              controller: _tagsController,
              decoration: InputDecoration(hintText: 'Tags (comma-separated)'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: _addEvent,
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _showAddEventDialog,
          ),
        ],
      ),
      body: _events.isEmpty
          ? Center(child: Text('No events added yet!'))
          : ListView.builder(
              itemCount: _events.length,
              itemBuilder: (context, index) {
                final event = _events[index];
                return ListTile(
                  title: Text(event.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Created by: ${event.creatorName}'),
                      Text('Contact: ${event.creatorContact}'), // Display creator's contact info
                      Text('Description: ${event.description}'),
                      Text('Tags: ${event.tags.join(', ')}'),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
