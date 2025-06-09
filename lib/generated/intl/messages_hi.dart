// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a hi locale. All the
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
  String get localeName => 'hi';

  static String m0(author) => "${author} द्वारा";

  static String m1(error) => "PDF लोड करने में विफल: ${error}";

  static String m2(error) => "लॉगिन त्रुटि: ${error}";

  static String m3(currentPage, totalPages) =>
      "पृष्ठ ${currentPage} का ${totalPages}";

  static String m4(count) => "${count} पृष्ठ";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("इस बारे में"),
    "aboutDialogContent": MessageLookupByLibrary.simpleMessage(
      "E-Book Reader एक आधुनिक और हल्का ऐप है जो Flutter के साथ बनाया गया है, जो आपको एक सटीक और निरंतर पढ़ने का अनुभव प्रदान करता है।\n\n📚 मुख्य विशेषताएं:\n- ePub और PDF फ़ाइलें पढ़ें\n- डार्क मोड समर्थन\n- बुकमार्क और जहां छोड़ा था वहां फिर से पढ़ें\n- सरल और सुंदर इंटरफेस\n\nचाहे आप मस्ती के लिए पढ़ रहे हों या सीखने के लिए, E-Book Reader आपकी सभी डिजिटल किताबों के लिए एक प्रमुख ऐप बनने का उद्देश्य है।",
    ),
    "addEbook": MessageLookupByLibrary.simpleMessage("ईबुक जोड़ें"),
    "addEbookButton": MessageLookupByLibrary.simpleMessage("ईबुक जोड़ें"),
    "addedToFavorites": MessageLookupByLibrary.simpleMessage(
      "पसंदीदा में जोड़ा गया",
    ),
    "adminDashboard": MessageLookupByLibrary.simpleMessage("एडमिन डैशबोर्ड"),
    "adminEmail": MessageLookupByLibrary.simpleMessage("एडमिन"),
    "adminPassword": MessageLookupByLibrary.simpleMessage("एडमिन"),
    "alreadyHaveAccount": MessageLookupByLibrary.simpleMessage(
      "पहले से खाता है?",
    ),
    "author": MessageLookupByLibrary.simpleMessage("लेखक"),
    "backToLogin": MessageLookupByLibrary.simpleMessage("लॉगिन पर वापस जाएं"),
    "bookDetails": MessageLookupByLibrary.simpleMessage("पुस्तक विवरण"),
    "bookId": MessageLookupByLibrary.simpleMessage("पुस्तक आईडी"),
    "bookUrl": MessageLookupByLibrary.simpleMessage("पुस्तक URL"),
    "byAuthor": m0,
    "cancel": MessageLookupByLibrary.simpleMessage("रद्द करें"),
    "category": MessageLookupByLibrary.simpleMessage("श्रेणी"),
    "categoryRequired": MessageLookupByLibrary.simpleMessage(
      "श्रेणी आवश्यक है",
    ),
    "chooseSubscription": MessageLookupByLibrary.simpleMessage(
      "सदस्यता योजना चुनें",
    ),
    "close": MessageLookupByLibrary.simpleMessage("बंद करें"),
    "contact": MessageLookupByLibrary.simpleMessage("संपर्क"),
    "contactEmpty": MessageLookupByLibrary.simpleMessage(
      "कृपया अपना संपर्क नंबर दर्ज करें",
    ),
    "contactInvalid": MessageLookupByLibrary.simpleMessage(
      "कृपया एक वैध संपर्क नंबर दर्ज करें",
    ),
    "coverImageUrl": MessageLookupByLibrary.simpleMessage("कवर छवि URL"),
    "createAccount": MessageLookupByLibrary.simpleMessage("खाता बनाएं"),
    "darkMode": MessageLookupByLibrary.simpleMessage("डार्क मोड"),
    "delete": MessageLookupByLibrary.simpleMessage("हटाएं"),
    "deleteConfirmation": MessageLookupByLibrary.simpleMessage(
      "क्या आप वाकई इस ईबुक को हटाना चाहते हैं?",
    ),
    "deleteEbook": MessageLookupByLibrary.simpleMessage("ईबुक हटाएं"),
    "description": MessageLookupByLibrary.simpleMessage("विवरण"),
    "download": MessageLookupByLibrary.simpleMessage("डाउनलोड करें"),
    "downloadUrl": MessageLookupByLibrary.simpleMessage("डाउनलोड URL"),
    "downloading": MessageLookupByLibrary.simpleMessage("डाउनलोड हो रहा है..."),
    "ebookManagePage": MessageLookupByLibrary.simpleMessage(
      "ईबुक प्रबंधन पृष्ठ",
    ),
    "editEbook": MessageLookupByLibrary.simpleMessage("ईबुक संपादित करें"),
    "email": MessageLookupByLibrary.simpleMessage("ईमेल"),
    "emailEmpty": MessageLookupByLibrary.simpleMessage(
      "कृपया अपना ईमेल दर्ज करें",
    ),
    "emailInvalid": MessageLookupByLibrary.simpleMessage(
      "एक वैध ईमेल दर्ज करें",
    ),
    "emailLabel": MessageLookupByLibrary.simpleMessage("ईमेल"),
    "english": MessageLookupByLibrary.simpleMessage("अंग्रेज़ी"),
    "errorUpdatingProfile": MessageLookupByLibrary.simpleMessage(
      "प्रोफ़ाइल अपडेट करते समय त्रुटि",
    ),
    "failedToLoadPdf": m1,
    "forgotPassword": MessageLookupByLibrary.simpleMessage("पासवर्ड भूल गए?"),
    "french": MessageLookupByLibrary.simpleMessage("फ्रेंच"),
    "fullName": MessageLookupByLibrary.simpleMessage("पूरा नाम"),
    "fullNameLabel": MessageLookupByLibrary.simpleMessage("पूरा नाम"),
    "german": MessageLookupByLibrary.simpleMessage("जर्मन"),
    "gujarati": MessageLookupByLibrary.simpleMessage("गुजराती"),
    "hindi": MessageLookupByLibrary.simpleMessage("हिंदी"),
    "invalidCredentials": MessageLookupByLibrary.simpleMessage(
      "अमान्य ईमेल या पासवर्ड",
    ),
    "invalidPhone": MessageLookupByLibrary.simpleMessage(
      "कृपया एक वैध फोन नंबर दर्ज करें",
    ),
    "language": MessageLookupByLibrary.simpleMessage("भाषा"),
    "languageRequired": MessageLookupByLibrary.simpleMessage("भाषा आवश्यक है"),
    "licenseText": MessageLookupByLibrary.simpleMessage(
      "यह ऐप MIT लाइसेंस के तहत लाइसेंस प्राप्त है।\n\nकॉपीराइट (c) [वर्ष] [आपका नाम/कंपनी का नाम]\n\nइस सॉफ़्टवेयर और संबंधित दस्तावेज़ फ़ाइलों (\"सॉफ़्टवेयर\") की एक प्रति प्राप्त करने, सॉफ़्टवेयर में बिना किसी प्रतिबंध के उपयोग करने, कॉपी करने, संशोधित करने, विलय करने, प्रकाशित करने, वितरित करने, उपलाइसेंस देने और/या सॉफ़्टवेयर की नकल बेचने का अधिकार है, और उन व्यक्तियों को अनुमति देने का अधिकार है जिनके पास सॉफ़्टवेयर है।",
    ),
    "loadingPdf": MessageLookupByLibrary.simpleMessage("PDF लोड हो रहा है..."),
    "loadingUserDataError": MessageLookupByLibrary.simpleMessage(
      "उपयोगकर्ता डेटा लोड करने में त्रुटि",
    ),
    "login": MessageLookupByLibrary.simpleMessage("लॉगिन"),
    "loginButton": MessageLookupByLibrary.simpleMessage("लॉगिन करें"),
    "loginError": m2,
    "manageEbooks": MessageLookupByLibrary.simpleMessage("ईबुक प्रबंधित करें"),
    "month": MessageLookupByLibrary.simpleMessage("महीना"),
    "monthlyPlan": MessageLookupByLibrary.simpleMessage("मासिक योजना"),
    "nameEmpty": MessageLookupByLibrary.simpleMessage(
      "कृपया अपना पूरा नाम दर्ज करें",
    ),
    "nameTooLong": MessageLookupByLibrary.simpleMessage(
      "नाम 40 वर्ण से अधिक नहीं हो सकता",
    ),
    "newPassword": MessageLookupByLibrary.simpleMessage("नया पासवर्ड"),
    "noEbooksAdded": MessageLookupByLibrary.simpleMessage(
      "अब तक कोई ईबुक नहीं जोड़ी गई है।",
    ),
    "noUsersFound": MessageLookupByLibrary.simpleMessage(
      "कोई उपयोगकर्ता नहीं मिला",
    ),
    "ok": MessageLookupByLibrary.simpleMessage("ठीक है"),
    "openSourceLicenses": MessageLookupByLibrary.simpleMessage(
      "ओपन सोर्स लाइसेंस",
    ),
    "pageCount": MessageLookupByLibrary.simpleMessage("पृष्ठ गिनती"),
    "pageLabel": m3,
    "pagesCount": m4,
    "password": MessageLookupByLibrary.simpleMessage("पासवर्ड"),
    "passwordTooShort": MessageLookupByLibrary.simpleMessage(
      "पासवर्ड कम से कम 6 वर्ण लंबा होना चाहिए",
    ),
    "passwordUpdateFailed": MessageLookupByLibrary.simpleMessage(
      "पासवर्ड अपडेट करने में विफल। कृपया पुनः प्रयास करें।",
    ),
    "passwordUpdated": MessageLookupByLibrary.simpleMessage(
      "पासवर्ड सफलतापूर्वक अपडेट किया गया!",
    ),
    "passwordsDoNotMatch": MessageLookupByLibrary.simpleMessage(
      "पासवर्ड मेल नहीं खाते",
    ),
    "paymentFailed": MessageLookupByLibrary.simpleMessage("भुगतान विफल"),
    "paymentSuccess": MessageLookupByLibrary.simpleMessage("भुगतान सफल!"),
    "pdfViewerTitle": MessageLookupByLibrary.simpleMessage("PDF व्यूअर"),
    "phoneNumberLabel": MessageLookupByLibrary.simpleMessage("फोन नंबर"),
    "pleaseEnterEmailPassword": MessageLookupByLibrary.simpleMessage(
      "कृपया ईमेल और पासवर्ड दोनों दर्ज करें",
    ),
    "pleaseEnterName": MessageLookupByLibrary.simpleMessage(
      "कृपया अपना नाम दर्ज करें",
    ),
    "pleaseEnterNewPassword": MessageLookupByLibrary.simpleMessage(
      "कृपया नया पासवर्ड दर्ज करें",
    ),
    "pleaseEnterPhone": MessageLookupByLibrary.simpleMessage(
      "कृपया अपना फोन नंबर दर्ज करें",
    ),
    "pleaseEnterValidEmail": MessageLookupByLibrary.simpleMessage(
      "कृपया एक वैध ईमेल दर्ज करें",
    ),
    "pleaseEnterYourEmail": MessageLookupByLibrary.simpleMessage(
      "कृपया अपना ईमेल दर्ज करें",
    ),
    "pleaseReEnterPassword": MessageLookupByLibrary.simpleMessage(
      "कृपया अपना पासवर्ड पुनः दर्ज करें",
    ),
    "profileUpdated": MessageLookupByLibrary.simpleMessage(
      "प्रोफ़ाइल सफलतापूर्वक अपडेट की गई!",
    ),
    "reEnterNewPassword": MessageLookupByLibrary.simpleMessage(
      "नया पासवर्ड पुनः दर्ज करें",
    ),
    "readBook": MessageLookupByLibrary.simpleMessage("पुस्तक पढ़ें"),
    "refresh": MessageLookupByLibrary.simpleMessage("रीफ्रेश करें"),
    "registrationFailed": MessageLookupByLibrary.simpleMessage("पंजीकरण विफल!"),
    "registrationSuccessMessage": MessageLookupByLibrary.simpleMessage(
      "खाता सफलतापूर्वक बनाया गया!",
    ),
    "registrationSuccessTitle": MessageLookupByLibrary.simpleMessage("सफलता"),
    "removedFromFavorites": MessageLookupByLibrary.simpleMessage(
      "पसंदीदा से हटाया गया",
    ),
    "resetPassword": MessageLookupByLibrary.simpleMessage("पासवर्ड रीसेट करें"),
    "resetPasswordButton": MessageLookupByLibrary.simpleMessage(
      "पासवर्ड रीसेट करें",
    ),
    "selectLanguageTitle": MessageLookupByLibrary.simpleMessage(
      "ऐप के लिए भाषा चुनें",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("सेटिंग्स"),
    "settingsTitle": MessageLookupByLibrary.simpleMessage("सेटिंग्स"),
    "signUp": MessageLookupByLibrary.simpleMessage("साइन अप करें"),
    "signUpPrompt": MessageLookupByLibrary.simpleMessage(
      "शुरू करने के लिए साइन अप करें!",
    ),
    "signupPrompt": MessageLookupByLibrary.simpleMessage("खाता नहीं है?"),
    "statistics": MessageLookupByLibrary.simpleMessage("आंकड़े"),
    "subscribeNow": MessageLookupByLibrary.simpleMessage("अब सदस्यता लें"),
    "subscribeToContinue": MessageLookupByLibrary.simpleMessage(
      "आगे बढ़ने के लिए कृपया सदस्यता लें।",
    ),
    "subscriptionPlans": MessageLookupByLibrary.simpleMessage(
      "सदस्यता योजनाएं",
    ),
    "title": MessageLookupByLibrary.simpleMessage("शीर्षक"),
    "updateButton": MessageLookupByLibrary.simpleMessage(
      "प्रोफ़ाइल अपडेट करें",
    ),
    "updateEbookButton": MessageLookupByLibrary.simpleMessage(
      "ईबुक अपडेट करें",
    ),
    "updateFailed": MessageLookupByLibrary.simpleMessage(
      "कोई बदलाव नहीं हुआ या अपडेट विफल",
    ),
    "updateProfileTitle": MessageLookupByLibrary.simpleMessage(
      "प्रोफ़ाइल अपडेट करें",
    ),
    "urlRequired": MessageLookupByLibrary.simpleMessage("URL आवश्यक है"),
    "userList": MessageLookupByLibrary.simpleMessage("उपयोगकर्ता सूची"),
    "userNotFound": MessageLookupByLibrary.simpleMessage(
      "उपयोगकर्ता डेटा नहीं मिला",
    ),
    "year": MessageLookupByLibrary.simpleMessage("वर्ष"),
    "yearlyPlan": MessageLookupByLibrary.simpleMessage("वार्षिक योजना"),
    "zoomIn": MessageLookupByLibrary.simpleMessage("ज़ूम इन"),
    "zoomOut": MessageLookupByLibrary.simpleMessage("ज़ूम आउट"),
  };
}
