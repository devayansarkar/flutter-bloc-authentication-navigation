// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "appName" : MessageLookupByLibrary.simpleMessage("Flutter mobile application"),
    "signInButtonName" : MessageLookupByLibrary.simpleMessage("Sign in"),
    "signInEmailHint" : MessageLookupByLibrary.simpleMessage("Your email"),
    "signInFailureTitle" : MessageLookupByLibrary.simpleMessage("Sign in failure"),
    "signInIssueContactUs" : MessageLookupByLibrary.simpleMessage("If you are having issues signing in, please contact technical support team."),
    "signInKnownFailureErrorMessage" : MessageLookupByLibrary.simpleMessage("Please check your username and password and try again."),
    "signInPageTitle" : MessageLookupByLibrary.simpleMessage("Sign in"),
    "signInPasswordHint" : MessageLookupByLibrary.simpleMessage("Your password"),
    "signInUnknownFailureErrorMessage" : MessageLookupByLibrary.simpleMessage("Unable to sign in now. Please try again later."),
    "signOutTitle" : MessageLookupByLibrary.simpleMessage("Sign out"),
    "signUpButtonName" : MessageLookupByLibrary.simpleMessage("Sign up"),
    "signUpEmailHint" : MessageLookupByLibrary.simpleMessage("Your email"),
    "signUpFailureTitle" : MessageLookupByLibrary.simpleMessage("Sign up failure"),
    "signUpHint" : MessageLookupByLibrary.simpleMessage("Do not have an account ? Sign up here."),
    "signUpPageTitle" : MessageLookupByLibrary.simpleMessage("Sign up"),
    "signUpPasswordHint" : MessageLookupByLibrary.simpleMessage("Password"),
    "signUpPasswordMatch" : MessageLookupByLibrary.simpleMessage("Your passwords do not match. Please check again."),
    "signUpPasswordMatchTitle" : MessageLookupByLibrary.simpleMessage("Password mismatch."),
    "signUpPasswordReentryHint" : MessageLookupByLibrary.simpleMessage("Reenter Password"),
    "signUpUnknownFailureErrorMessage" : MessageLookupByLibrary.simpleMessage("Unable to sign up now. Please try again later.")
  };
}
