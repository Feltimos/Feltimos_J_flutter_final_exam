import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Company Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
            SizedBox(height: 20),
            Text('Company: GlobalTech', style: TextStyle(fontSize: 24)),
            Text('Industry: IT Services', style: TextStyle(fontSize: 18)),
            Text('Employees: 2000', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
