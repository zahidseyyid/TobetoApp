import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/education_model.dart';
import 'package:flutter_application_1/pages/announcements_page.dart';
import 'package:flutter_application_1/pages/calendar.dart';
import 'package:flutter_application_1/pages/catalog_page.dart';
import 'package:flutter_application_1/pages/evoluation_page.dart';
import 'package:flutter_application_1/pages/lesson_details_page.dart';
import 'package:flutter_application_1/pages/lessons_page.dart';
import 'package:flutter_application_1/pages/profile.dart';
import 'package:flutter_application_1/pages/profile_edit_page.dart';
import 'package:flutter_application_1/pages/splash_page.dart';

import '../../constants/route_constants.dart';
import '../../pages/home_page.dart';
import '../../pages/sign_in_page.dart';
import '../../pages/sign_up_page.dart';
import '../../pages/auth_control_page.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case annonuncementRoute:
        return MaterialPageRoute(builder: (_) => const AnnouncementsPage());
      case authControlRoute:
        return MaterialPageRoute(builder: (_) => const AuthControlPage());
      case calendarRoute:
        return MaterialPageRoute(builder: (_) => const Calendar());
      case catalogRoute:
        return MaterialPageRoute(builder: (_) => const CatalogPage());
      case evoluationRoute:
        return MaterialPageRoute(builder: (_) => const EvoluationPage());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case lessonRoute:
        return MaterialPageRoute(builder: (_) => const LessonsPage());
      case profileEditRoute:
        return MaterialPageRoute(builder: (_) => const ProfileEditPage());
      case profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case signInRoute:
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashPage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: Text('Ters giden birşeyler oldu'),
            ),
          ),
        );
    }
  }
}