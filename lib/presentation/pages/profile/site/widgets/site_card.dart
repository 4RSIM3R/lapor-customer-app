import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:next_starter/data/models/site/site_model.dart';
import 'package:next_starter/presentation/routes/app_router.dart';
import 'package:next_starter/presentation/theme/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class SiteCard extends StatelessWidget {
  const SiteCard({super.key, required this.model});

  final SiteModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(ProfileUnitRoute(siteId: model.id!));
      },
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: ColorTheme.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Icon(
                    Icons.home_repair_service,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${model.name}', style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 4),
                  Text('${model.address}', style: CustomTextTheme.paragraph1),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        decoration: BoxDecoration(color: ColorTheme.primary, borderRadius: BorderRadius.circular(4)),
                        child: Text(
                          '10 Units',
                          style: CustomTextTheme.caption.copyWith(color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        decoration: BoxDecoration(color: ColorTheme.primary, borderRadius: BorderRadius.circular(4)),
                        child: Text(
                          '15 Tickets',
                          style: CustomTextTheme.caption.copyWith(color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          Divider(color: Colors.grey[200]).pSymmetric(v: 8),
        ],
      ),
    );
  }
}
