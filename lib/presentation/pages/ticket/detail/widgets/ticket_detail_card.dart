import 'package:flutter/material.dart';
import 'package:next_starter/data/models/ticket/ticket_history_model.dart';
import 'package:next_starter/presentation/components/button/primary_button.dart';
import 'package:next_starter/presentation/theme/theme.dart';

class TicketDetailCard extends StatelessWidget {
  const TicketDetailCard({
    super.key,
    required this.history,
  });

  final TicketHistoryModel history;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Action', style: CustomTextTheme.paragraph1),
        const SizedBox(height: 4),
        Text(
          '${history.title}',
          style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Text('Employee', style: CustomTextTheme.paragraph1),
        const SizedBox(height: 4),
        Text('MR John Doe', style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Text('${history.information}', style: CustomTextTheme.paragraph1),
        const SizedBox(height: 8),
        Row(
          children: [
            SizedBox(
              width: 90,
              child: PrimaryButton(
                title: 'See Photos',
                isSmall: true,
                isFullWidth: false,
                onTap: () {},
              ),
            ),
          ],
        )
      ],
    );
  }
}
