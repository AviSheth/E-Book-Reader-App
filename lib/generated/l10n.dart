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

  /// `About`
  String get about {
    return Intl.message('About', name: 'about', desc: '', args: []);
  }

  /// `E-Book Reader is a modern and lightweight app built with Flutter, designed to give you a smooth and distraction-free reading experience.\n\n📚 Key Features:\n- Read ePub and PDF files\n- Dark mode support\n- Bookmark and resume where you left off\n- Simple and elegant interface\n\nWhether you’re reading for fun or learning, E-Book Reader aims to be your go-to app for all your digital books.`
  String get aboutDialogContent {
    return Intl.message(
      'E-Book Reader is a modern and lightweight app built with Flutter, designed to give you a smooth and distraction-free reading experience.\n\n📚 Key Features:\n- Read ePub and PDF files\n- Dark mode support\n- Bookmark and resume where you left off\n- Simple and elegant interface\n\nWhether you’re reading for fun or learning, E-Book Reader aims to be your go-to app for all your digital books.',
      name: 'aboutDialogContent',
      desc: '',
      args: [],
    );
  }

  /// `Add Ebook`
  String get addEbook {
    return Intl.message('Add Ebook', name: 'addEbook', desc: '', args: []);
  }

  /// `Add Ebook`
  String get addEbookButton {
    return Intl.message(
      'Add Ebook',
      name: 'addEbookButton',
      desc: '',
      args: [],
    );
  }

  /// `Admin Dashboard`
  String get adminDashboard {
    return Intl.message(
      'Admin Dashboard',
      name: 'adminDashboard',
      desc: '',
      args: [],
    );
  }

  /// `admin`
  String get adminEmail {
    return Intl.message('admin', name: 'adminEmail', desc: '', args: []);
  }

  /// `admin`
  String get adminPassword {
    return Intl.message('admin', name: 'adminPassword', desc: '', args: []);
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Author`
  String get author {
    return Intl.message('Author', name: 'author', desc: '', args: []);
  }

  /// `Back to Login`
  String get backToLogin {
    return Intl.message(
      'Back to Login',
      name: 'backToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Book ID`
  String get bookId {
    return Intl.message('Book ID', name: 'bookId', desc: '', args: []);
  }

  /// `Book URL`
  String get bookUrl {
    return Intl.message('Book URL', name: 'bookUrl', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Category`
  String get category {
    return Intl.message('Category', name: 'category', desc: '', args: []);
  }

  /// `Category is required`
  String get categoryRequired {
    return Intl.message(
      'Category is required',
      name: 'categoryRequired',
      desc: '',
      args: [],
    );
  }

  /// `Choose a Subscription Plan`
  String get chooseSubscription {
    return Intl.message(
      'Choose a Subscription Plan',
      name: 'chooseSubscription',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message('Close', name: 'close', desc: '', args: []);
  }

  /// `Contact`
  String get contact {
    return Intl.message('Contact', name: 'contact', desc: '', args: []);
  }

  /// `Please enter your contact number`
  String get contactEmpty {
    return Intl.message(
      'Please enter your contact number',
      name: 'contactEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid contact number`
  String get contactInvalid {
    return Intl.message(
      'Please enter a valid contact number',
      name: 'contactInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Cover Image URL`
  String get coverImageUrl {
    return Intl.message(
      'Cover Image URL',
      name: 'coverImageUrl',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message('Dark Mode', name: 'darkMode', desc: '', args: []);
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Are you sure you want to delete this ebook?`
  String get deleteConfirmation {
    return Intl.message(
      'Are you sure you want to delete this ebook?',
      name: 'deleteConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Delete Ebook`
  String get deleteEbook {
    return Intl.message(
      'Delete Ebook',
      name: 'deleteEbook',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Download URL`
  String get downloadUrl {
    return Intl.message(
      'Download URL',
      name: 'downloadUrl',
      desc: '',
      args: [],
    );
  }

  /// `Ebook Manage Page`
  String get ebookManagePage {
    return Intl.message(
      'Ebook Manage Page',
      name: 'ebookManagePage',
      desc: '',
      args: [],
    );
  }

  /// `Edit Ebook`
  String get editEbook {
    return Intl.message('Edit Ebook', name: 'editEbook', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Please enter your email`
  String get emailEmpty {
    return Intl.message(
      'Please enter your email',
      name: 'emailEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email`
  String get emailInvalid {
    return Intl.message(
      'Enter a valid email',
      name: 'emailInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailLabel {
    return Intl.message('Email', name: 'emailLabel', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Error updating profile`
  String get errorUpdatingProfile {
    return Intl.message(
      'Error updating profile',
      name: 'errorUpdatingProfile',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load PDF: {error}`
  String failedToLoadPdf(Object error) {
    return Intl.message(
      'Failed to load PDF: $error',
      name: 'failedToLoadPdf',
      desc: '',
      args: [error],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Français`
  String get french {
    return Intl.message('Français', name: 'french', desc: '', args: []);
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `Full Name`
  String get fullNameLabel {
    return Intl.message('Full Name', name: 'fullNameLabel', desc: '', args: []);
  }

  /// `German`
  String get german {
    return Intl.message('German', name: 'german', desc: '', args: []);
  }

  /// `Gujarati`
  String get gujarati {
    return Intl.message('Gujarati', name: 'gujarati', desc: '', args: []);
  }

  /// `Hindi`
  String get hindi {
    return Intl.message('Hindi', name: 'hindi', desc: '', args: []);
  }

  /// `Invalid email or password`
  String get invalidCredentials {
    return Intl.message(
      'Invalid email or password',
      name: 'invalidCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid phone number`
  String get invalidPhone {
    return Intl.message(
      'Enter a valid phone number',
      name: 'invalidPhone',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Language is required`
  String get languageRequired {
    return Intl.message(
      'Language is required',
      name: 'languageRequired',
      desc: '',
      args: [],
    );
  }

  /// `This app is licensed under the MIT License.\n\nCopyright (c) [Year] [Your Name/Company Name]\n\nPermission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:\n\nThe above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.\n\nTHE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.\n\nFor support or inquiries, please contact [Your Email Address] or visit [Your Website].`
  String get licenseText {
    return Intl.message(
      'This app is licensed under the MIT License.\n\nCopyright (c) [Year] [Your Name/Company Name]\n\nPermission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:\n\nThe above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.\n\nTHE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.\n\nFor support or inquiries, please contact [Your Email Address] or visit [Your Website].',
      name: 'licenseText',
      desc: '',
      args: [],
    );
  }

  /// `Loading PDF...`
  String get loadingPdf {
    return Intl.message(
      'Loading PDF...',
      name: 'loadingPdf',
      desc: '',
      args: [],
    );
  }

  /// `Error loading user data`
  String get loadingUserDataError {
    return Intl.message(
      'Error loading user data',
      name: 'loadingUserDataError',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Login`
  String get loginButton {
    return Intl.message('Login', name: 'loginButton', desc: '', args: []);
  }

  /// `Login error: {error}`
  String loginError(Object error) {
    return Intl.message(
      'Login error: $error',
      name: 'loginError',
      desc: '',
      args: [error],
    );
  }

  /// `Manage Ebooks`
  String get manageEbooks {
    return Intl.message(
      'Manage Ebooks',
      name: 'manageEbooks',
      desc: '',
      args: [],
    );
  }

  /// `month`
  String get month {
    return Intl.message('month', name: 'month', desc: '', args: []);
  }

  /// `Monthly Plan`
  String get monthlyPlan {
    return Intl.message(
      'Monthly Plan',
      name: 'monthlyPlan',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your full name`
  String get nameEmpty {
    return Intl.message(
      'Please enter your full name',
      name: 'nameEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Name cannot exceed 40 characters`
  String get nameTooLong {
    return Intl.message(
      'Name cannot exceed 40 characters',
      name: 'nameTooLong',
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

  /// `No ebooks added yet.`
  String get noEbooksAdded {
    return Intl.message(
      'No ebooks added yet.',
      name: 'noEbooksAdded',
      desc: '',
      args: [],
    );
  }

  /// `No users found`
  String get noUsersFound {
    return Intl.message(
      'No users found',
      name: 'noUsersFound',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message('OK', name: 'ok', desc: '', args: []);
  }

  /// `Open Source Licenses`
  String get openSourceLicenses {
    return Intl.message(
      'Open Source Licenses',
      name: 'openSourceLicenses',
      desc: '',
      args: [],
    );
  }

  /// `Page Count`
  String get pageCount {
    return Intl.message('Page Count', name: 'pageCount', desc: '', args: []);
  }

  /// `Page {currentPage} of {totalPages}`
  String pageLabel(Object currentPage, Object totalPages) {
    return Intl.message(
      'Page $currentPage of $totalPages',
      name: 'pageLabel',
      desc: '',
      args: [currentPage, totalPages],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Password must be at least 6 characters`
  String get passwordTooShort {
    return Intl.message(
      'Password must be at least 6 characters',
      name: 'passwordTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Failed to update password. Please try again.`
  String get passwordUpdateFailed {
    return Intl.message(
      'Failed to update password. Please try again.',
      name: 'passwordUpdateFailed',
      desc: '',
      args: [],
    );
  }

  /// `Password updated successfully!`
  String get passwordUpdated {
    return Intl.message(
      'Password updated successfully!',
      name: 'passwordUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Payment Failed`
  String get paymentFailed {
    return Intl.message(
      'Payment Failed',
      name: 'paymentFailed',
      desc: '',
      args: [],
    );
  }

  /// `Payment Successful!`
  String get paymentSuccess {
    return Intl.message(
      'Payment Successful!',
      name: 'paymentSuccess',
      desc: '',
      args: [],
    );
  }

  /// `PDF Viewer`
  String get pdfViewerTitle {
    return Intl.message(
      'PDF Viewer',
      name: 'pdfViewerTitle',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumberLabel {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumberLabel',
      desc: '',
      args: [],
    );
  }

  /// `Please enter both email and password`
  String get pleaseEnterEmailPassword {
    return Intl.message(
      'Please enter both email and password',
      name: 'pleaseEnterEmailPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get pleaseEnterName {
    return Intl.message(
      'Please enter your name',
      name: 'pleaseEnterName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a new password`
  String get pleaseEnterNewPassword {
    return Intl.message(
      'Please enter a new password',
      name: 'pleaseEnterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number`
  String get pleaseEnterPhone {
    return Intl.message(
      'Please enter your phone number',
      name: 'pleaseEnterPhone',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get pleaseEnterValidEmail {
    return Intl.message(
      'Please enter a valid email',
      name: 'pleaseEnterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get pleaseEnterYourEmail {
    return Intl.message(
      'Please enter your email',
      name: 'pleaseEnterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please re-enter your password`
  String get pleaseReEnterPassword {
    return Intl.message(
      'Please re-enter your password',
      name: 'pleaseReEnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Profile updated successfully!`
  String get profileUpdated {
    return Intl.message(
      'Profile updated successfully!',
      name: 'profileUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Re-Enter New Password`
  String get reEnterNewPassword {
    return Intl.message(
      'Re-Enter New Password',
      name: 'reEnterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Refresh`
  String get refresh {
    return Intl.message('Refresh', name: 'refresh', desc: '', args: []);
  }

  /// `Registration failed!`
  String get registrationFailed {
    return Intl.message(
      'Registration failed!',
      name: 'registrationFailed',
      desc: '',
      args: [],
    );
  }

  /// `Account created successfully!`
  String get registrationSuccessMessage {
    return Intl.message(
      'Account created successfully!',
      name: 'registrationSuccessMessage',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get registrationSuccessTitle {
    return Intl.message(
      'Success',
      name: 'registrationSuccessTitle',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPasswordButton {
    return Intl.message(
      'Reset Password',
      name: 'resetPasswordButton',
      desc: '',
      args: [],
    );
  }

  /// `Select language for the app`
  String get selectLanguageTitle {
    return Intl.message(
      'Select language for the app',
      name: 'selectLanguageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Settings`
  String get settingsTitle {
    return Intl.message('Settings', name: 'settingsTitle', desc: '', args: []);
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Sign up to get started!`
  String get signUpPrompt {
    return Intl.message(
      'Sign up to get started!',
      name: 'signUpPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get signupPrompt {
    return Intl.message(
      'Don\'t have an account?',
      name: 'signupPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Statistics`
  String get statistics {
    return Intl.message('Statistics', name: 'statistics', desc: '', args: []);
  }

  /// `Subscription Plans`
  String get subscriptionPlans {
    return Intl.message(
      'Subscription Plans',
      name: 'subscriptionPlans',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message('Title', name: 'title', desc: '', args: []);
  }

  /// `Update Profile`
  String get updateButton {
    return Intl.message(
      'Update Profile',
      name: 'updateButton',
      desc: '',
      args: [],
    );
  }

  /// `Update Ebook`
  String get updateEbookButton {
    return Intl.message(
      'Update Ebook',
      name: 'updateEbookButton',
      desc: '',
      args: [],
    );
  }

  /// `No changes made or update failed`
  String get updateFailed {
    return Intl.message(
      'No changes made or update failed',
      name: 'updateFailed',
      desc: '',
      args: [],
    );
  }

  /// `Update Profile`
  String get updateProfileTitle {
    return Intl.message(
      'Update Profile',
      name: 'updateProfileTitle',
      desc: '',
      args: [],
    );
  }

  /// `URL is required`
  String get urlRequired {
    return Intl.message(
      'URL is required',
      name: 'urlRequired',
      desc: '',
      args: [],
    );
  }

  /// `User List`
  String get userList {
    return Intl.message('User List', name: 'userList', desc: '', args: []);
  }

  /// `User data not found`
  String get userNotFound {
    return Intl.message(
      'User data not found',
      name: 'userNotFound',
      desc: '',
      args: [],
    );
  }

  /// `year`
  String get year {
    return Intl.message('year', name: 'year', desc: '', args: []);
  }

  /// `Yearly Plan`
  String get yearlyPlan {
    return Intl.message('Yearly Plan', name: 'yearlyPlan', desc: '', args: []);
  }

  /// `Zoom In`
  String get zoomIn {
    return Intl.message('Zoom In', name: 'zoomIn', desc: '', args: []);
  }

  /// `Zoom Out`
  String get zoomOut {
    return Intl.message('Zoom Out', name: 'zoomOut', desc: '', args: []);
  }

  /// `Book Details`
  String get bookDetails {
    return Intl.message(
      'Book Details',
      name: 'bookDetails',
      desc: '',
      args: [],
    );
  }

  /// `by {author}`
  String byAuthor(Object author) {
    return Intl.message(
      'by $author',
      name: 'byAuthor',
      desc: '',
      args: [author],
    );
  }

  /// `{count} pages`
  String pagesCount(Object count) {
    return Intl.message(
      '$count pages',
      name: 'pagesCount',
      desc: '',
      args: [count],
    );
  }

  /// `Downloading...`
  String get downloading {
    return Intl.message(
      'Downloading...',
      name: 'downloading',
      desc: '',
      args: [],
    );
  }

  /// `Download`
  String get download {
    return Intl.message('Download', name: 'download', desc: '', args: []);
  }

  /// `Read Book`
  String get readBook {
    return Intl.message('Read Book', name: 'readBook', desc: '', args: []);
  }

  /// `Added to favorites`
  String get addedToFavorites {
    return Intl.message(
      'Added to favorites',
      name: 'addedToFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Removed from favorites`
  String get removedFromFavorites {
    return Intl.message(
      'Removed from favorites',
      name: 'removedFromFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Subscription Required`
  String get subscriptionRequired {
    return Intl.message(
      'Subscription Required',
      name: 'subscriptionRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please subscribe to continue.`
  String get subscribeToContinue {
    return Intl.message(
      'Please subscribe to continue.',
      name: 'subscribeToContinue',
      desc: '',
      args: [],
    );
  }

  /// `Subscribe Now`
  String get subscribeNow {
    return Intl.message(
      'Subscribe Now',
      name: 'subscribeNow',
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
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'gu'),
      Locale.fromSubtags(languageCode: 'hu'),
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
