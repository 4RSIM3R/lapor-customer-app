import 'package:appflowy_board/appflowy_board.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:next_starter/data/models/ticket/ticket_model.dart';
import 'package:next_starter/presentation/components/button/primary_button.dart';
import 'package:next_starter/presentation/theme/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({
    super.key,
    required this.groupData,
    required this.model,
    required this.onChange,
  });

  final AppFlowyGroupData<dynamic> groupData;
  final TicketModel model;
  final Function(TicketModel model, dynamic status) onChange;

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
            '${model.number}',
            style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text('Action', style: CustomTextTheme.paragraph1),
          const SizedBox(height: 4),
          Text(
            '${model.title}',
            style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text('Employee', style: CustomTextTheme.paragraph1),
          const SizedBox(height: 4),
          Text('${model.employee?.name}', style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600)),
          groupData.id != "ADMIN_APPROVED" ? const SizedBox(height: 8) : const SizedBox.shrink(),
          groupData.id != "ADMIN_APPROVED"
              ? Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      decoration: BoxDecoration(color: ColorTheme.primary, borderRadius: BorderRadius.circular(4)),
                      child: Text(
                        '${model.site?.name}',
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
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Confirmation'),
                            content: const Text('Are your want to cancel this ticket?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  context.router.maybePop();
                                },
                                child: const Text('Cancel', style: TextStyle(color: ColorTheme.primary)),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.router.maybePop();
                                  onChange(model, 'CANCEL');
                                },
                                child: const Text('Okay', style: TextStyle(color: ColorTheme.primary)),
                              ),
                            ],
                          ),
                        );
                      },
                    ).expand(),
                    const SizedBox(width: 4),
                    PrimaryButton(
                      title: 'Accept',
                      isSmall: true,
                      backgroundColor: ColorTheme.primary,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Confirmation'),
                            content: const Text('Are your want to accept this ticket?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  context.router.maybePop();
                                },
                                child: const Text('Cancel', style: TextStyle(color: ColorTheme.primary)),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.router.maybePop();
                                  onChange(model, 'CUSTOMER_APPROVED');
                                },
                                child: const Text('Okay', style: TextStyle(color: ColorTheme.primary)),
                              ),
                            ],
                          ),
                        );
                      },
                    ).expand(),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
