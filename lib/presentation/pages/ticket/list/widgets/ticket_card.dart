import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';
import 'package:next_starter/presentation/components/button/primary_button.dart';
import 'package:next_starter/presentation/theme/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({super.key, required this.groupData});

  final AppFlowyGroupData<dynamic> groupData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 285,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TICKET/12-12-2024/1/KAI',
            style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text('Action', style: CustomTextTheme.paragraph1),
          const SizedBox(height: 4),
          Text(
            'Fixing Broken Pipe In Sector',
            style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text('Employee', style: CustomTextTheme.paragraph1),
          const SizedBox(height: 4),
          Text('MR John Doe', style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600)),
          groupData.id != "ADMIN_APPROVED" ? const SizedBox(height: 8) : const SizedBox.shrink(),
          groupData.id != "ADMIN_APPROVED"
              ? Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      decoration: BoxDecoration(color: ColorTheme.primary, borderRadius: BorderRadius.circular(4)),
                      child: Text(
                        'UNIT_ID_HERE',
                        style: CustomTextTheme.caption.copyWith(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ).expand(),
                    const SizedBox(width: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      decoration: BoxDecoration(color: ColorTheme.primary, borderRadius: BorderRadius.circular(4)),
                      child: Text(
                        'Blok Rokan Hulu Riau',
                        style: CustomTextTheme.caption.copyWith(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ).expand(),
                  ],
                )
              : Container(),
          groupData.id == "ADMIN_APPROVED" ? const SizedBox(height: 8) : const SizedBox.shrink(),
          groupData.id == "ADMIN_APPROVED"
              ? Row(
                  children: [
                    PrimaryButton(
                      title: 'Reject',
                      isSmall: true,
                      backgroundColor: Colors.red,
                      onTap: () {},
                    ).expand(),
                    const SizedBox(width: 4),
                    PrimaryButton(
                      title: 'Accept',
                      isSmall: true,
                      backgroundColor: ColorTheme.primary,
                      onTap: () {},
                    ).expand(),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
