import 'package:auto_route/auto_route.dart';
import 'package:casa_vertical_stepper/casa_vertical_stepper.dart';
import 'package:flutter/material.dart';
import 'package:next_starter/presentation/theme/theme.dart';

@RoutePage()
class TicketDetailPage extends StatefulWidget {
  const TicketDetailPage({super.key});

  @override
  State<TicketDetailPage> createState() => _TicketDetailPageState();
}

class _TicketDetailPageState extends State<TicketDetailPage> {
  final stepperList = [
    StepperStep(
      title: const Text('Account Details'),
      leading: const Icon(Icons.circle),
      view: Container(),
    ),
    StepperStep(
      title: const Text('Account Details'),
      leading: const Icon(Icons.circle),
      view: Container(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Ticket Information'),
      ),
      body: CasaVerticalStepperView(
        steps: stepperList,
        seperatorColor: ColorTheme.primary,
        isExpandable: true,
        showStepStatusWidget: false,
      ),
    );
  }
}
