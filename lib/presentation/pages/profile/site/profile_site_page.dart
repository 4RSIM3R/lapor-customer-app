import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:next_starter/presentation/theme/theme.dart';

@RoutePage()
class ProfileSitePage extends StatelessWidget {
  const ProfileSitePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Your Sites'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: ColorTheme.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.home_repair_service,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Site Name', style: CustomTextTheme.paragraph2),
                    const SizedBox(height: 4),
                    Text('Site Full Address', style: CustomTextTheme.paragraph1),
                    const SizedBox(height: 4),
                    const Row(
                      children: [
                        Chip(
                          label: Text('10 Units'),
                          backgroundColor: Colors.white,
                          side: BorderSide.none,
                        ),
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
