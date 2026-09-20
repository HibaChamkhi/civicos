import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'CivicOS'**
  String get appTitle;

  /// No description provided for @tabHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get tabHome;

  /// No description provided for @tabMap.
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get tabMap;

  /// No description provided for @tabAct.
  ///
  /// In en, this message translates to:
  /// **'Act'**
  String get tabAct;

  /// No description provided for @tabLearn.
  ///
  /// In en, this message translates to:
  /// **'Learn'**
  String get tabLearn;

  /// No description provided for @tabYou.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get tabYou;

  /// No description provided for @greetingMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get greetingMorning;

  /// No description provided for @greetingAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon'**
  String get greetingAfternoon;

  /// No description provided for @greetingEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening'**
  String get greetingEvening;

  /// No description provided for @homeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Here\'s how you can help around you today.'**
  String get homeSubtitle;

  /// No description provided for @notificationsTooltip.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsTooltip;

  /// No description provided for @settingsTooltip.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTooltip;

  /// No description provided for @homeEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Your neighborhood, at a glance'**
  String get homeEmptyTitle;

  /// No description provided for @homeEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Open issues, volunteer matches and events near you will show up here.'**
  String get homeEmptyBody;

  /// No description provided for @homeEmptyAction.
  ///
  /// In en, this message translates to:
  /// **'Explore the map'**
  String get homeEmptyAction;

  /// No description provided for @mapTitle.
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get mapTitle;

  /// No description provided for @mapEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Your neighborhood map'**
  String get mapEmptyTitle;

  /// No description provided for @mapEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Issues, events and organizations will appear as pins you can tap for details.'**
  String get mapEmptyBody;

  /// No description provided for @mapEmptyAction.
  ///
  /// In en, this message translates to:
  /// **'Browse ways to help'**
  String get mapEmptyAction;

  /// No description provided for @actTitle.
  ///
  /// In en, this message translates to:
  /// **'Act'**
  String get actTitle;

  /// No description provided for @actEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Ways to help, matched to you'**
  String get actEmptyTitle;

  /// No description provided for @actEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Opportunities, missions and events, starting with the ones that fit your skills.'**
  String get actEmptyBody;

  /// No description provided for @actEmptyAction.
  ///
  /// In en, this message translates to:
  /// **'Start learning'**
  String get actEmptyAction;

  /// No description provided for @learnTitle.
  ///
  /// In en, this message translates to:
  /// **'Learn'**
  String get learnTitle;

  /// No description provided for @learnEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Learn something useful in five minutes'**
  String get learnEmptyTitle;

  /// No description provided for @learnEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Short lessons on first aid, sustainability and digital skills, each with a quick quiz.'**
  String get learnEmptyBody;

  /// No description provided for @learnEmptyAction.
  ///
  /// In en, this message translates to:
  /// **'See your profile'**
  String get learnEmptyAction;

  /// No description provided for @youTitle.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get youTitle;

  /// No description provided for @youEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Your impact starts here'**
  String get youEmptyTitle;

  /// No description provided for @youEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Hours, resolved issues and badges add up as you take part.'**
  String get youEmptyBody;

  /// No description provided for @youEmptyAction.
  ///
  /// In en, this message translates to:
  /// **'Appearance settings'**
  String get youEmptyAction;

  /// No description provided for @notificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsTitle;

  /// No description provided for @notificationsEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'You\'re all caught up'**
  String get notificationsEmptyTitle;

  /// No description provided for @notificationsEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'We\'ll tell you when an issue you follow changes or an event you joined is coming up.'**
  String get notificationsEmptyBody;

  /// No description provided for @notificationsEmptyAction.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get notificationsEmptyAction;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsSectionPreferences.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get settingsSectionPreferences;

  /// No description provided for @settingsSectionDeveloper.
  ///
  /// In en, this message translates to:
  /// **'Developer'**
  String get settingsSectionDeveloper;

  /// No description provided for @settingsAppearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get settingsAppearance;

  /// No description provided for @settingsHaptics.
  ///
  /// In en, this message translates to:
  /// **'Haptic feedback'**
  String get settingsHaptics;

  /// No description provided for @settingsHapticsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'A light tap when you switch tabs or confirm an action.'**
  String get settingsHapticsSubtitle;

  /// No description provided for @settingsDesignSystem.
  ///
  /// In en, this message translates to:
  /// **'Design system'**
  String get settingsDesignSystem;

  /// No description provided for @settingsDesignSystemSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Component gallery, shown in development builds only.'**
  String get settingsDesignSystemSubtitle;

  /// No description provided for @appearanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearanceTitle;

  /// No description provided for @appearanceIntro.
  ///
  /// In en, this message translates to:
  /// **'Choose how CivicOS looks on this phone.'**
  String get appearanceIntro;

  /// No description provided for @appearanceSystem.
  ///
  /// In en, this message translates to:
  /// **'Match my phone'**
  String get appearanceSystem;

  /// No description provided for @appearanceSystemSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Switches between light and dark with your phone\'s setting.'**
  String get appearanceSystemSubtitle;

  /// No description provided for @appearanceLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get appearanceLight;

  /// No description provided for @appearanceLightSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Dark text on a pale background.'**
  String get appearanceLightSubtitle;

  /// No description provided for @appearanceDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get appearanceDark;

  /// No description provided for @appearanceDarkSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Light text on a dark background. Easier on the eyes at night.'**
  String get appearanceDarkSubtitle;

  /// No description provided for @offlineBanner.
  ///
  /// In en, this message translates to:
  /// **'You\'re offline. You can keep browsing what\'s already loaded.'**
  String get offlineBanner;

  /// No description provided for @notFoundTitle.
  ///
  /// In en, this message translates to:
  /// **'This page doesn\'t exist'**
  String get notFoundTitle;

  /// No description provided for @notFoundBody.
  ///
  /// In en, this message translates to:
  /// **'The link may be old or mistyped.'**
  String get notFoundBody;

  /// No description provided for @notFoundAction.
  ///
  /// In en, this message translates to:
  /// **'Go to Home'**
  String get notFoundAction;

  /// No description provided for @errorNetwork.
  ///
  /// In en, this message translates to:
  /// **'Can\'t reach CivicOS. Check your connection and try again.'**
  String get errorNetwork;

  /// No description provided for @errorAuth.
  ///
  /// In en, this message translates to:
  /// **'Your session has ended. Sign in again to continue.'**
  String get errorAuth;

  /// No description provided for @errorValidation.
  ///
  /// In en, this message translates to:
  /// **'Some details need fixing. Check the highlighted fields.'**
  String get errorValidation;

  /// No description provided for @errorPermission.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have access to this.'**
  String get errorPermission;

  /// No description provided for @errorNotFound.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t find that. It may have been removed.'**
  String get errorNotFound;

  /// No description provided for @errorRateLimited.
  ///
  /// In en, this message translates to:
  /// **'You\'re going a bit fast. Wait a moment and try again.'**
  String get errorRateLimited;

  /// No description provided for @errorConflict.
  ///
  /// In en, this message translates to:
  /// **'This changed while you were looking at it. Refresh and try again.'**
  String get errorConflict;

  /// No description provided for @errorUnknown.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong on our side. Try again in a moment.'**
  String get errorUnknown;

  /// No description provided for @errorTitle.
  ///
  /// In en, this message translates to:
  /// **'That didn\'t load'**
  String get errorTitle;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get retry;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get loading;

  /// No description provided for @passwordShow.
  ///
  /// In en, this message translates to:
  /// **'Show password'**
  String get passwordShow;

  /// No description provided for @passwordHide.
  ///
  /// In en, this message translates to:
  /// **'Hide password'**
  String get passwordHide;

  /// No description provided for @statusWithStep.
  ///
  /// In en, this message translates to:
  /// **'Status: {label}, step {step} of {total}'**
  String statusWithStep(String label, int step, int total);

  /// No description provided for @statusOnly.
  ///
  /// In en, this message translates to:
  /// **'Status: {label}'**
  String statusOnly(String label);

  /// No description provided for @progressSemantics.
  ///
  /// In en, this message translates to:
  /// **'{label}, {percent} percent'**
  String progressSemantics(String label, int percent);

  /// No description provided for @validationRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required.'**
  String get validationRequired;

  /// No description provided for @validationEmailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Check the email address. It needs an @ and a domain, like name@example.com.'**
  String get validationEmailInvalid;

  /// No description provided for @validationPasswordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Use at least 8 characters.'**
  String get validationPasswordTooShort;

  /// No description provided for @validationPasswordNeedsMix.
  ///
  /// In en, this message translates to:
  /// **'Use at least one letter and one number.'**
  String get validationPasswordNeedsMix;

  /// No description provided for @validationUsernameInvalid.
  ///
  /// In en, this message translates to:
  /// **'Use 3 to 24 lowercase letters, numbers or underscores.'**
  String get validationUsernameInvalid;

  /// No description provided for @validationTooLong.
  ///
  /// In en, this message translates to:
  /// **'That\'s too long. Shorten it a little.'**
  String get validationTooLong;

  /// No description provided for @settingsComfort.
  ///
  /// In en, this message translates to:
  /// **'Reading comfort'**
  String get settingsComfort;

  /// No description provided for @settingsComfortSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Text size, reading font and calm mode.'**
  String get settingsComfortSubtitle;

  /// No description provided for @settingsHapticsOffInCalm.
  ///
  /// In en, this message translates to:
  /// **'Off while calm mode is on.'**
  String get settingsHapticsOffInCalm;

  /// No description provided for @comfortTitle.
  ///
  /// In en, this message translates to:
  /// **'Reading comfort'**
  String get comfortTitle;

  /// No description provided for @comfortIntro.
  ///
  /// In en, this message translates to:
  /// **'Make CivicOS easier to read and calmer to use.'**
  String get comfortIntro;

  /// No description provided for @comfortPreviewLabel.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get comfortPreviewLabel;

  /// No description provided for @comfortPreviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Streetlight out on Rue des Oliviers'**
  String get comfortPreviewTitle;

  /// No description provided for @comfortPreviewBody.
  ///
  /// In en, this message translates to:
  /// **'It\'s been dark since Monday, and the crossing near the school is hard to see after 6 pm.'**
  String get comfortPreviewBody;

  /// No description provided for @comfortPreviewMeta.
  ///
  /// In en, this message translates to:
  /// **'Reported by a neighbor · 18 supporters'**
  String get comfortPreviewMeta;

  /// No description provided for @comfortTextSize.
  ///
  /// In en, this message translates to:
  /// **'Text size'**
  String get comfortTextSize;

  /// No description provided for @comfortTextSizeHint.
  ///
  /// In en, this message translates to:
  /// **'Adds to your phone\'s own text size setting.'**
  String get comfortTextSizeHint;

  /// No description provided for @textSizeSmall.
  ///
  /// In en, this message translates to:
  /// **'Small'**
  String get textSizeSmall;

  /// No description provided for @textSizeStandard.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get textSizeStandard;

  /// No description provided for @textSizeLarge.
  ///
  /// In en, this message translates to:
  /// **'Large'**
  String get textSizeLarge;

  /// No description provided for @textSizeLarger.
  ///
  /// In en, this message translates to:
  /// **'Larger'**
  String get textSizeLarger;

  /// No description provided for @textSizeLargest.
  ///
  /// In en, this message translates to:
  /// **'Largest'**
  String get textSizeLargest;

  /// No description provided for @textSizeValue.
  ///
  /// In en, this message translates to:
  /// **'{name} · {percent}%'**
  String textSizeValue(String name, int percent);

  /// No description provided for @comfortFont.
  ///
  /// In en, this message translates to:
  /// **'Reading font'**
  String get comfortFont;

  /// No description provided for @fontStandard.
  ///
  /// In en, this message translates to:
  /// **'Standard'**
  String get fontStandard;

  /// No description provided for @fontStandardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Clean and friendly. The CivicOS default.'**
  String get fontStandardSubtitle;

  /// No description provided for @fontHyperlegible.
  ///
  /// In en, this message translates to:
  /// **'Extra legible'**
  String get fontHyperlegible;

  /// No description provided for @fontHyperlegibleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Made for low vision. Letters that are easy to mix up, like I, l and 1, look clearly different.'**
  String get fontHyperlegibleSubtitle;

  /// No description provided for @comfortMotionSection.
  ///
  /// In en, this message translates to:
  /// **'Motion and vibration'**
  String get comfortMotionSection;

  /// No description provided for @comfortCalm.
  ///
  /// In en, this message translates to:
  /// **'Calm mode'**
  String get comfortCalm;

  /// No description provided for @comfortCalmSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Turns off movement and vibration everywhere in the app.'**
  String get comfortCalmSubtitle;

  /// No description provided for @comfortReset.
  ///
  /// In en, this message translates to:
  /// **'Reset to defaults'**
  String get comfortReset;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @languageTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageTitle;

  /// No description provided for @languageIntro.
  ///
  /// In en, this message translates to:
  /// **'Choose the language CivicOS uses on this phone.'**
  String get languageIntro;

  /// No description provided for @languageSystem.
  ///
  /// In en, this message translates to:
  /// **'Match my phone'**
  String get languageSystem;

  /// No description provided for @languageSystemSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Uses your phone\'s language when CivicOS supports it.'**
  String get languageSystemSubtitle;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageArabic.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get languageArabic;

  /// No description provided for @sampleDataNotice.
  ///
  /// In en, this message translates to:
  /// **'Sample content. The app connects to the live community in the next step.'**
  String get sampleDataNotice;

  /// No description provided for @timeJustNow.
  ///
  /// In en, this message translates to:
  /// **'just now'**
  String get timeJustNow;

  /// No description provided for @timeMinutesAgo.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 min ago} other{{count} min ago}}'**
  String timeMinutesAgo(int count);

  /// No description provided for @timeHoursAgo.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 h ago} other{{count} h ago}}'**
  String timeHoursAgo(int count);

  /// No description provided for @timeDaysAgo.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{yesterday} other{{count} days ago}}'**
  String timeDaysAgo(int count);

  /// No description provided for @timeWeeksAgo.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{last week} other{{count} weeks ago}}'**
  String timeWeeksAgo(int count);

  /// No description provided for @timeToday.
  ///
  /// In en, this message translates to:
  /// **'today'**
  String get timeToday;

  /// No description provided for @timeTomorrow.
  ///
  /// In en, this message translates to:
  /// **'tomorrow'**
  String get timeTomorrow;

  /// No description provided for @timeInDays.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{tomorrow} other{in {count} days}}'**
  String timeInDays(int count);

  /// No description provided for @timeInWeeks.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{next week} other{in {count} weeks}}'**
  String timeInWeeks(int count);

  /// No description provided for @durationMinutes.
  ///
  /// In en, this message translates to:
  /// **'{count} min'**
  String durationMinutes(int count);

  /// No description provided for @durationHours.
  ///
  /// In en, this message translates to:
  /// **'{count} h'**
  String durationHours(int count);

  /// No description provided for @durationHoursMinutes.
  ///
  /// In en, this message translates to:
  /// **'{hours} h {minutes}'**
  String durationHoursMinutes(int hours, int minutes);

  /// No description provided for @distanceMeters.
  ///
  /// In en, this message translates to:
  /// **'{meters} m'**
  String distanceMeters(int meters);

  /// No description provided for @distanceKilometers.
  ///
  /// In en, this message translates to:
  /// **'{km} km'**
  String distanceKilometers(String km);

  /// No description provided for @statusReported.
  ///
  /// In en, this message translates to:
  /// **'Reported'**
  String get statusReported;

  /// No description provided for @statusUnderReview.
  ///
  /// In en, this message translates to:
  /// **'Under review'**
  String get statusUnderReview;

  /// No description provided for @statusAccepted.
  ///
  /// In en, this message translates to:
  /// **'Accepted'**
  String get statusAccepted;

  /// No description provided for @statusAssigned.
  ///
  /// In en, this message translates to:
  /// **'Assigned'**
  String get statusAssigned;

  /// No description provided for @statusInProgress.
  ///
  /// In en, this message translates to:
  /// **'In progress'**
  String get statusInProgress;

  /// No description provided for @statusResolved.
  ///
  /// In en, this message translates to:
  /// **'Resolved'**
  String get statusResolved;

  /// No description provided for @statusDeclined.
  ///
  /// In en, this message translates to:
  /// **'Declined'**
  String get statusDeclined;

  /// No description provided for @categoryEnvironment.
  ///
  /// In en, this message translates to:
  /// **'Environment'**
  String get categoryEnvironment;

  /// No description provided for @categoryEducation.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get categoryEducation;

  /// No description provided for @categorySocial.
  ///
  /// In en, this message translates to:
  /// **'Social'**
  String get categorySocial;

  /// No description provided for @categoryHealth.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get categoryHealth;

  /// No description provided for @categoryDigital.
  ///
  /// In en, this message translates to:
  /// **'Digital'**
  String get categoryDigital;

  /// No description provided for @topicEnvironment.
  ///
  /// In en, this message translates to:
  /// **'Environment'**
  String get topicEnvironment;

  /// No description provided for @topicFirstAid.
  ///
  /// In en, this message translates to:
  /// **'First aid'**
  String get topicFirstAid;

  /// No description provided for @topicCivic.
  ///
  /// In en, this message translates to:
  /// **'Civic life'**
  String get topicCivic;

  /// No description provided for @topicDigital.
  ///
  /// In en, this message translates to:
  /// **'Digital skills'**
  String get topicDigital;

  /// No description provided for @topicSustainability.
  ///
  /// In en, this message translates to:
  /// **'Sustainability'**
  String get topicSustainability;

  /// No description provided for @topicMoney.
  ///
  /// In en, this message translates to:
  /// **'Money'**
  String get topicMoney;

  /// No description provided for @greetingWithName.
  ///
  /// In en, this message translates to:
  /// **'{greeting}, {name}'**
  String greetingWithName(String greeting, String name);

  /// No description provided for @homeOpenIssues.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{Nothing open near you right now} =1{1 issue is open near you} other{{count} issues are open near you}}'**
  String homeOpenIssues(int count);

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get seeAll;

  /// No description provided for @sectionThisWeek.
  ///
  /// In en, this message translates to:
  /// **'This week'**
  String get sectionThisWeek;

  /// No description provided for @sectionNearYou.
  ///
  /// In en, this message translates to:
  /// **'Open near you'**
  String get sectionNearYou;

  /// No description provided for @sectionMatched.
  ///
  /// In en, this message translates to:
  /// **'Matched to your skills'**
  String get sectionMatched;

  /// No description provided for @sectionMissions.
  ///
  /// In en, this message translates to:
  /// **'Your missions'**
  String get sectionMissions;

  /// No description provided for @sectionUpcoming.
  ///
  /// In en, this message translates to:
  /// **'Coming up'**
  String get sectionUpcoming;

  /// No description provided for @sectionCommunity.
  ///
  /// In en, this message translates to:
  /// **'In your community'**
  String get sectionCommunity;

  /// No description provided for @hoursUnit.
  ///
  /// In en, this message translates to:
  /// **'hours'**
  String get hoursUnit;

  /// No description provided for @levelLine.
  ///
  /// In en, this message translates to:
  /// **'Level {number} · {name}'**
  String levelLine(int number, String name);

  /// No description provided for @xpLine.
  ///
  /// In en, this message translates to:
  /// **'{xp} / {target} XP'**
  String xpLine(String xp, String target);

  /// No description provided for @xpToNextLevel.
  ///
  /// In en, this message translates to:
  /// **'{xp} XP to the next level'**
  String xpToNextLevel(String xp);

  /// No description provided for @levelProgressSemantics.
  ///
  /// In en, this message translates to:
  /// **'Progress to level {number}'**
  String levelProgressSemantics(int number);

  /// No description provided for @supporters.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 supporter} other{{count} supporters}}'**
  String supporters(int count);

  /// No description provided for @reportedBy.
  ///
  /// In en, this message translates to:
  /// **'Reported by {name}'**
  String reportedBy(String name);

  /// No description provided for @reportedByNeighbor.
  ///
  /// In en, this message translates to:
  /// **'Reported by a neighbor'**
  String get reportedByNeighbor;

  /// No description provided for @spotsLeft.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{Full} =1{1 spot left} other{{count} spots left}}'**
  String spotsLeft(int count);

  /// No description provided for @joinedOfNeeded.
  ///
  /// In en, this message translates to:
  /// **'{joined} of {needed} joined'**
  String joinedOfNeeded(int joined, int needed);

  /// No description provided for @matchPercent.
  ///
  /// In en, this message translates to:
  /// **'{percent}% match'**
  String matchPercent(int percent);

  /// No description provided for @remote.
  ///
  /// In en, this message translates to:
  /// **'Remote'**
  String get remote;

  /// No description provided for @difficultyBeginner.
  ///
  /// In en, this message translates to:
  /// **'Beginner'**
  String get difficultyBeginner;

  /// No description provided for @difficultyIntermediate.
  ///
  /// In en, this message translates to:
  /// **'Intermediate'**
  String get difficultyIntermediate;

  /// No description provided for @difficultyAdvanced.
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get difficultyAdvanced;

  /// No description provided for @missionTasksDone.
  ///
  /// In en, this message translates to:
  /// **'{done} of {total} objectives done'**
  String missionTasksDone(int done, int total);

  /// No description provided for @missionReward.
  ///
  /// In en, this message translates to:
  /// **'+{xp} XP'**
  String missionReward(int xp);

  /// No description provided for @missionEnds.
  ///
  /// In en, this message translates to:
  /// **'Ends {when}'**
  String missionEnds(String when);

  /// No description provided for @missionProgressSemantics.
  ///
  /// In en, this message translates to:
  /// **'Mission progress'**
  String get missionProgressSemantics;

  /// No description provided for @taking_part.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 neighbor taking part} other{{count} neighbors taking part}}'**
  String taking_part(int count);

  /// No description provided for @missionJoined.
  ///
  /// In en, this message translates to:
  /// **'Joined'**
  String get missionJoined;

  /// No description provided for @lessonMeta.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min · {questions} questions'**
  String lessonMeta(int minutes, int questions);

  /// No description provided for @lessonReward.
  ///
  /// In en, this message translates to:
  /// **'+{xp} XP'**
  String lessonReward(int xp);

  /// No description provided for @lessonDone.
  ///
  /// In en, this message translates to:
  /// **'Passed'**
  String get lessonDone;

  /// No description provided for @lessonInProgress.
  ///
  /// In en, this message translates to:
  /// **'{percent}% done'**
  String lessonInProgress(int percent);

  /// No description provided for @learnContinue.
  ///
  /// In en, this message translates to:
  /// **'Pick up where you left off'**
  String get learnContinue;

  /// No description provided for @learnAllLessons.
  ///
  /// In en, this message translates to:
  /// **'All lessons'**
  String get learnAllLessons;

  /// No description provided for @eventGoing.
  ///
  /// In en, this message translates to:
  /// **'You\'re going'**
  String get eventGoing;

  /// No description provided for @eventWaitlist.
  ///
  /// In en, this message translates to:
  /// **'On the waitlist'**
  String get eventWaitlist;

  /// No description provided for @eventGoingCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 person going} other{{count} people going}}'**
  String eventGoingCount(int count);

  /// No description provided for @celebrations.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 celebration} other{{count} celebrations}}'**
  String celebrations(int count);

  /// No description provided for @mapListNote.
  ///
  /// In en, this message translates to:
  /// **'Showing the list. The map itself arrives with location support.'**
  String get mapListNote;

  /// No description provided for @filterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get filterAll;

  /// No description provided for @filterIssues.
  ///
  /// In en, this message translates to:
  /// **'Issues'**
  String get filterIssues;

  /// No description provided for @filterVolunteering.
  ///
  /// In en, this message translates to:
  /// **'Volunteering'**
  String get filterVolunteering;

  /// No description provided for @filterEvents.
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get filterEvents;

  /// No description provided for @nearbyEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Nothing matches this filter'**
  String get nearbyEmptyTitle;

  /// No description provided for @nearbyEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Try another filter to see what else is happening around you.'**
  String get nearbyEmptyBody;

  /// No description provided for @actForYou.
  ///
  /// In en, this message translates to:
  /// **'For you'**
  String get actForYou;

  /// No description provided for @actVolunteer.
  ///
  /// In en, this message translates to:
  /// **'Volunteer'**
  String get actVolunteer;

  /// No description provided for @actMissions.
  ///
  /// In en, this message translates to:
  /// **'Missions'**
  String get actMissions;

  /// No description provided for @actEvents.
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get actEvents;

  /// No description provided for @youTrust.
  ///
  /// In en, this message translates to:
  /// **'Trust {score} of 100'**
  String youTrust(int score);

  /// No description provided for @youSkills.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get youSkills;

  /// No description provided for @youInterests.
  ///
  /// In en, this message translates to:
  /// **'Interests'**
  String get youInterests;

  /// No description provided for @youBadges.
  ///
  /// In en, this message translates to:
  /// **'Badges'**
  String get youBadges;

  /// No description provided for @youStats.
  ///
  /// In en, this message translates to:
  /// **'Your impact'**
  String get youStats;

  /// No description provided for @badgeLocked.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get badgeLocked;

  /// No description provided for @statHours.
  ///
  /// In en, this message translates to:
  /// **'Volunteer hours'**
  String get statHours;

  /// No description provided for @statIssuesReported.
  ///
  /// In en, this message translates to:
  /// **'Issues reported'**
  String get statIssuesReported;

  /// No description provided for @statIssuesResolved.
  ///
  /// In en, this message translates to:
  /// **'Issues resolved'**
  String get statIssuesResolved;

  /// No description provided for @statPeopleHelped.
  ///
  /// In en, this message translates to:
  /// **'People helped'**
  String get statPeopleHelped;

  /// No description provided for @statMissions.
  ///
  /// In en, this message translates to:
  /// **'Missions completed'**
  String get statMissions;

  /// No description provided for @statEvents.
  ///
  /// In en, this message translates to:
  /// **'Events attended'**
  String get statEvents;

  /// No description provided for @weekChartSemantics.
  ///
  /// In en, this message translates to:
  /// **'{hours} hours on {day}'**
  String weekChartSemantics(String hours, String day);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
