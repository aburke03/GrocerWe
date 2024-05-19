import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  final TextEditingController _textController = TextEditingController();
  final CollectionReference _groceryCollection = FirebaseFirestore.instance.collection('groceryList');

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _addItem() {
    final String item = _textController.text;
    if (item.isNotEmpty) {
      _groceryCollection.add({'item': item, 'user': user.email});
      _textController.clear();
    }
  }

  void _removeItem(String id) {
    _groceryCollection.doc(id).delete();
  }

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout)),
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Logged in as ${user.email!}",
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      hintText: 'Enter grocery item',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addItem,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: _buildGroceryList(),
          ),
        ],
      ),
    );
  }

  Widget _buildGroceryList() {
    return StreamBuilder(
      stream: _groceryCollection.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final documents = snapshot.data!.docs;
        return ListView.builder(
          itemCount: documents.length,
          itemBuilder: (context, index) {
            final doc = documents[index];
            return ListTile(
              title: Text(doc['item']),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => _removeItem(doc.id),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Color.fromARGB(255, 27, 255, 114),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black54,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
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
      onTap: (index) {
        // Handle bottom navigation tap
      },
    );
  }
}
