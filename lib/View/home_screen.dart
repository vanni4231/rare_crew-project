// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// User? loggedinUser = FirebaseAuth.instance.currentUser;
//
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final _auth = FirebaseAuth.instance;
//   int _selectedIndex = 0;
//
//   void initState() {
//     super.initState();
//     getCurrentUser();
//   }
//
//   void getCurrentUser() async {
//     try {
//       final user = await _auth.currentUser;
//       if (user != null) {
//         setState(() {
//           loggedinUser = user;
//         });
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//       if (index == 1) {
//         // Navigate to ProfileScreen when Profile tab is tapped
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ProfileScreen(user: loggedinUser),
//           ),
//         );
//       }
//
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: null,
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.close),
//             onPressed: () {
//               _auth.signOut();
//               Navigator.pop(context);
//             },
//           ),
//         ],
//         title: Text('Home Page'),
//         backgroundColor: Colors.lightBlueAccent,
//       ),
//       body: Center(
//         child: Text(
//           "Welcome ${loggedinUser?.displayName ?? 'User'}",
//           style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.lightBlueAccent,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
//
// }
// class ProfileScreen extends StatelessWidget {
//   final User? user;
//
//   ProfileScreen({required this.user});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Welcome ${user?.email ?? 'User'}',
//               style: TextStyle(fontSize: 20.0),
//             ),
//             // You can display other user information here
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


import '../View Model/view_model_homescreen.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(homeScreenViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => viewModel.signOut(context),
          ),


        ],
        title: Text('Home Page'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ListView.builder(
        itemCount: viewModel.itemList.length,
        itemBuilder: (context, index) {
          final item = viewModel.itemList[index];
          return ListTile(
            title: Text(item),
            trailing: Row(mainAxisSize: MainAxisSize.min,children: [IconButton(
              icon: Icon(Icons.add),
              onPressed: () => viewModel.addItem('Item 1',),
            ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => viewModel.deleteItem(index)
              ),
              IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => viewModel.editItem(index, "'Item 1', 'Item 2', 'Item 3', ")
              ),

              
              
            ],),
          );
        },
      ),

      // body: Center(
      //   child: Text(
      //     "Welcome ${viewModel.loggedinUser?.displayName ?? 'User'}",
      //     style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      //   ),
      //
      //
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: viewModel.selectedIndex,
        selectedItemColor: Colors.lightBlueAccent,
        onTap: (index) => viewModel.onItemTapped(index, context),
      ),
    );
  }
}

