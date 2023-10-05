import 'package:flutter/material.dart';
import 'package:goodsplit/providers/user_provider.dart';
import 'package:goodsplit/services/auth_services.dart';
import 'package:provider/provider.dart';

class HomeContainer extends StatefulWidget {
  const HomeContainer({super.key});

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  //constants
  TextEditingController groupTitle = TextEditingController();
  TextEditingController total = TextEditingController();
  void _showDialog() {
    //show dialog box to input name and and more button cancel button and price button
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Create a new group'),
          content: Container(
            height: 200,
            child: Column(
              children: [
                TextField(
                  //text editing controller
                  controller: groupTitle,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Title',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // TextField(
                //   decoration: const InputDecoration(
                //     border: OutlineInputBorder(),
                //     labelText: 'Add member',
                //   ),
                // ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: total,
                  //text input type number
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Total',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                //call api to create group
                AuthService().createGroup(
                  context: context,
                  title: groupTitle.text,
                  total: total.text,
                );
                addMembers();
              },
              child: const Text('Create'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //height and width
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      body: Container(
        // color: Colors.red,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              child: ListTile(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                title: Text(
                  'Welcome ${user.name}',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  '${user.email}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: 100,
              width: double.infinity,
              child: ElevatedButton(
                child: Text("Make a new Group"),
                onPressed: _showDialog,
                style: ButtonStyle(
                  //add background color
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(46, 94, 239, 1)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addMembers() {
    //show a dialog box with input field to add members name
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add members'),
          content: Container(
            height: 200,
            child: Column(
              children: [
                TextField(
                  //text editing controller
                  controller: groupTitle,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Add member',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
            TextButton(
              onPressed: () {
                //call api to create group
              },
              child: const Text('Create'),
            ),
          ],
        );
      },
    );
  }
}
