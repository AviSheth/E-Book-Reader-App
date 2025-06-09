// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(author) => "by ${author}";

  static String m1(error) => "Failed to load PDF: ${error}";

  static String m2(error) => "Login error: ${error}";

  static String m3(currentPage, totalPages) =>
      "Page ${currentPage} of ${totalPages}";

  static String m4(count) => "${count} pages";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("About"),
    "aboutDialogContent": MessageLookupByLibrary.simpleMessage(
      "E-Book Reader is a modern and lightweight app built with Flutter, designed to give you a smooth and distraction-free reading experience.\n\n📚 Key Features:\n- Read ePub and PDF files\n- Dark mode support\n- Bookmark and resume where you left off\n- Simple and elegant interface\n\nWhether you’re reading for fun or learning, E-Book Reader aims to be your go-to app for all your digital books.",
    ),
    "addEbook": MessageLookupByLibrary.simpleMessage("Add Ebook"),
    "addEbookButton": MessageLookupByLibrary.simpleMessage("Add Ebook"),
    "addedToFavorites": MessageLookupByLibrary.simpleMessage(
      "Added to favorites",
    ),
    "adminDashboard": MessageLookupByLibrary.simpleMessage("Admin Dashboard"),
    "adminEmail": MessageLookupByLibrary.simpleMessage("admin"),
    "adminPassword": MessageLookupByLibrary.simpleMessage("admin"),
    "alreadyHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Already have an account?",
    ),
    "author": MessageLookupByLibrary.simpleMessage("Author"),
    "backToLogin": MessageLookupByLibrary.simpleMessage("Back to Login"),
    "bookDetails": MessageLookupByLibrary.simpleMessage("Book Details"),
    "bookId": MessageLookupByLibrary.simpleMessage("Book ID"),
    "bookUrl": MessageLookupByLibrary.simpleMessage("Book URL"),
    "byAuthor": m0,
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "category": MessageLookupByLibrary.simpleMessage("Category"),
    "categoryRequired": MessageLookupByLibrary.simpleMessage(
      "Category is required",
    ),
    "chooseSubscription": MessageLookupByLibrary.simpleMessage(
      "Choose a Subscription Plan",
    ),
    "close": MessageLookupByLibrary.simpleMessage("Close"),
    "contact": MessageLookupByLibrary.simpleMessage("Contact"),
    "contactEmpty": MessageLookupByLibrary.simpleMessage(
      "Please enter your contact number",
    ),
    "contactInvalid": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid contact number",
    ),
    "coverImageUrl": MessageLookupByLibrary.simpleMessage("Cover Image URL"),
    "createAccount": MessageLookupByLibrary.simpleMessage("Create Account"),
    "darkMode": MessageLookupByLibrary.simpleMessage("Dark Mode"),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "deleteConfirmation": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this ebook?",
    ),
    "deleteEbook": MessageLookupByLibrary.simpleMessage("Delete Ebook"),
    "description": MessageLookupByLibrary.simpleMessage("Description"),
    "download": MessageLookupByLibrary.simpleMessage("Download"),
    "downloadUrl": MessageLookupByLibrary.simpleMessage("Download URL"),
    "downloading": MessageLookupByLibrary.simpleMessage("Downloading..."),
    "ebookManagePage": MessageLookupByLibrary.simpleMessage(
      "Ebook Manage Page",
    ),
    "editEbook": MessageLookupByLibrary.simpleMessage("Edit Ebook"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "emailEmpty": MessageLookupByLibrary.simpleMessage(
      "Please enter your email",
    ),
    "emailInvalid": MessageLookupByLibrary.simpleMessage("Enter a valid email"),
    "emailLabel": MessageLookupByLibrary.simpleMessage("Email"),
    "english": MessageLookupByLibrary.simpleMessage("English"),
    "errorUpdatingProfile": MessageLookupByLibrary.simpleMessage(
      "Error updating profile",
    ),
    "failedToLoadPdf": m1,
    "forgotPassword": MessageLookupByLibrary.simpleMessage("Forgot Password?"),
    "french": MessageLookupByLibrary.simpleMessage("Français"),
    "fullName": MessageLookupByLibrary.simpleMessage("Full Name"),
    "fullNameLabel": MessageLookupByLibrary.simpleMessage("Full Name"),
    "german": MessageLookupByLibrary.simpleMessage("German"),
    "gujarati": MessageLookupByLibrary.simpleMessage("Gujarati"),
    "hindi": MessageLookupByLibrary.simpleMessage("Hindi"),
    "invalidCredentials": MessageLookupByLibrary.simpleMessage(
      "Invalid email or password",
    ),
    "invalidPhone": MessageLookupByLibrary.simpleMessage(
      "Enter a valid phone number",
    ),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "languageRequired": MessageLookupByLibrary.simpleMessage(
      "Language is required",
    ),
    "licenseText": MessageLookupByLibrary.simpleMessage(
      "This app is licensed under the MIT License.\n\nCopyright (c) [Year] [Your Name/Company Name]\n\nPermission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \"Software\"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:\n\nThe above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.\n\nTHE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.\n\nFor support or inquiries, please contact [Your Email Address] or visit [Your Website].",
    ),
    "loadingPdf": MessageLookupByLibrary.simpleMessage("Loading PDF..."),
    "loadingUserDataError": MessageLookupByLibrary.simpleMessage(
      "Error loading user data",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "loginButton": MessageLookupByLibrary.simpleMessage("Login"),
    "loginError": m2,
    "manageEbooks": MessageLookupByLibrary.simpleMessage("Manage Ebooks"),
    "month": MessageLookupByLibrary.simpleMessage("month"),
    "monthlyPlan": MessageLookupByLibrary.simpleMessage("Monthly Plan"),
    "nameEmpty": MessageLookupByLibrary.simpleMessage(
      "Please enter your full name",
    ),
    "nameTooLong": MessageLookupByLibrary.simpleMessage(
      "Name cannot exceed 40 characters",
    ),
    "newPassword": MessageLookupByLibrary.simpleMessage("New Password"),
    "noEbooksAdded": MessageLookupByLibrary.simpleMessage(
      "No ebooks added yet.",
    ),
    "noUsersFound": MessageLookupByLibrary.simpleMessage("No users found"),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "openSourceLicenses": MessageLookupByLibrary.simpleMessage(
      "Open Source Licenses",
    ),
    "pageCount": MessageLookupByLibrary.simpleMessage("Page Count"),
    "pageLabel": m3,
    "pagesCount": m4,
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordTooShort": MessageLookupByLibrary.simpleMessage(
      "Password must be at least 6 characters",
    ),
    "passwordUpdateFailed": MessageLookupByLibrary.simpleMessage(
      "Failed to update password. Please try again.",
    ),
    "passwordUpdated": MessageLookupByLibrary.simpleMessage(
      "Password updated successfully!",
    ),
    "passwordsDoNotMatch": MessageLookupByLibrary.simpleMessage(
      "Passwords do not match",
    ),
    "paymentFailed": MessageLookupByLibrary.simpleMessage("Payment Failed"),
    "paymentSuccess": MessageLookupByLibrary.simpleMessage(
      "Payment Successful!",
    ),
    "pdfViewerTitle": MessageLookupByLibrary.simpleMessage("PDF Viewer"),
    "phoneNumberLabel": MessageLookupByLibrary.simpleMessage("Phone Number"),
    "pleaseEnterEmailPassword": MessageLookupByLibrary.simpleMessage(
      "Please enter both email and password",
    ),
    "pleaseEnterName": MessageLookupByLibrary.simpleMessage(
      "Please enter your name",
    ),
    "pleaseEnterNewPassword": MessageLookupByLibrary.simpleMessage(
      "Please enter a new password",
    ),
    "pleaseEnterPhone": MessageLookupByLibrary.simpleMessage(
      "Please enter your phone number",
    ),
    "pleaseEnterValidEmail": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid email",
    ),
    "pleaseEnterYourEmail": MessageLookupByLibrary.simpleMessage(
      "Please enter your email",
    ),
    "pleaseReEnterPassword": MessageLookupByLibrary.simpleMessage(
      "Please re-enter your password",
    ),
    "profileUpdated": MessageLookupByLibrary.simpleMessage(
      "Profile updated successfully!",
    ),
    "reEnterNewPassword": MessageLookupByLibrary.simpleMessage(
      "Re-Enter New Password",
    ),
    "readBook": MessageLookupByLibrary.simpleMessage("Read Book"),
    "refresh": MessageLookupByLibrary.simpleMessage("Refresh"),
    "registrationFailed": MessageLookupByLibrary.simpleMessage(
      "Registration failed!",
    ),
    "registrationSuccessMessage": MessageLookupByLibrary.simpleMessage(
      "Account created successfully!",
    ),
    "registrationSuccessTitle": MessageLookupByLibrary.simpleMessage("Success"),
    "removedFromFavorites": MessageLookupByLibrary.simpleMessage(
      "Removed from favorites",
    ),
    "resetPassword": MessageLookupByLibrary.simpleMessage("Reset Password"),
    "resetPasswordButton": MessageLookupByLibrary.simpleMessage(
      "Reset Password",
    ),
    "selectLanguageTitle": MessageLookupByLibrary.simpleMessage(
      "Select language for the app",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "settingsTitle": MessageLookupByLibrary.simpleMessage("Settings"),
    "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
    "signUpPrompt": MessageLookupByLibrary.simpleMessage(
      "Sign up to get started!",
    ),
    "signupPrompt": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an account?",
    ),
    "statistics": MessageLookupByLibrary.simpleMessage("Statistics"),
    "subscribeNow": MessageLookupByLibrary.simpleMessage("Subscribe Now"),
    "subscribeToContinue": MessageLookupByLibrary.simpleMessage(
      "Please subscribe to continue.",
    ),
    "subscriptionPlans": MessageLookupByLibrary.simpleMessage(
      "Subscription Plans",
    ),
    "subscriptionRequired": MessageLookupByLibrary.simpleMessage(
      "Subscription Required",
    ),
    "title": MessageLookupByLibrary.simpleMessage("Title"),
    "updateButton": MessageLookupByLibrary.simpleMessage("Update Profile"),
    "updateEbookButton": MessageLookupByLibrary.simpleMessage("Update Ebook"),
    "updateFailed": MessageLookupByLibrary.simpleMessage(
      "No changes made or update failed",
    ),
    "updateProfileTitle": MessageLookupByLibrary.simpleMessage(
      "Update Profile",
    ),
    "urlRequired": MessageLookupByLibrary.simpleMessage("URL is required"),
    "userList": MessageLookupByLibrary.simpleMessage("User List"),
    "userNotFound": MessageLookupByLibrary.simpleMessage("User data not found"),
    "year": MessageLookupByLibrary.simpleMessage("year"),
    "yearlyPlan": MessageLookupByLibrary.simpleMessage("Yearly Plan"),
    "zoomIn": MessageLookupByLibrary.simpleMessage("Zoom In"),
    "zoomOut": MessageLookupByLibrary.simpleMessage("Zoom Out"),
  };
}
