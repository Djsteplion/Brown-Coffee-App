import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFEDEDED),
      body: Center(
        child: Text(
          'No notifications yet',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,)
        ),
      ),
    );
  }
}