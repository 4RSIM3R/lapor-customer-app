import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:next_starter/data/models/site/site_model.dart';
import 'package:next_starter/presentation/pages/inquiry/form/inquiry_form_page.dart';
import 'package:next_starter/presentation/pages/profile/main/profile_main_page.dart';
import 'package:next_starter/presentation/pages/profile/site/profile_site_page.dart';
import 'package:next_starter/presentation/pages/profile/unit/profile_unit_page.dart';
import 'package:next_starter/presentation/pages/ticket/detail/ticket_detail_page.dart';
import 'package:next_starter/presentation/pages/ticket/form/ticket_form_page.dart';
import 'package:next_starter/presentation/pages/ticket/list/ticket_list_page.dart';

import '../pages/inquiry/list/inquiry_list_page.dart';
import '../pages/pages.dart';

part 'app_router.gr.dart';

@LazySingleton()
@AutoRouterConfig(
  replaceInRouteName: 'Page|Screen,Route',
)
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, path: '/'),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: OtpRoute.page),
    AutoRoute(page: ChangePasswordRoute.page),
    AutoRoute(page: ForgotPasswordRoute.page),
    // Home
    AutoRoute(
      page: HomeRoute.page,
      children: [
        AutoRoute(page: TicketListRoute.page),
        AutoRoute(page: InquiryListRoute.page),
        AutoRoute(page: ProfileMainRoute.page),
      ],
    ),
    // Ticket
    AutoRoute(page: TicketFormRoute.page),
    AutoRoute(page: TicketDetailRoute.page),
    // Inquiry
    AutoRoute(page: InquiryFormRoute.page),
    // Profile
    AutoRoute(page: ProfileSiteRoute.page),
    AutoRoute(page: ProfileUnitRoute.page),
  ];
}
