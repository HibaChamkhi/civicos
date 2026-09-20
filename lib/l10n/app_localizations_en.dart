// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'CivicOS';

  @override
  String get tabHome => 'Home';

  @override
  String get tabMap => 'Map';

  @override
  String get tabAct => 'Act';

  @override
  String get tabLearn => 'Learn';

  @override
  String get tabYou => 'You';

  @override
  String get greetingMorning => 'Good morning';

  @override
  String get greetingAfternoon => 'Good afternoon';

  @override
  String get greetingEvening => 'Good evening';

  @override
  String get homeSubtitle => 'Here\'s how you can help around you today.';

  @override
  String get notificationsTooltip => 'Notifications';

  @override
  String get settingsTooltip => 'Settings';

  @override
  String get homeEmptyTitle => 'Your neighborhood, at a glance';

  @override
  String get homeEmptyBody =>
      'Open issues, volunteer matches and events near you will show up here.';

  @override
  String get homeEmptyAction => 'Explore the map';

  @override
  String get mapTitle => 'Map';

  @override
  String get mapEmptyTitle => 'Your neighborhood map';

  @override
  String get mapEmptyBody =>
      'Issues, events and organizations will appear as pins you can tap for details.';

  @override
  String get mapEmptyAction => 'Browse ways to help';

  @override
  String get actTitle => 'Act';

  @override
  String get actEmptyTitle => 'Ways to help, matched to you';

  @override
  String get actEmptyBody =>
      'Opportunities, missions and events, starting with the ones that fit your skills.';

  @override
  String get actEmptyAction => 'Start learning';

  @override
  String get learnTitle => 'Learn';

  @override
  String get learnEmptyTitle => 'Learn something useful in five minutes';

  @override
  String get learnEmptyBody =>
      'Short lessons on first aid, sustainability and digital skills, each with a quick quiz.';

  @override
  String get learnEmptyAction => 'See your profile';

  @override
  String get youTitle => 'You';

  @override
  String get youEmptyTitle => 'Your impact starts here';

  @override
  String get youEmptyBody =>
      'Hours, resolved issues and badges add up as you take part.';

  @override
  String get youEmptyAction => 'Appearance settings';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get notificationsEmptyTitle => 'You\'re all caught up';

  @override
  String get notificationsEmptyBody =>
      'We\'ll tell you when an issue you follow changes or an event you joined is coming up.';

  @override
  String get notificationsEmptyAction => 'Back to Home';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsSectionPreferences => 'Preferences';

  @override
  String get settingsSectionDeveloper => 'Developer';

  @override
  String get settingsAppearance => 'Appearance';

  @override
  String get settingsHaptics => 'Haptic feedback';

  @override
  String get settingsHapticsSubtitle =>
      'A light tap when you switch tabs or confirm an action.';

  @override
  String get settingsDesignSystem => 'Design system';

  @override
  String get settingsDesignSystemSubtitle =>
      'Component gallery, shown in development builds only.';

  @override
  String get appearanceTitle => 'Appearance';

  @override
  String get appearanceIntro => 'Choose how CivicOS looks on this phone.';

  @override
  String get appearanceSystem => 'Match my phone';

  @override
  String get appearanceSystemSubtitle =>
      'Switches between light and dark with your phone\'s setting.';

  @override
  String get appearanceLight => 'Light';

  @override
  String get appearanceLightSubtitle => 'Dark text on a pale background.';

  @override
  String get appearanceDark => 'Dark';

  @override
  String get appearanceDarkSubtitle =>
      'Light text on a dark background. Easier on the eyes at night.';

  @override
  String get offlineBanner =>
      'You\'re offline. You can keep browsing what\'s already loaded.';

  @override
  String get notFoundTitle => 'This page doesn\'t exist';

  @override
  String get notFoundBody => 'The link may be old or mistyped.';

  @override
  String get notFoundAction => 'Go to Home';

  @override
  String get errorNetwork =>
      'Can\'t reach CivicOS. Check your connection and try again.';

  @override
  String get errorAuth => 'Your session has ended. Sign in again to continue.';

  @override
  String get errorValidation =>
      'Some details need fixing. Check the highlighted fields.';

  @override
  String get errorPermission => 'You don\'t have access to this.';

  @override
  String get errorNotFound =>
      'We couldn\'t find that. It may have been removed.';

  @override
  String get errorRateLimited =>
      'You\'re going a bit fast. Wait a moment and try again.';

  @override
  String get errorConflict =>
      'This changed while you were looking at it. Refresh and try again.';

  @override
  String get errorUnknown =>
      'Something went wrong on our side. Try again in a moment.';

  @override
  String get errorTitle => 'That didn\'t load';

  @override
  String get retry => 'Try again';

  @override
  String get loading => 'Loading';

  @override
  String get passwordShow => 'Show password';

  @override
  String get passwordHide => 'Hide password';

  @override
  String statusWithStep(String label, int step, int total) {
    return 'Status: $label, step $step of $total';
  }

  @override
  String statusOnly(String label) {
    return 'Status: $label';
  }

  @override
  String progressSemantics(String label, int percent) {
    return '$label, $percent percent';
  }

  @override
  String get validationRequired => 'This field is required.';

  @override
  String get validationEmailInvalid =>
      'Check the email address. It needs an @ and a domain, like name@example.com.';

  @override
  String get validationPasswordTooShort => 'Use at least 8 characters.';

  @override
  String get validationPasswordNeedsMix =>
      'Use at least one letter and one number.';

  @override
  String get validationUsernameInvalid =>
      'Use 3 to 24 lowercase letters, numbers or underscores.';

  @override
  String get validationTooLong => 'That\'s too long. Shorten it a little.';

  @override
  String get settingsComfort => 'Reading comfort';

  @override
  String get settingsComfortSubtitle =>
      'Text size, reading font and calm mode.';

  @override
  String get settingsHapticsOffInCalm => 'Off while calm mode is on.';

  @override
  String get comfortTitle => 'Reading comfort';

  @override
  String get comfortIntro => 'Make CivicOS easier to read and calmer to use.';

  @override
  String get comfortPreviewLabel => 'Preview';

  @override
  String get comfortPreviewTitle => 'Streetlight out on Rue des Oliviers';

  @override
  String get comfortPreviewBody =>
      'It\'s been dark since Monday, and the crossing near the school is hard to see after 6 pm.';

  @override
  String get comfortPreviewMeta => 'Reported by a neighbor · 18 supporters';

  @override
  String get comfortTextSize => 'Text size';

  @override
  String get comfortTextSizeHint =>
      'Adds to your phone\'s own text size setting.';

  @override
  String get textSizeSmall => 'Small';

  @override
  String get textSizeStandard => 'Default';

  @override
  String get textSizeLarge => 'Large';

  @override
  String get textSizeLarger => 'Larger';

  @override
  String get textSizeLargest => 'Largest';

  @override
  String textSizeValue(String name, int percent) {
    return '$name · $percent%';
  }

  @override
  String get comfortFont => 'Reading font';

  @override
  String get fontStandard => 'Standard';

  @override
  String get fontStandardSubtitle => 'Clean and friendly. The CivicOS default.';

  @override
  String get fontHyperlegible => 'Extra legible';

  @override
  String get fontHyperlegibleSubtitle =>
      'Made for low vision. Letters that are easy to mix up, like I, l and 1, look clearly different.';

  @override
  String get comfortMotionSection => 'Motion and vibration';

  @override
  String get comfortCalm => 'Calm mode';

  @override
  String get comfortCalmSubtitle =>
      'Turns off movement and vibration everywhere in the app.';

  @override
  String get comfortReset => 'Reset to defaults';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get languageTitle => 'Language';

  @override
  String get languageIntro => 'Choose the language CivicOS uses on this phone.';

  @override
  String get languageSystem => 'Match my phone';

  @override
  String get languageSystemSubtitle =>
      'Uses your phone\'s language when CivicOS supports it.';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageArabic => 'العربية';

  @override
  String get sampleDataNotice =>
      'Sample content. The app connects to the live community in the next step.';

  @override
  String get timeJustNow => 'just now';

  @override
  String timeMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count min ago',
      one: '1 min ago',
    );
    return '$_temp0';
  }

  @override
  String timeHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count h ago',
      one: '1 h ago',
    );
    return '$_temp0';
  }

  @override
  String timeDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days ago',
      one: 'yesterday',
    );
    return '$_temp0';
  }

  @override
  String timeWeeksAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count weeks ago',
      one: 'last week',
    );
    return '$_temp0';
  }

  @override
  String get timeToday => 'today';

  @override
  String get timeTomorrow => 'tomorrow';

  @override
  String timeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'in $count days',
      one: 'tomorrow',
    );
    return '$_temp0';
  }

  @override
  String timeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'in $count weeks',
      one: 'next week',
    );
    return '$_temp0';
  }

  @override
  String durationMinutes(int count) {
    return '$count min';
  }

  @override
  String durationHours(int count) {
    return '$count h';
  }

  @override
  String durationHoursMinutes(int hours, int minutes) {
    return '$hours h $minutes';
  }

  @override
  String distanceMeters(int meters) {
    return '$meters m';
  }

  @override
  String distanceKilometers(String km) {
    return '$km km';
  }

  @override
  String get statusReported => 'Reported';

  @override
  String get statusUnderReview => 'Under review';

  @override
  String get statusAccepted => 'Accepted';

  @override
  String get statusAssigned => 'Assigned';

  @override
  String get statusInProgress => 'In progress';

  @override
  String get statusResolved => 'Resolved';

  @override
  String get statusDeclined => 'Declined';

  @override
  String get categoryEnvironment => 'Environment';

  @override
  String get categoryEducation => 'Education';

  @override
  String get categorySocial => 'Social';

  @override
  String get categoryHealth => 'Health';

  @override
  String get categoryDigital => 'Digital';

  @override
  String get topicEnvironment => 'Environment';

  @override
  String get topicFirstAid => 'First aid';

  @override
  String get topicCivic => 'Civic life';

  @override
  String get topicDigital => 'Digital skills';

  @override
  String get topicSustainability => 'Sustainability';

  @override
  String get topicMoney => 'Money';

  @override
  String greetingWithName(String greeting, String name) {
    return '$greeting, $name';
  }

  @override
  String homeOpenIssues(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count issues are open near you',
      one: '1 issue is open near you',
      zero: 'Nothing open near you right now',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'See all';

  @override
  String get sectionThisWeek => 'This week';

  @override
  String get sectionNearYou => 'Open near you';

  @override
  String get sectionMatched => 'Matched to your skills';

  @override
  String get sectionMissions => 'Your missions';

  @override
  String get sectionUpcoming => 'Coming up';

  @override
  String get sectionCommunity => 'In your community';

  @override
  String get hoursUnit => 'hours';

  @override
  String levelLine(int number, String name) {
    return 'Level $number · $name';
  }

  @override
  String xpLine(String xp, String target) {
    return '$xp / $target XP';
  }

  @override
  String xpToNextLevel(String xp) {
    return '$xp XP to the next level';
  }

  @override
  String levelProgressSemantics(int number) {
    return 'Progress to level $number';
  }

  @override
  String supporters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count supporters',
      one: '1 supporter',
    );
    return '$_temp0';
  }

  @override
  String reportedBy(String name) {
    return 'Reported by $name';
  }

  @override
  String get reportedByNeighbor => 'Reported by a neighbor';

  @override
  String spotsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count spots left',
      one: '1 spot left',
      zero: 'Full',
    );
    return '$_temp0';
  }

  @override
  String joinedOfNeeded(int joined, int needed) {
    return '$joined of $needed joined';
  }

  @override
  String matchPercent(int percent) {
    return '$percent% match';
  }

  @override
  String get remote => 'Remote';

  @override
  String get difficultyBeginner => 'Beginner';

  @override
  String get difficultyIntermediate => 'Intermediate';

  @override
  String get difficultyAdvanced => 'Advanced';

  @override
  String missionTasksDone(int done, int total) {
    return '$done of $total objectives done';
  }

  @override
  String missionReward(int xp) {
    return '+$xp XP';
  }

  @override
  String missionEnds(String when) {
    return 'Ends $when';
  }

  @override
  String get missionProgressSemantics => 'Mission progress';

  @override
  String taking_part(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count neighbors taking part',
      one: '1 neighbor taking part',
    );
    return '$_temp0';
  }

  @override
  String get missionJoined => 'Joined';

  @override
  String lessonMeta(int minutes, int questions) {
    return '$minutes min · $questions questions';
  }

  @override
  String lessonReward(int xp) {
    return '+$xp XP';
  }

  @override
  String get lessonDone => 'Passed';

  @override
  String lessonInProgress(int percent) {
    return '$percent% done';
  }

  @override
  String get learnContinue => 'Pick up where you left off';

  @override
  String get learnAllLessons => 'All lessons';

  @override
  String get eventGoing => 'You\'re going';

  @override
  String get eventWaitlist => 'On the waitlist';

  @override
  String eventGoingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count people going',
      one: '1 person going',
    );
    return '$_temp0';
  }

  @override
  String celebrations(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count celebrations',
      one: '1 celebration',
    );
    return '$_temp0';
  }

  @override
  String get mapListNote =>
      'Showing the list. The map itself arrives with location support.';

  @override
  String get filterAll => 'All';

  @override
  String get filterIssues => 'Issues';

  @override
  String get filterVolunteering => 'Volunteering';

  @override
  String get filterEvents => 'Events';

  @override
  String get nearbyEmptyTitle => 'Nothing matches this filter';

  @override
  String get nearbyEmptyBody =>
      'Try another filter to see what else is happening around you.';

  @override
  String get actForYou => 'For you';

  @override
  String get actVolunteer => 'Volunteer';

  @override
  String get actMissions => 'Missions';

  @override
  String get actEvents => 'Events';

  @override
  String youTrust(int score) {
    return 'Trust $score of 100';
  }

  @override
  String get youSkills => 'Skills';

  @override
  String get youInterests => 'Interests';

  @override
  String get youBadges => 'Badges';

  @override
  String get youStats => 'Your impact';

  @override
  String get badgeLocked => 'Locked';

  @override
  String get statHours => 'Volunteer hours';

  @override
  String get statIssuesReported => 'Issues reported';

  @override
  String get statIssuesResolved => 'Issues resolved';

  @override
  String get statPeopleHelped => 'People helped';

  @override
  String get statMissions => 'Missions completed';

  @override
  String get statEvents => 'Events attended';

  @override
  String weekChartSemantics(String hours, String day) {
    return '$hours hours on $day';
  }
}
