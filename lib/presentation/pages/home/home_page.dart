import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../components/components.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: const BaseAppBar(
        title: 'Posts',
      ),
      body: Center(
        child: PrimaryButton(
          title: "Go to Post Page",
          onTap: () {},
          width: 200,
          isFullWidth: false,
        ),
      ),
    );
  }
}
