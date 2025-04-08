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
    final name =
        (locale.countryCode?.isEmpty ?? false)
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

  /// `List of Medicines`
  String get page1 {
    return Intl.message('List of Medicines', name: 'page1', desc: '', args: []);
  }

  /// `CRUD Management`
  String get page2 {
    return Intl.message('CRUD Management', name: 'page2', desc: '', args: []);
  }

  /// `Settings`
  String get page3 {
    return Intl.message('Settings', name: 'page3', desc: '', args: []);
  }

  /// `Exit`
  String get exit {
    return Intl.message('Exit', name: 'exit', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Drug name`
  String get name_med {
    return Intl.message('Drug name', name: 'name_med', desc: '', args: []);
  }

  /// `Registration number`
  String get num_reg {
    return Intl.message(
      'Registration number',
      name: 'num_reg',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message('Category', name: 'category', desc: '', args: []);
  }

  /// `Analgesic`
  String get category1 {
    return Intl.message('Analgesic', name: 'category1', desc: '', args: []);
  }

  /// `Antibiotic`
  String get category2 {
    return Intl.message('Antibiotic', name: 'category2', desc: '', args: []);
  }

  /// `Anti-inflamatory`
  String get category3 {
    return Intl.message(
      'Anti-inflamatory',
      name: 'category3',
      desc: '',
      args: [],
    );
  }

  /// `Expiration date`
  String get expiration_date {
    return Intl.message(
      'Expiration date',
      name: 'expiration_date',
      desc: '',
      args: [],
    );
  }

  /// `Creation date`
  String get creation_date {
    return Intl.message(
      'Creation date',
      name: 'creation_date',
      desc: '',
      args: [],
    );
  }

  /// `Laboratory`
  String get laboratory {
    return Intl.message('Laboratory', name: 'laboratory', desc: '', args: []);
  }

  /// `CRN`
  String get cif {
    return Intl.message('CRN', name: 'cif', desc: '', args: []);
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `Price`
  String get price {
    return Intl.message('Price', name: 'price', desc: '', args: []);
  }

  /// `Stock`
  String get stock {
    return Intl.message('Stock', name: 'stock', desc: '', args: []);
  }

  /// `Image`
  String get image {
    return Intl.message('Image', name: 'image', desc: '', args: []);
  }

  /// `New`
  String get nuevo {
    return Intl.message('New', name: 'nuevo', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `delete`
  String get delete {
    return Intl.message('delete', name: 'delete', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `don´t have an account yet? Sign up here.`
  String get no_signup {
    return Intl.message(
      'don´t have an account yet? Sign up here.',
      name: 'no_signup',
      desc: '',
      args: [],
    );
  }

    /// `Already have an account? Sign in.`
  String get no_login{
    return Intl.message(
      'Already have an account? Sign in.',
      name: 'no_login',
      desc: '',
      args: [],
    );
  }


  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Password does not match`
  String get notmatch {
    return Intl.message(
      'Password does not match',
      name: 'notmatch',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get registration {
    return Intl.message(
      'Registration',
      name: 'registration',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Confirm your password`
  String get passwconfirm {
    return Intl.message(
      'Confirm your password',
      name: 'passwconfirm',
      desc: '',
      args: [],
    );
  }

  /// `Sing up`
  String get signup {
    return Intl.message('Sign up', name: 'signup', desc: '', args: []);
  }

    /// `login`
  String get login {
    return Intl.message('login', name: 'login', desc: '', args: []);
  }

  /// `Account`
  String get account {
    return Intl.message('Account', name: 'account', desc: '', args: []);
  }

  /// `Change your password`
  String get passwchange {
    return Intl.message(
      'Change your password',
      name: 'passwchange',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Privacy y security`
  String get privacy {
    return Intl.message(
      'Privacy y security',
      name: 'privacy',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notif {
    return Intl.message('Notifications', name: 'notif', desc: '', args: []);
  }

  /// `Dark Theme`
  String get theme {
    return Intl.message('Dark Theme', name: 'theme', desc: '', args: []);
  }

  /// `Active notifications`
  String get act_notif {
    return Intl.message(
      'Active notifications',
      name: 'act_notif',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message('Close', name: 'close', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
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
