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
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome to`
  String get welcome {
    return Intl.message('Welcome to', name: 'welcome', desc: '', args: []);
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `User Name`
  String get userName {
    return Intl.message('User Name', name: 'userName', desc: '', args: []);
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `First Name`
  String get firstName {
    return Intl.message('First Name', name: 'firstName', desc: '', args: []);
  }

  /// `Last Name`
  String get lastName {
    return Intl.message('Last Name', name: 'lastName', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password ?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password ?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?  `
  String get DontHaveAnAccount {
    return Intl.message(
      'Don\'t have an account?  ',
      name: 'DontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get Or {
    return Intl.message('Or', name: 'Or', desc: '', args: []);
  }

  /// `Login with google`
  String get loginWithGoogle {
    return Intl.message(
      'Login with google',
      name: 'loginWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Send Email`
  String get sendEmail {
    return Intl.message('Send Email', name: 'sendEmail', desc: '', args: []);
  }

  /// `Verify Your Email`
  String get verifyYourEmail {
    return Intl.message(
      'Verify Your Email',
      name: 'verifyYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get Continue {
    return Intl.message('Continue', name: 'Continue', desc: '', args: []);
  }

  /// `Resend Code`
  String get ResendCode {
    return Intl.message('Resend Code', name: 'ResendCode', desc: '', args: []);
  }

  /// `Didn't receive any code?`
  String get DidntReceiveAnyCode {
    return Intl.message(
      'Didn\'t receive any code?',
      name: 'DidntReceiveAnyCode',
      desc: '',
      args: [],
    );
  }

  /// `Verify your email to continue`
  String get VerifyYourEmailtoContinue {
    return Intl.message(
      'Verify your email to continue',
      name: 'VerifyYourEmailtoContinue',
      desc: '',
      args: [],
    );
  }

  /// `Enter the 6-digit verification code `
  String get EnterThe6Digit {
    return Intl.message(
      'Enter the 6-digit verification code ',
      name: 'EnterThe6Digit',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email to receive OTP to create a new password via email`
  String get PleaseEnterYourEmail {
    return Intl.message(
      'Please enter your email to receive OTP to create a new password via email',
      name: 'PleaseEnterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Must be at least 8 characters`
  String get passwordRule {
    return Intl.message(
      'Must be at least 8 characters',
      name: 'passwordRule',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Create New Password`
  String get CreateNewPassword {
    return Intl.message(
      'Create New Password',
      name: 'CreateNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm New Password',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email or Password is not correct`
  String get emailOrPasswordIsNotCorrect {
    return Intl.message(
      'Email or Password is not correct',
      name: 'emailOrPasswordIsNotCorrect',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message('Close', name: 'close', desc: '', args: []);
  }

  /// `Search laptops, accessories...`
  String get search {
    return Intl.message(
      'Search laptops, accessories...',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Featured Products`
  String get featuredProducts {
    return Intl.message(
      'Featured Products',
      name: 'featuredProducts',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get ViewAll {
    return Intl.message('View All', name: 'ViewAll', desc: '', args: []);
  }

  /// `Popular`
  String get Popular {
    return Intl.message('Popular', name: 'Popular', desc: '', args: []);
  }

  /// `Shop by Category`
  String get sortBy {
    return Intl.message('Shop by Category', name: 'sortBy', desc: '', args: []);
  }

  /// `Gaming`
  String get Gaming {
    return Intl.message('Gaming', name: 'Gaming', desc: '', args: []);
  }

  /// `Recommended for you`
  String get recommendedForYou {
    return Intl.message(
      'Recommended for you',
      name: 'recommendedForYou',
      desc: '',
      args: [],
    );
  }

  /// `Password reset successfully, login`
  String get passwordResetSuccessfully {
    return Intl.message(
      'Password reset successfully, login',
      name: 'passwordResetSuccessfully',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
