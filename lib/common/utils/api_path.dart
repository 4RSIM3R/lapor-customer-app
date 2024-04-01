class ApiPath {
  static const String posts = "posts";

  // Auth
  static const String login = "auth/customer/login";
  static const String register = "register";
  static const String requestOtp = "refresh-otp/";
  static const String resetPassword = "reset-password";
  static const String verifyOtp = "verify-otp/";
  static const String forgotPassword = "forgot-password";

  // Ticket
  static const String ticket = "ticket/customer/get";
  static const String ticketDetail = "ticket/customer/detail";

  // Site
  static const String site = "site/customer/get";

  // Profile
  static const String profile = "profile/customer";
}
