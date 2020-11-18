// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class Content {
  Content();
  
  static Content current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<Content> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      Content.current = Content();
      
      return Content.current;
    });
  } 

  static Content of(BuildContext context) {
    return Localizations.of<Content>(context, Content);
  }

  /// `Flutter mobile application`
  String get appName {
    return Intl.message(
      'Flutter mobile application',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signInPageTitle {
    return Intl.message(
      'Sign in',
      name: 'signInPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your email`
  String get signInEmailHint {
    return Intl.message(
      'Your email',
      name: 'signInEmailHint',
      desc: '',
      args: [],
    );
  }

  /// `Your password`
  String get signInPasswordHint {
    return Intl.message(
      'Your password',
      name: 'signInPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signInButtonName {
    return Intl.message(
      'Sign in',
      name: 'signInButtonName',
      desc: '',
      args: [],
    );
  }

  /// `Sign in failure`
  String get signInFailureTitle {
    return Intl.message(
      'Sign in failure',
      name: 'signInFailureTitle',
      desc: '',
      args: [],
    );
  }

  /// `Unable to sign in now. Please try again later.`
  String get signInUnknownFailureErrorMessage {
    return Intl.message(
      'Unable to sign in now. Please try again later.',
      name: 'signInUnknownFailureErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Please check your username and password and try again.`
  String get signInKnownFailureErrorMessage {
    return Intl.message(
      'Please check your username and password and try again.',
      name: 'signInKnownFailureErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `If you are having issues signing in, please contact technical support team.`
  String get signInIssueContactUs {
    return Intl.message(
      'If you are having issues signing in, please contact technical support team.',
      name: 'signInIssueContactUs',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUpPageTitle {
    return Intl.message(
      'Sign up',
      name: 'signUpPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your email`
  String get signUpEmailHint {
    return Intl.message(
      'Your email',
      name: 'signUpEmailHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get signUpPasswordHint {
    return Intl.message(
      'Password',
      name: 'signUpPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Reenter Password`
  String get signUpPasswordReentryHint {
    return Intl.message(
      'Reenter Password',
      name: 'signUpPasswordReentryHint',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUpButtonName {
    return Intl.message(
      'Sign up',
      name: 'signUpButtonName',
      desc: '',
      args: [],
    );
  }

  /// `Sign up failure`
  String get signUpFailureTitle {
    return Intl.message(
      'Sign up failure',
      name: 'signUpFailureTitle',
      desc: '',
      args: [],
    );
  }

  /// `Unable to sign up now. Please try again later.`
  String get signUpUnknownFailureErrorMessage {
    return Intl.message(
      'Unable to sign up now. Please try again later.',
      name: 'signUpUnknownFailureErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Password mismatch.`
  String get signUpPasswordMatchTitle {
    return Intl.message(
      'Password mismatch.',
      name: 'signUpPasswordMatchTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your passwords do not match. Please check again.`
  String get signUpPasswordMatch {
    return Intl.message(
      'Your passwords do not match. Please check again.',
      name: 'signUpPasswordMatch',
      desc: '',
      args: [],
    );
  }

  /// `Do not have an account ? Sign up here.`
  String get signUpHint {
    return Intl.message(
      'Do not have an account ? Sign up here.',
      name: 'signUpHint',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get signOutTitle {
    return Intl.message(
      'Sign out',
      name: 'signOutTitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Content> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Content> load(Locale locale) => Content.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}