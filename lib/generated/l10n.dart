// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

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

  /// `Password`
  String get passwordHint {
    return Intl.message(
      'Password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailHint {
    return Intl.message(
      'Email',
      name: 'emailHint',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginButton {
    return Intl.message(
      'Login',
      name: 'loginButton',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUpButton {
    return Intl.message(
      'Sign up',
      name: 'signUpButton',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Sign up failure`
  String get signUpErrorTitle {
    return Intl.message(
      'Sign up failure',
      name: 'signUpErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign in failure`
  String get signInErrorTitle {
    return Intl.message(
      'Sign in failure',
      name: 'signInErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `No results`
  String get noResults {
    return Intl.message(
      'No results',
      name: 'noResults',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Please Wait...`
  String get pleaseWait {
    return Intl.message(
      'Please Wait...',
      name: 'pleaseWait',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get userNameHint {
    return Intl.message(
      'User Name',
      name: 'userNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Already a user`
  String get alreadyUser {
    return Intl.message(
      'Already a user',
      name: 'alreadyUser',
      desc: '',
      args: [],
    );
  }

  /// `A new user?`
  String get newUser {
    return Intl.message(
      'A new user?',
      name: 'newUser',
      desc: '',
      args: [],
    );
  }

  /// `Successfully signed up, please Sign In`
  String get signupSuccess {
    return Intl.message(
      'Successfully signed up, please Sign In',
      name: 'signupSuccess',
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