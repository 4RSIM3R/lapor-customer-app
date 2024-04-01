import 'package:flutter/material.dart';
import 'package:next_starter/data/models/inquiry/inquiry_model.dart';
import 'package:next_starter/presentation/theme/theme.dart';

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
              Text('The question here', style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600)),
              Text('3h Ago',
                  style: CustomTextTheme.paragraph1.copyWith(color: Colors.grey, fontWeight: FontWeight.w600)),
            ],
          ),
          subtitle: Column(
            children: [
              const SizedBox(height: 2),
              Text(
                'happy to share this notification element which we designed recently for one our client projects',
                style: CustomTextTheme.paragraph1,
              ),
              Row(
                children: [
                  Chip(
                    backgroundColor: ColorTheme.primary,
                    label: Text('Approved', style: CustomTextTheme.paragraph1.copyWith(color: Colors.white)),
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
