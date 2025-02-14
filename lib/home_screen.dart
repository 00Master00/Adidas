import 'package:flutter/material.dart';
import 'adidas_screen.dart'; // Import หน้าจอ AdidasScreen
import 'search_screen.dart'; // Import หน้าจอ SearchScreen
import 'fav_screen.dart'; // Import หน้าจอ FavoriteScreen
import 'shopping_screen.dart'; // Import หน้าจอ ShoppingScreen
import 'cart.dart'; // Import หน้าจอ AdiclubScreen

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // ค่าเริ่มต้นของ index สำหรับ BottomNavigationBar

  final List<Widget> _screens = [
    AdidasScreen(),
    SearchScreen(),
    FavoriteScreen(),
    ShoppingScreen(),
    AdiclubScreen(),
  ];

  final List<String> _titles = [
    'SHOP',
    'SEARCH',
    'FAVORITES',
    'SHOPPING',
    'ADICLUB',
  ];

  // ฟังก์ชันที่ใช้ในการเปลี่ยนหน้าเมื่อกด BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // อัปเดต index เมื่อมีการกด
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_selectedIndex],
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0, // ทำให้แอปบาร์ไม่มีเงา
        actions: [
          IconButton(
            icon: Icon(Icons.person_outline, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: _screens[_selectedIndex], // แสดงหน้าจอที่เลือกจาก _screens
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icon/logo.png', width: 24, height: 28),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icon/adiclub.png', width: 32, height: 32),
            label: '',
          ),
        ],
      ),
    );
  }
}
