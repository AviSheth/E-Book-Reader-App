// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  static String m0(author) => "par ${author}";

  static String m1(error) => "Échec du chargement du PDF: ${error}";

  static String m2(error) => "Erreur de connexion: ${error}";

  static String m3(currentPage, totalPages) =>
      "Page ${currentPage} sur ${totalPages}";

  static String m4(count) => "${count} pages";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("À propos"),
    "aboutDialogContent": MessageLookupByLibrary.simpleMessage(
      "E-Book Reader est une application moderne et légère développée avec Flutter, conçue pour vous offrir une expérience de lecture fluide et sans interruptions.\n\n📚 Fonctionnalités principales:\n- Lire des fichiers ePub et PDF\n- Support du mode sombre\n- Marque-pages et reprise de la lecture là où vous vous êtes arrêté\n- Interface simple et attrayante\n\nQue vous lisiez pour le plaisir ou pour apprendre, E-Book Reader vise à être l\'application incontournable pour tous vos livres numériques.",
    ),
    "addEbook": MessageLookupByLibrary.simpleMessage("Ajouter un eBook"),
    "addEbookButton": MessageLookupByLibrary.simpleMessage("Ajouter un eBook"),
    "addedToFavorites": MessageLookupByLibrary.simpleMessage(
      "Ajouté aux favoris",
    ),
    "adminDashboard": MessageLookupByLibrary.simpleMessage(
      "Tableau de bord admin",
    ),
    "adminEmail": MessageLookupByLibrary.simpleMessage("Admin"),
    "adminPassword": MessageLookupByLibrary.simpleMessage("Admin"),
    "alreadyHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Vous avez déjà un compte?",
    ),
    "author": MessageLookupByLibrary.simpleMessage("Auteur"),
    "backToLogin": MessageLookupByLibrary.simpleMessage(
      "Retour à la connexion",
    ),
    "bookDetails": MessageLookupByLibrary.simpleMessage("Détails du livre"),
    "bookId": MessageLookupByLibrary.simpleMessage("ID du livre"),
    "bookUrl": MessageLookupByLibrary.simpleMessage("URL du livre"),
    "byAuthor": m0,
    "cancel": MessageLookupByLibrary.simpleMessage("Annuler"),
    "category": MessageLookupByLibrary.simpleMessage("Catégorie"),
    "categoryRequired": MessageLookupByLibrary.simpleMessage(
      "Catégorie requise",
    ),
    "chooseSubscription": MessageLookupByLibrary.simpleMessage(
      "Choisissez un plan d\'abonnement",
    ),
    "close": MessageLookupByLibrary.simpleMessage("Fermer"),
    "contact": MessageLookupByLibrary.simpleMessage("Contact"),
    "contactEmpty": MessageLookupByLibrary.simpleMessage(
      "Veuillez entrer votre numéro de contact",
    ),
    "contactInvalid": MessageLookupByLibrary.simpleMessage(
      "Veuillez entrer un numéro de contact valide",
    ),
    "coverImageUrl": MessageLookupByLibrary.simpleMessage(
      "URL de l\'image de couverture",
    ),
    "createAccount": MessageLookupByLibrary.simpleMessage("Créer un compte"),
    "darkMode": MessageLookupByLibrary.simpleMessage("Mode sombre"),
    "delete": MessageLookupByLibrary.simpleMessage("Supprimer"),
    "deleteConfirmation": MessageLookupByLibrary.simpleMessage(
      "Êtes-vous sûr de vouloir supprimer cet eBook?",
    ),
    "deleteEbook": MessageLookupByLibrary.simpleMessage("Supprimer l\'eBook"),
    "description": MessageLookupByLibrary.simpleMessage("Description"),
    "download": MessageLookupByLibrary.simpleMessage("Télécharger"),
    "downloadUrl": MessageLookupByLibrary.simpleMessage(
      "URL de téléchargement",
    ),
    "downloading": MessageLookupByLibrary.simpleMessage("Téléchargement..."),
    "ebookManagePage": MessageLookupByLibrary.simpleMessage(
      "Page de gestion des eBooks",
    ),
    "editEbook": MessageLookupByLibrary.simpleMessage("Modifier l\'eBook"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "emailEmpty": MessageLookupByLibrary.simpleMessage(
      "Veuillez entrer votre email",
    ),
    "emailInvalid": MessageLookupByLibrary.simpleMessage(
      "Veuillez entrer un email valide",
    ),
    "emailLabel": MessageLookupByLibrary.simpleMessage("Email"),
    "english": MessageLookupByLibrary.simpleMessage("Anglais"),
    "errorUpdatingProfile": MessageLookupByLibrary.simpleMessage(
      "Erreur lors de la mise à jour du profil",
    ),
    "failedToLoadPdf": m1,
    "forgotPassword": MessageLookupByLibrary.simpleMessage(
      "Mot de passe oublié?",
    ),
    "french": MessageLookupByLibrary.simpleMessage("Français"),
    "fullName": MessageLookupByLibrary.simpleMessage("Nom complet"),
    "fullNameLabel": MessageLookupByLibrary.simpleMessage("Nom complet"),
    "german": MessageLookupByLibrary.simpleMessage("Allemand"),
    "gujarati": MessageLookupByLibrary.simpleMessage("Gujarati"),
    "hindi": MessageLookupByLibrary.simpleMessage("Hindi"),
    "invalidCredentials": MessageLookupByLibrary.simpleMessage(
      "Identifiants invalides",
    ),
    "invalidPhone": MessageLookupByLibrary.simpleMessage(
      "Veuillez entrer un numéro de téléphone valide",
    ),
    "language": MessageLookupByLibrary.simpleMessage("Langue"),
    "languageRequired": MessageLookupByLibrary.simpleMessage("Langue requise"),
    "licenseText": MessageLookupByLibrary.simpleMessage(
      "Cette application est sous licence MIT.\n\nCopyright (c) [année] [votre nom/nom de votre entreprise]\n\nIl est permis d\'obtenir une copie de ce logiciel et des fichiers de documentation associés (\"Logiciel\"), de les utiliser, de les copier, de les modifier, de les fusionner, de les publier, de les distribuer, de les sublicencier et/ou de vendre des copies du Logiciel, et de permettre à d\'autres personnes disposant du Logiciel de le faire.",
    ),
    "loadingPdf": MessageLookupByLibrary.simpleMessage("Chargement du PDF..."),
    "loadingUserDataError": MessageLookupByLibrary.simpleMessage(
      "Erreur lors du chargement des données utilisateur",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Se connecter"),
    "loginButton": MessageLookupByLibrary.simpleMessage("Se connecter"),
    "loginError": m2,
    "manageEbooks": MessageLookupByLibrary.simpleMessage("Gérer les eBooks"),
    "month": MessageLookupByLibrary.simpleMessage("Mois"),
    "monthlyPlan": MessageLookupByLibrary.simpleMessage("Plan mensuel"),
    "nameEmpty": MessageLookupByLibrary.simpleMessage(
      "Veuillez entrer votre nom complet",
    ),
    "nameTooLong": MessageLookupByLibrary.simpleMessage(
      "Le nom ne doit pas dépasser 40 caractères",
    ),
    "newPassword": MessageLookupByLibrary.simpleMessage("Nouveau mot de passe"),
    "noEbooksAdded": MessageLookupByLibrary.simpleMessage(
      "Aucun eBook ajouté pour le moment.",
    ),
    "noUsersFound": MessageLookupByLibrary.simpleMessage(
      "Aucun utilisateur trouvé",
    ),
    "ok": MessageLookupByLibrary.simpleMessage("D\'accord"),
    "openSourceLicenses": MessageLookupByLibrary.simpleMessage(
      "Licences Open Source",
    ),
    "pageCount": MessageLookupByLibrary.simpleMessage("Nombre de pages"),
    "pageLabel": m3,
    "pagesCount": m4,
    "password": MessageLookupByLibrary.simpleMessage("Mot de passe"),
    "passwordTooShort": MessageLookupByLibrary.simpleMessage(
      "Le mot de passe doit comporter au moins 6 caractères",
    ),
    "passwordUpdateFailed": MessageLookupByLibrary.simpleMessage(
      "La mise à jour du mot de passe a échoué. Veuillez réessayer.",
    ),
    "passwordUpdated": MessageLookupByLibrary.simpleMessage(
      "Mot de passe mis à jour avec succès!",
    ),
    "passwordsDoNotMatch": MessageLookupByLibrary.simpleMessage(
      "Les mots de passe ne correspondent pas",
    ),
    "paymentFailed": MessageLookupByLibrary.simpleMessage("Échec du paiement"),
    "paymentSuccess": MessageLookupByLibrary.simpleMessage("Paiement réussi!"),
    "pdfViewerTitle": MessageLookupByLibrary.simpleMessage("Lecteur PDF"),
    "phoneNumberLabel": MessageLookupByLibrary.simpleMessage(
      "Numéro de téléphone",
    ),
    "pleaseEnterEmailPassword": MessageLookupByLibrary.simpleMessage(
      "Veuillez entrer l\'email et le mot de passe",
    ),
    "pleaseEnterName": MessageLookupByLibrary.simpleMessage(
      "Veuillez entrer votre nom",
    ),
    "pleaseEnterNewPassword": MessageLookupByLibrary.simpleMessage(
      "Veuillez entrer un nouveau mot de passe",
    ),
    "pleaseEnterPhone": MessageLookupByLibrary.simpleMessage(
      "Veuillez entrer votre numéro de téléphone",
    ),
    "pleaseEnterValidEmail": MessageLookupByLibrary.simpleMessage(
      "Veuillez entrer un email valide",
    ),
    "pleaseEnterYourEmail": MessageLookupByLibrary.simpleMessage(
      "Veuillez entrer votre email",
    ),
    "pleaseReEnterPassword": MessageLookupByLibrary.simpleMessage(
      "Veuillez ressaisir votre mot de passe",
    ),
    "profileUpdated": MessageLookupByLibrary.simpleMessage(
      "Profil mis à jour avec succès!",
    ),
    "reEnterNewPassword": MessageLookupByLibrary.simpleMessage(
      "Ressaisir le nouveau mot de passe",
    ),
    "readBook": MessageLookupByLibrary.simpleMessage("Lire le livre"),
    "refresh": MessageLookupByLibrary.simpleMessage("Rafraîchir"),
    "registrationFailed": MessageLookupByLibrary.simpleMessage(
      "Échec de l\'inscription!",
    ),
    "registrationSuccessMessage": MessageLookupByLibrary.simpleMessage(
      "Compte créé avec succès!",
    ),
    "registrationSuccessTitle": MessageLookupByLibrary.simpleMessage("Succès"),
    "removedFromFavorites": MessageLookupByLibrary.simpleMessage(
      "Supprimé des favoris",
    ),
    "resetPassword": MessageLookupByLibrary.simpleMessage(
      "Réinitialiser le mot de passe",
    ),
    "resetPasswordButton": MessageLookupByLibrary.simpleMessage(
      "Réinitialiser le mot de passe",
    ),
    "selectLanguageTitle": MessageLookupByLibrary.simpleMessage(
      "Choisissez une langue pour l\'application",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Paramètres"),
    "settingsTitle": MessageLookupByLibrary.simpleMessage("Paramètres"),
    "signUp": MessageLookupByLibrary.simpleMessage("S\'inscrire"),
    "signUpPrompt": MessageLookupByLibrary.simpleMessage(
      "Inscrivez-vous pour commencer!",
    ),
    "signupPrompt": MessageLookupByLibrary.simpleMessage(
      "Pas encore de compte?",
    ),
    "statistics": MessageLookupByLibrary.simpleMessage("Statistiques"),
    "subscribeNow": MessageLookupByLibrary.simpleMessage(
      "S\'abonner maintenant",
    ),
    "subscribeToContinue": MessageLookupByLibrary.simpleMessage(
      "Veuillez vous abonner pour continuer.",
    ),
    "subscriptionPlans": MessageLookupByLibrary.simpleMessage(
      "Plans d\'abonnement",
    ),
    "title": MessageLookupByLibrary.simpleMessage("Titre"),
    "updateButton": MessageLookupByLibrary.simpleMessage(
      "Mettre à jour le profil",
    ),
    "updateEbookButton": MessageLookupByLibrary.simpleMessage(
      "Mettre à jour l\'eBook",
    ),
    "updateFailed": MessageLookupByLibrary.simpleMessage(
      "Aucun changement ou échec de la mise à jour",
    ),
    "updateProfileTitle": MessageLookupByLibrary.simpleMessage(
      "Mettre à jour le profil",
    ),
    "urlRequired": MessageLookupByLibrary.simpleMessage("URL requise"),
    "userList": MessageLookupByLibrary.simpleMessage("Liste des utilisateurs"),
    "userNotFound": MessageLookupByLibrary.simpleMessage(
      "Données utilisateur introuvables",
    ),
    "year": MessageLookupByLibrary.simpleMessage("An"),
    "yearlyPlan": MessageLookupByLibrary.simpleMessage("Plan annuel"),
    "zoomIn": MessageLookupByLibrary.simpleMessage("Zoomer"),
    "zoomOut": MessageLookupByLibrary.simpleMessage("Dézoomer"),
  };
}
