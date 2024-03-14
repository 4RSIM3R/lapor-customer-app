import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:next_starter/presentation/theme/theme.dart';

@RoutePage()
class ProfileUnitPage extends StatelessWidget {
  const ProfileUnitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Your Units'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 75,
                  width: 60,
                  decoration: BoxDecoration(
                    color: ColorTheme.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                
              ],
            )
          ],
        ),
      ),
    );
  }
}
