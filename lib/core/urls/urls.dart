class Urls {
  Urls._();

  static const String baseUrl = 'http://206.162.244.131:5700/api/v1';

  /// api endpoints
  static const String login = '/auth/login';
  static const String signUp = '/users/register';
  static const String otpVerify = '/otp/verify';
  static const String forgotPassword = '/auth/forgot-password';
  static const String jobs = '/jobs';
  static const String addJob = '/jobs/add-job';
}
