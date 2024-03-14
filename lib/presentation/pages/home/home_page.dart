import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:next_starter/presentation/routes/app_router.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.builder(
      routes: const [
        TicketListRoute(),
        InquiryListRoute(),
        ProfileMainRoute(),
      ],
      builder: (ctx, child, controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(toolbarHeight: 0, elevation: 0),
          body: child[controller.activeIndex],
          bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: true,
            currentIndex: controller.activeIndex,
            onTap: controller.setActiveIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.edit_document), label: 'Ticket'),
              BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Inquiry'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        );
      },
    );
  }
}
