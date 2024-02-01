import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/riverpod.dart';

import '../View/home_screen.dart';
import '../View/profile_screen.dart';

final homeScreenViewModelProvider = ChangeNotifierProvider((ref) => HomeScreenViewModel());

class HomeScreenViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? loggedinUser;
  int selectedIndex = 0;
  List<String> itemList = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 8', 'Item 9', 'Item 10', 'Item 11', 'Item 12', 'Item 13', 'Item 14']; // Initial list of items


  HomeScreenViewModel() {
    getCurrentUser();
  }

  Future<void> getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  void onItemTapped(int index, BuildContext context) {
    selectedIndex = index;
    notifyListeners();

    if (index == 1) {
      // Navigate to ProfileScreen when Profile tab is tapped
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileScreen(user: loggedinUser),
        ),
      );
    }
  }

  void signOut(BuildContext context) {
    _auth.signOut();
    Navigator.pop(context);
  }
  void addItem(String newItem) {
    itemList.add(newItem);
    notifyListeners();
  }

  void editItem(int index, String editedItem) {
    itemList[index] = editedItem;
    notifyListeners();
  }

  void deleteItem(int index) {
    itemList.removeAt(index);
    notifyListeners();
  }

}
