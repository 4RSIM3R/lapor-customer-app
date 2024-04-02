import 'package:flutter/material.dart';
import 'package:next_starter/data/models/inquiry/inquiry_model.dart';
import 'package:next_starter/presentation/theme/theme.dart';
import 'package:timeago/timeago.dart' as timeago;

class InquiryCard extends StatelessWidget {
  const InquiryCard({
    super.key,
    required this.model,
  });

  final InquiryModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          isThreeLine: true,
          titleAlignment: ListTileTitleAlignment.top,
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: ColorTheme.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(child: Icon(Icons.mail, color: Colors.white)),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${model.title}', style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600)),
              Text(
                timeago.format(model.createdAt!),
                style: CustomTextTheme.paragraph1.copyWith(color: Colors.grey, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 2),
              Text(
                '${model.information}',
                style: CustomTextTheme.paragraph1,
              ),
              Row(
                children: [
                  Chip(
                    backgroundColor: ColorTheme.primary,
                    label: Text('${model.status}', style: CustomTextTheme.paragraph1.copyWith(color: Colors.white)),
                    padding: const EdgeInsets.all(4),
                    side: BorderSide.none,
                  ),
                  const SizedBox(width: 8),
                ],
              )
            ],
          ),
        ),
        Divider(color: Colors.grey[200]),
      ],
    );
  }
}
