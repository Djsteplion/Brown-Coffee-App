// ignore_for_file: unused_element
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../screens/home_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/order_page_screen.dart';
import '../screens/notifications_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeScreen(),
      const FavoritesScreen(),
      const OrderPageScreen(),
      const NotificationsScreen(),
    ];

    // Initial icon states
    final List<IconData> icons = [
      IconlyLight.home,
      IconlyLight.heart,
      IconlyLight.bag,
      IconlyLight.notification,
    ];

    return Scaffold(
      backgroundColor: Colors.white,
     
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(icons.length, (index) {
            final isSelected = _selectedIndex == index;

            // Logic to determine the icon shape (Bold when selected)
            IconData displayIcon;
            if (isSelected) {
              switch (index) {
                case 0: displayIcon = IconlyBold.home; break;
                case 1: displayIcon = IconlyBold.heart; break;
                case 2: displayIcon = IconlyBold.bag; break;
                case 3: displayIcon = IconlyBold.notification; break;
                default: displayIcon = icons[index];
              }
            } else {
              displayIcon = icons[index];
            }

            return GestureDetector(
              onTap: () => _onItemTapped(index),
              behavior: HitTestBehavior.opaque,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 1. Animated Icon Change
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: Icon(
                      displayIcon,
                      key: ValueKey<IconData>(displayIcon),
                      color: isSelected ? const Color(0xFFC67C4E) : Colors.grey,
                      size: 24,
                    ),
                  ),
                  
                  const SizedBox(height: 6),

                  // 2. Animated Underline Indicator
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    height: 4,
                    width: isSelected ? 12 : 0, // Grows when selected
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFFC67C4E) : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
    );
  }

  // Your existing TopNavBar kept intact
  Widget _buildTopNavBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(27, 20, 27, 0),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: const DecorationImage(
                    image: AssetImage('assets/Frame 1194.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi Boluwa,',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Good afternoon',
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}