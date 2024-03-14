// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ChangePasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ChangePasswordRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChangePasswordPage(
          key: args.key,
          email: args.email,
          otp: args.otp,
        ),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ForgotPasswordPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    InquiryFormRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InquiryFormPage(),
      );
    },
    InquiryListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InquiryListPage(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginPage(
          key: args.key,
          isAddAccount: args.isAddAccount,
        ),
      );
    },
    OtpRoute.name: (routeData) {
      final args = routeData.argsAs<OtpRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OtpPage(
          key: args.key,
          email: args.email,
          isResetPassword: args.isResetPassword,
        ),
      );
    },
    ProfileMainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileMainPage(),
      );
    },
    ProfileSiteRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileSitePage(),
      );
    },
    ProfileUnitRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileUnitPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    TicketDetailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TicketDetailPage(),
      );
    },
    TicketFormRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TicketFormPage(),
      );
    },
    TicketListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TicketListPage(),
      );
    },
  };
}

/// generated route for
/// [ChangePasswordPage]
class ChangePasswordRoute extends PageRouteInfo<ChangePasswordRouteArgs> {
  ChangePasswordRoute({
    Key? key,
    required String email,
    required String otp,
    List<PageRouteInfo>? children,
  }) : super(
          ChangePasswordRoute.name,
          args: ChangePasswordRouteArgs(
            key: key,
            email: email,
            otp: otp,
          ),
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRoute';

  static const PageInfo<ChangePasswordRouteArgs> page =
      PageInfo<ChangePasswordRouteArgs>(name);
}

class ChangePasswordRouteArgs {
  const ChangePasswordRouteArgs({
    this.key,
    required this.email,
    required this.otp,
  });

  final Key? key;

  final String email;

  final String otp;

  @override
  String toString() {
    return 'ChangePasswordRouteArgs{key: $key, email: $email, otp: $otp}';
  }
}

/// generated route for
/// [ForgotPasswordPage]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InquiryFormPage]
class InquiryFormRoute extends PageRouteInfo<void> {
  const InquiryFormRoute({List<PageRouteInfo>? children})
      : super(
          InquiryFormRoute.name,
          initialChildren: children,
        );

  static const String name = 'InquiryFormRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InquiryListPage]
class InquiryListRoute extends PageRouteInfo<void> {
  const InquiryListRoute({List<PageRouteInfo>? children})
      : super(
          InquiryListRoute.name,
          initialChildren: children,
        );

  static const String name = 'InquiryListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    bool isAddAccount = false,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            isAddAccount: isAddAccount,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    this.isAddAccount = false,
  });

  final Key? key;

  final bool isAddAccount;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, isAddAccount: $isAddAccount}';
  }
}

/// generated route for
/// [OtpPage]
class OtpRoute extends PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    Key? key,
    required String email,
    bool isResetPassword = false,
    List<PageRouteInfo>? children,
  }) : super(
          OtpRoute.name,
          args: OtpRouteArgs(
            key: key,
            email: email,
            isResetPassword: isResetPassword,
          ),
          initialChildren: children,
        );

  static const String name = 'OtpRoute';

  static const PageInfo<OtpRouteArgs> page = PageInfo<OtpRouteArgs>(name);
}

class OtpRouteArgs {
  const OtpRouteArgs({
    this.key,
    required this.email,
    this.isResetPassword = false,
  });

  final Key? key;

  final String email;

  final bool isResetPassword;

  @override
  String toString() {
    return 'OtpRouteArgs{key: $key, email: $email, isResetPassword: $isResetPassword}';
  }
}

/// generated route for
/// [ProfileMainPage]
class ProfileMainRoute extends PageRouteInfo<void> {
  const ProfileMainRoute({List<PageRouteInfo>? children})
      : super(
          ProfileMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileMainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileSitePage]
class ProfileSiteRoute extends PageRouteInfo<void> {
  const ProfileSiteRoute({List<PageRouteInfo>? children})
      : super(
          ProfileSiteRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileSiteRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileUnitPage]
class ProfileUnitRoute extends PageRouteInfo<void> {
  const ProfileUnitRoute({List<PageRouteInfo>? children})
      : super(
          ProfileUnitRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileUnitRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TicketDetailPage]
class TicketDetailRoute extends PageRouteInfo<void> {
  const TicketDetailRoute({List<PageRouteInfo>? children})
      : super(
          TicketDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'TicketDetailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TicketFormPage]
class TicketFormRoute extends PageRouteInfo<void> {
  const TicketFormRoute({List<PageRouteInfo>? children})
      : super(
          TicketFormRoute.name,
          initialChildren: children,
        );

  static const String name = 'TicketFormRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TicketListPage]
class TicketListRoute extends PageRouteInfo<void> {
  const TicketListRoute({List<PageRouteInfo>? children})
      : super(
          TicketListRoute.name,
          initialChildren: children,
        );

  static const String name = 'TicketListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
