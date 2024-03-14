import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:next_starter/common/extensions/extensions.dart';
import 'package:next_starter/presentation/routes/app_router.dart';
import 'package:next_starter/presentation/theme/theme.dart';

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
        actions: [
          IconButton(
            onPressed: () {
              context.router.push(const InquiryFormRoute());
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            Row(
              children: [
                Chip(
                  backgroundColor: ColorTheme.warning,
                  label: Text('On Review', style: CustomTextTheme.paragraph1.copyWith(color: Colors.white)),
                  side: BorderSide.none,
                ).pOnly(right: 8),
                Chip(
                  backgroundColor: ColorTheme.primary,
                  label: Text('Approved', style: CustomTextTheme.paragraph1.copyWith(color: Colors.white)),
                  side: BorderSide.none,
                ).pOnly(right: 8),
                Chip(
                  backgroundColor: Colors.red,
                  label: Text('Dismiss', style: CustomTextTheme.paragraph1.copyWith(color: Colors.white)),
                  side: BorderSide.none,
                ).pOnly(right: 8),
              ],
            ),
            const SizedBox(height: 16),
            ...List.generate(
              10,
              (index) => Column(
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
                        Text('The question here',
                            style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600)),
                        Text('3h Ago',
                            style:
                                CustomTextTheme.paragraph1.copyWith(color: Colors.grey, fontWeight: FontWeight.w600)),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
