import 'package:flutter/material.dart';
import 'package:flutter_medical_crud/screens/screens.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // TextFields' controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  SpecialtiesService specialitiesService = SpecialtiesService();

  // Create new item
  Future<void> _createItem(Map<String, dynamic> newItem) async {
    final messageCreate =
        await specialitiesService.createNewSpecialties(newItem);

    NotificationsService.showSnackbar(messageCreate);

    await specialitiesService.loadSpecialties(); // update the UI
  }

  // Update a single item
  Future<void> _updateItem(Map<String, dynamic> item) async {
    final messageCreate = await specialitiesService.updateSpecialties(item);

    NotificationsService.showSnackbar(messageCreate);

    await specialitiesService.loadSpecialties(); // update the UI
  }

  void _showForm(BuildContext ctx, int? itemKey) async {
    // itemKey == null -> create new item
    // itemKey != null -> update an existing item

    if (itemKey != null) {
      final existingItem = specialitiesService.specialties['data']['items']
          .firstWhere((element) => element['id'] == itemKey);
      _nameController.text = existingItem['name'];
      _descriptionController.text = existingItem['description'];
    } else {
      _nameController.text = '';
      _descriptionController.text = '';
    }

    showModalBottomSheet(
        context: ctx,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(ctx).viewInsets.bottom,
                  top: 15,
                  left: 15,
                  right: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(hintText: 'Nombre'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _descriptionController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(hintText: 'Descripción'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // Save new item
                      if (itemKey == null) {
                        _createItem({
                          "name": _nameController.text,
                          "description": _descriptionController.text
                        });
                      }

                      // update an existing item
                      if (itemKey != null) {
                        _updateItem({
                          "id": itemKey,
                          'name': _nameController.text.trim(),
                          'description': _descriptionController.text.trim()
                        });
                      }

                      // Clear the text fields
                      _nameController.text = '';
                      _descriptionController.text = '';

                      Navigator.of(context).pop(); // Close the bottom sheet
                    },
                    child: Text(itemKey == null ? 'Create New' : 'Update'),
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    specialitiesService = Provider.of<SpecialtiesService>(context);

    if (specialitiesService.isLoading) return const LoadingScreen();

    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Especialidades'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              authService.logout();
              Navigator.pushReplacementNamed(context, 'login');
              print('logout');
            },
          ),
        ],
      ),
      body: ListView.builder(
          // the list of items
          itemCount: specialitiesService.specialties['data']['items'].length,
          itemBuilder: (_, index) {
            final currentItem =
                specialitiesService.specialties['data']['items'][index];
            return Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(0),
                    bottomLeft: Radius.circular(20)),
              ),
              color: Colors.white,
              margin: const EdgeInsets.all(10),
              elevation: 3,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                    title: Text(currentItem['name']),
                    subtitle: Text(currentItem['description'].toString()),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Edit button
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _showForm(
                            context,
                            currentItem['id'],
                          ),
                        ),

                        // onPressed: () =>
                        //     _showForm(context, currentItem['key'])),
                        // Delete button
                        // IconButton(
                        //   icon: const Icon(Icons.delete),
                        //   onPressed: () {},
                        //   // onPressed: () => _deleteItem(currentItem['key']),
                        // ),
                      ],
                    )),
              ),
            );
          }),
      // Add new item button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () => _showForm(context, null),
        // onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
