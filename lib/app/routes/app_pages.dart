// ignore_for_file: constant_identifier_names

import 'package:ellidobra_job_portal_app/app/modules/auth/bindings/auth_binding.dart';
import 'package:ellidobra_job_portal_app/app/modules/workerSide/home/bindings/home_binding.dart';
import 'package:ellidobra_job_portal_app/app/modules/workerSide/home/views/Worker_home_view.dart';
import 'package:get/get.dart';

import '../modules/AccountType/bindings/account_type_binding.dart';
import '../modules/AccountType/views/account_type_view.dart';
import '../modules/Notifications/bindings/notifications_binding.dart';
import '../modules/Notifications/views/notifications_view.dart';

import '../modules/auth/views/auth_view.dart';
import '../modules/auth/views/forgotPassword/bindings/forgot_password_binding.dart';
import '../modules/auth/views/forgotPassword/views/change_password.dart';
import '../modules/auth/views/forgotPassword/views/forgot_password_view.dart';
import '../modules/auth/views/forgotPassword/views/otp_verify.dart';

import '../modules/auth/views/login/views/login_view.dart';

import '../modules/auth/views/signup/views/signup_view.dart';
import '../modules/chat/chatscreen/bindings/chatscreen_binding.dart';
import '../modules/chat/chatscreen/views/chatscreen_view.dart';
import '../modules/chat/messageScree/bindings/message_scree_binding.dart';
import '../modules/chat/messageScree/views/message_scree_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/jobOnboarding/bindings/job_onboarding_binding.dart';
import '../modules/jobOnboarding/views/job_onboarding_view.dart';
import '../modules/job_payment/bindings/job_payment_binding.dart';
import '../modules/job_payment/views/job_payment_view.dart';
import '../modules/job_post/bindings/job_post_binding.dart';
import '../modules/job_post/views/job_post_view.dart';
import '../modules/jobs_search/bindings/jobs_binding.dart';
import '../modules/jobs_search/views/jobs_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/profile/editprofile/bindings/editprofile_binding.dart';
import '../modules/profile/editprofile/views/editprofile_view.dart';
import '../modules/profile/employeeprofile/bindings/employeeprofile_binding.dart';
import '../modules/profile/employeeprofile/views/employeeprofile_view.dart';
import '../modules/profile/help/bindings/help_binding.dart';
import '../modules/profile/help/views/help_view.dart';
import '../modules/profile/payment/bindings/payment_binding.dart';
import '../modules/profile/payment/views/payment_view.dart';
import '../modules/profile/privacy/bindings/privacy_binding.dart';
import '../modules/profile/privacy/views/privacy_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/workerSide/EditworkerProfile/bindings/editworker_profile_binding.dart';
import '../modules/workerSide/EditworkerProfile/views/editworker_profile_view.dart';
import '../modules/workerSide/chat/workerMessageScreen/bindings/worker_message_screen_binding.dart';
import '../modules/workerSide/chat/workerMessageScreen/views/worker_message_screen_view.dart';
import '../modules/workerSide/chat/workerchatScreen/bindings/workerchat_screen_binding.dart';
import '../modules/workerSide/chat/workerchatScreen/views/workerchat_screen_view.dart';
import '../modules/workerSide/notifications/Workernotification/bindings/workernotification_binding.dart';
import '../modules/workerSide/notifications/Workernotification/views/workernotification_view.dart';
import '../modules/workerSide/review/bindings/review_binding.dart';
import '../modules/workerSide/review/views/review_view.dart';
import '../modules/workerSide/withdraw/bindings/withdraw_binding.dart';
import '../modules/workerSide/withdraw/views/withdraw_view.dart';
import '../modules/workerSide/workerPayment/bindings/worker_payment_binding.dart';
import '../modules/workerSide/workerPayment/views/worker_payment_view.dart';
import '../modules/workerSide/workerProfile/bindings/worker_profile_binding.dart';
import '../modules/workerSide/workerProfile/views/worker_profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding:AuthBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () =>  ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.OPT_VERIFY,
      page: () => const OptVerifyView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.CHNAGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT_TYPE,
      page: () =>  AccountTypeView(),
      binding: AccountTypeBinding(),
    ),
    GetPage(
      name: _Paths.CHATSCREEN,
      page: () => const ChatscreenView(),
      binding: ChatscreenBinding(),
    ),
    GetPage(
      name: _Paths.MESSAGE_SCREE,
      page: () => const MessageScreeView(),
      binding: MessageScreeBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYEEPROFILE,
      page: () => EmployeeprofileView(),
      binding: EmployeeprofileBinding(),
    ),
    GetPage(
      name: _Paths.EDITPROFILE,
      page: () => EditprofileView(),
      binding: EditprofileBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY,
      page: () => const PrivacyView(),
      binding: PrivacyBinding(),
    ),
    GetPage(
      name: _Paths.HELP,
      page: () => const HelpView(),
      binding: HelpBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => const PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.JOB_POST,
      page: () => const JobPostView(),
      binding: JobPostBinding(),
    ),
    GetPage(
      name: _Paths.JOB_ONBOARDING,
      page: () => const JobOnboardingView(),
      binding: JobOnboardingBinding(),
    ),
    GetPage(
      name: _Paths.JOB_PAYMENT,
      page: () => const JobPaymentView(),
      binding: JobPaymentBinding(),
    ),
    GetPage(
      name: _Paths.JOBS,
      page: () => const JobsView(),
      binding: JobsBinding(),

    ),
    GetPage(
      name: _Paths.WORKER_PROFILE,
      page: () => WorkerProfileView(),
      binding: WorkerProfileBinding(),
    ),
    GetPage(
      name: _Paths.EDITWORKER_PROFILE,
      page: () => EditworkerProfileView(),
      binding: EditworkerProfileBinding(),
    ),
    GetPage(
      name: _Paths.WORKER_PAYMENT,
      page: () => const WorkerPaymentView(),
      binding: WorkerPaymentBinding(),
    ),
    GetPage(
      name: _Paths.WITHDRAW,
      page: () => WithdrawView(),
      binding: WithdrawBinding(),
    ),
    GetPage(
      name: _Paths.REVIEW,
      page: () => ReviewView(),
      binding: ReviewBinding(),
    ),
    GetPage(
      name: _Paths.WORKERCHAT_SCREEN,
      page: () => const WorkerchatScreenView(),
      binding: WorkerchatScreenBinding(),
    ),
    GetPage(
      name: _Paths.WORKER_MESSAGE_SCREEN,
      page: () => const WorkerMessageScreenView(),
      binding: WorkerMessageScreenBinding(),
    ),
    GetPage(
      name: _Paths.WORKERNOTIFICATION,
      page: () => const WorkernotificationView(),
      binding: WorkernotificationBinding(),
    ),
    GetPage(
      name: _Paths.AUTH_VIEW,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.WORKER_HOME,
      page: () =>  WorkerHomeView(),
      binding: WorkerHomeBinding(),
    ),
  ];
}
