import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class InquiryListPage extends StatelessWidget {
  const InquiryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Inquiry'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
    );
  }
}
