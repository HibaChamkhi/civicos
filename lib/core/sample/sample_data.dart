import 'package:civicos/features/community/domain/feed_item.dart';
import 'package:civicos/features/events/domain/community_event.dart';
import 'package:civicos/features/impact/domain/impact_summary.dart';
import 'package:civicos/features/issues/domain/issue.dart';
import 'package:civicos/features/learning/domain/lesson.dart';
import 'package:civicos/features/missions/domain/mission.dart';
import 'package:civicos/features/profile/domain/profile_summary.dart';
import 'package:civicos/features/volunteering/domain/opportunity.dart';

/// Stand-in content so every screen shows a real, working layout before the
/// Supabase backend exists (Step 2). The repositories that serve it are the
/// same interfaces the server will implement, so only the data source
/// changes later. The UI labels this content as sample data.
///
/// Each item carries English and Arabic wording. Real content will arrive
/// from the server in whatever language a neighbor wrote it; this keeps the
/// demo readable in both languages.
abstract final class SampleData {
  /// Small delay so loading states and skeletons are exercised for real.
  static const latency = Duration(milliseconds: 350);

  static DateTime _daysAgo(int days) =>
      DateTime.now().subtract(Duration(days: days));

  static DateTime _hoursAgo(int hours) =>
      DateTime.now().subtract(Duration(hours: hours));

  static DateTime _inDays(int days, {int atHour = 9}) {
    final now = DateTime.now();
    final day = DateTime(
      now.year,
      now.month,
      now.day,
    ).add(Duration(days: days));
    return DateTime(day.year, day.month, day.day, atHour);
  }

  static ProfileSummary profile({bool arabic = false}) {
    String t(String en, String ar) => arabic ? ar : en;
    return ProfileSummary(
      displayName: t('Amine Ben Salah', 'أمين بن صالح'),
      neighborhood: t('El Menzah', 'المنزه'),
      city: t('Tunis', 'تونس'),
      skills: arabic
          ? const ['Flutter', 'تصميم جرافيك', 'التدريس', 'الإنجليزية']
          : const ['Flutter', 'Graphic design', 'Teaching', 'English'],
      interests: arabic
          ? const ['البيئة', 'التعليم', 'المهارات الرقمية']
          : const ['Environment', 'Education', 'Digital literacy'],
      memberSince: _daysAgo(214),
      trustScore: 78,
    );
  }

  static List<Issue> issues({bool arabic = false}) {
    String t(String en, String ar) => arabic ? ar : en;
    return [
      Issue(
        id: 'iss-1',
        title: t(
          'Streetlight out on Rue des Oliviers',
          'عمود إنارة معطّل في شارع الزياتين',
        ),
        summary: t(
          "It's been dark since Monday, and the crossing near the school is "
              'hard to see after 6 pm.',
          'المكان مظلم منذ الاثنين، ومعبر المشاة قرب المدرسة يصعب رؤيته بعد '
              'السادسة مساءً.',
        ),
        category: IssueCategory.lighting,
        status: IssueStatus.inProgress,
        urgency: IssueUrgency.medium,
        placeName: t('Rue des Oliviers', 'شارع الزياتين'),
        distanceMeters: 320,
        reportedAt: _daysAgo(2),
        supporters: 18,
      ),
      Issue(
        id: 'iss-2',
        title: t(
          'Illegal dumping behind the market',
          'رمي نفايات خلف السوق',
        ),
        summary: t(
          'Bags of construction waste have been left against the back wall '
              'for over a week.',
          'أكياس من مخلفات البناء تُركت قرب الجدار الخلفي منذ أكثر من أسبوع.',
        ),
        category: IssueCategory.waste,
        status: IssueStatus.underReview,
        urgency: IssueUrgency.high,
        placeName: t('Marché central', 'السوق المركزي'),
        distanceMeters: 650,
        reportedAt: _hoursAgo(5),
        supporters: 31,
        reporterName: t('Sara K.', 'سارة ك.'),
      ),
      Issue(
        id: 'iss-3',
        title: t(
          'Broken ramp at the health centre',
          'منحدر معطّل في المركز الصحي',
        ),
        summary: t(
          'The wheelchair ramp handrail is loose, so the side entrance is the '
              'only safe way in.',
          'مقبض منحدر الكراسي المتحركة مفكوك، والمدخل الجانبي هو الطريق الآمن '
              'الوحيد.',
        ),
        category: IssueCategory.accessibility,
        status: IssueStatus.accepted,
        urgency: IssueUrgency.high,
        placeName: t('Centre de santé', 'المركز الصحي'),
        distanceMeters: 900,
        reportedAt: _daysAgo(1),
        supporters: 24,
        reporterName: t('Mehdi T.', 'مهدي ت.'),
      ),
      Issue(
        id: 'iss-4',
        title: t('Pothole on Avenue Habib', 'حفرة في شارع الحبيب'),
        summary: t(
          'Deep enough that scooters swerve into the bus lane.',
          'عميقة لدرجة أن الدراجات تنحرف إلى مسار الحافلات.',
        ),
        category: IssueCategory.road,
        status: IssueStatus.assigned,
        urgency: IssueUrgency.medium,
        placeName: t('Avenue Habib', 'شارع الحبيب'),
        distanceMeters: 1200,
        reportedAt: _daysAgo(3),
        supporters: 12,
      ),
      Issue(
        id: 'iss-5',
        title: t(
          'Water leak near the school gate',
          'تسرّب مياه قرب بوابة المدرسة',
        ),
        summary: t(
          'Fixed by the water utility four days after it was accepted.',
          'أصلحته شركة المياه بعد أربعة أيام من قبول البلاغ.',
        ),
        category: IssueCategory.water,
        status: IssueStatus.resolved,
        urgency: IssueUrgency.low,
        placeName: t(
          'École primaire El Menzah',
          'المدرسة الابتدائية بالمنزه',
        ),
        distanceMeters: 400,
        reportedAt: _daysAgo(9),
        supporters: 40,
        reporterName: t('Amine Ben Salah', 'أمين بن صالح'),
      ),
    ];
  }

  static List<Opportunity> opportunities({bool arabic = false}) {
    String t(String en, String ar) => arabic ? ar : en;
    return [
      Opportunity(
        id: 'opp-1',
        title: t(
          'Build a website for a youth club',
          'تصميم موقع لنادي شباب',
        ),
        organizationName: t(
          'Club des Jeunes El Menzah',
          'نادي شباب المنزه',
        ),
        summary: t(
          'Three evenings to put together a simple site so families can find '
              'the club timetable.',
          'ثلاث أمسيات لإنشاء موقع بسيط يجد فيه الأهالي جدول النادي.',
        ),
        category: ImpactCategory.digital,
        difficulty: Difficulty.intermediate,
        startsAt: _inDays(4, atHour: 18),
        durationMinutes: 360,
        placeName: t('Remote', 'عن بُعد'),
        volunteersNeeded: 2,
        volunteersJoined: 1,
        skills: const ['Flutter'],
        matchScore: 0.94,
        matchReason: t(
          'You have Flutter and Graphic design',
          'لديك Flutter وتصميم جرافيك',
        ),
        isRemote: true,
      ),
      Opportunity(
        id: 'opp-2',
        title: t('Beach cleanup at Plage Nord', 'حملة تنظيف شاطئ الشمال'),
        organizationName: t(
          'Green Shore Association',
          'جمعية الشاطئ الأخضر',
        ),
        summary: t(
          'Gloves and bags provided. Bring water and closed shoes; we finish '
              'with a shared breakfast.',
          'القفازات والأكياس متوفرة. أحضر ماءً وحذاءً مغلقًا، ونختم بفطور '
              'جماعي.',
        ),
        category: ImpactCategory.environment,
        difficulty: Difficulty.beginner,
        startsAt: _inDays(2),
        durationMinutes: 180,
        placeName: t('Plage Nord', 'شاطئ الشمال'),
        volunteersNeeded: 25,
        volunteersJoined: 18,
        skills: const [],
        matchScore: 0.86,
        matchReason: t(
          'Matches your interest in Environment',
          'يناسب اهتمامك بالبيئة',
        ),
      ),
      Opportunity(
        id: 'opp-3',
        title: t(
          'Tutor maths, two evenings a week',
          'دروس دعم في الرياضيات مساءين أسبوعيًا',
        ),
        organizationName: t('Lycée Ibn Khaldoun', 'معهد ابن خلدون'),
        summary: t(
          'Small groups of year-9 students preparing for their end-of-term '
              'exams.',
          'مجموعات صغيرة من تلاميذ التاسعة يستعدون لامتحانات آخر الثلاثي.',
        ),
        category: ImpactCategory.education,
        difficulty: Difficulty.beginner,
        startsAt: _inDays(5, atHour: 18),
        durationMinutes: 120,
        placeName: t('Lycée Ibn Khaldoun', 'معهد ابن خلدون'),
        volunteersNeeded: 6,
        volunteersJoined: 4,
        skills: const [],
        matchScore: 0.78,
        matchReason: t(
          'You have Teaching and volunteered in Education before',
          'لديك مهارة التدريس وسبق أن تطوّعت في التعليم',
        ),
      ),
      Opportunity(
        id: 'opp-4',
        title: t(
          'Sort donations at the food bank',
          'فرز التبرّعات في بنك الطعام',
        ),
        organizationName: t('Banque Alimentaire', 'بنك الطعام'),
        summary: t(
          'Sorting and packing boxes for weekly distribution.',
          'فرز وتعبئة الطرود للتوزيع الأسبوعي.',
        ),
        category: ImpactCategory.social,
        difficulty: Difficulty.beginner,
        startsAt: _inDays(6, atHour: 10),
        durationMinutes: 240,
        placeName: t('Dépôt Bab Saadoun', 'مستودع باب سعدون'),
        volunteersNeeded: 12,
        volunteersJoined: 12,
        skills: const [],
        matchScore: 0.61,
        matchReason: t(
          'Near you, and no experience needed',
          'قريب منك ولا يتطلب خبرة',
        ),
      ),
    ];
  }

  static List<CommunityEvent> events({bool arabic = false}) {
    String t(String en, String ar) => arabic ? ar : en;
    return [
      CommunityEvent(
        id: 'evt-1',
        title: t('Neighborhood clean-up day', 'يوم تنظيف الحي'),
        organizerName: t(
          'Comité de quartier El Menzah',
          'لجنة حي المنزه',
        ),
        category: ImpactCategory.environment,
        startsAt: _inDays(3),
        placeName: t('Place du marché', 'ساحة السوق'),
        capacity: 60,
        going: 41,
        rsvp: RsvpStatus.going,
      ),
      CommunityEvent(
        id: 'evt-2',
        title: t('Blood donation drive', 'حملة تبرّع بالدم'),
        organizerName: t('Croissant-Rouge', 'الهلال الأحمر'),
        category: ImpactCategory.health,
        startsAt: _inDays(7, atHour: 8),
        placeName: t('Centre de santé', 'المركز الصحي'),
        capacity: 120,
        going: 86,
        rsvp: RsvpStatus.none,
      ),
      CommunityEvent(
        id: 'evt-3',
        title: t(
          'First aid workshop for parents',
          'ورشة إسعافات أولية للأهالي',
        ),
        organizerName: t('Croissant-Rouge', 'الهلال الأحمر'),
        category: ImpactCategory.health,
        startsAt: _inDays(10, atHour: 17),
        placeName: t('Maison de jeunes', 'دار الشباب'),
        capacity: 30,
        going: 30,
        rsvp: RsvpStatus.waitlist,
      ),
    ];
  }

  static List<Mission> missions({bool arabic = false}) {
    String t(String en, String ar) => arabic ? ar : en;
    return [
      Mission(
        id: 'mis-1',
        title: t('Clean Streets', 'شوارع نظيفة'),
        summary: t(
          'Clear the three dumping spots neighbors report most often.',
          'أزيلوا نقاط رمي النفايات الثلاث الأكثر تكرارًا في البلاغات.',
        ),
        tasks: [
          MissionTask(
            label: t(
              'Report an illegal dumping spot',
              'أبلغ عن نقطة رمي نفايات',
            ),
            target: 1,
            completed: 1,
          ),
          MissionTask(
            label: t('Join one cleanup', 'شارك في حملة تنظيف'),
            target: 1,
            completed: 0,
          ),
          MissionTask(
            label: t('Bring two neighbors along', 'ادعُ جارين للمشاركة'),
            target: 2,
            completed: 1,
          ),
        ],
        xpReward: 150,
        participants: 42,
        endsAt: _inDays(12),
        joined: true,
      ),
      Mission(
        id: 'mis-2',
        title: t('Help Students', 'ساعد الطلاب'),
        summary: t(
          'Give year-9 students a hand before the exam season.',
          'ساعد تلاميذ التاسعة قبل موسم الامتحانات.',
        ),
        tasks: [
          MissionTask(
            label: t('Tutor for two hours', 'قدّم ساعتَي دروس دعم'),
            target: 2,
            completed: 0,
          ),
          MissionTask(
            label: t(
              'Share three study resources',
              'شارك ثلاثة مصادر تعليمية',
            ),
            target: 3,
            completed: 0,
          ),
          MissionTask(
            label: t('Mentor one student', 'رافق تلميذًا واحدًا'),
            target: 1,
            completed: 0,
          ),
        ],
        xpReward: 200,
        participants: 18,
        endsAt: _inDays(21),
        joined: false,
      ),
      Mission(
        id: 'mis-3',
        title: t('Light Up the Street', 'أضيئوا الشارع'),
        summary: t(
          'Get every broken streetlight on the school route reported.',
          'أبلغوا عن كل عمود إنارة معطّل على طريق المدرسة.',
        ),
        tasks: [
          MissionTask(
            label: t(
              'Report a broken streetlight',
              'أبلغ عن عمود إنارة معطّل',
            ),
            target: 3,
            completed: 3,
          ),
          MissionTask(
            label: t(
              'Support three lighting reports',
              'ساند ثلاثة بلاغات إنارة',
            ),
            target: 3,
            completed: 3,
          ),
        ],
        xpReward: 120,
        participants: 27,
        endsAt: _inDays(5),
        joined: true,
      ),
    ];
  }

  static List<Lesson> lessons({bool arabic = false}) {
    String t(String en, String ar) => arabic ? ar : en;
    return [
      Lesson(
        id: 'les-1',
        title: t('Spot a water leak early', 'اكتشف تسرّب المياه مبكرًا'),
        summary: t(
          'The three signs that a small leak is about to become a big one.',
          'ثلاث علامات تدل أن تسربًا صغيرًا على وشك أن يكبر.',
        ),
        topic: LessonTopic.environment,
        minutes: 4,
        xpReward: 50,
        questionCount: 4,
        progress: 1,
      ),
      Lesson(
        id: 'les-2',
        title: t(
          'First aid: the first three minutes',
          'الإسعافات الأولية: الدقائق الثلاث الأولى',
        ),
        summary: t(
          'What to do before help arrives, in the order that matters.',
          'ما يجب فعله قبل وصول المساعدة، بالترتيب الصحيح.',
        ),
        topic: LessonTopic.firstAid,
        minutes: 6,
        xpReward: 60,
        questionCount: 5,
        progress: 0.4,
      ),
      Lesson(
        id: 'les-3',
        title: t(
          'Write a report that gets fixed',
          'اكتب بلاغًا يُحَلّ فعلًا',
        ),
        summary: t(
          'Photos, place and wording that help a repair crew act fast.',
          'الصور والموقع والصياغة التي تساعد فريق الإصلاح على التحرك بسرعة.',
        ),
        topic: LessonTopic.civic,
        minutes: 5,
        xpReward: 50,
        questionCount: 4,
        progress: 0,
      ),
      Lesson(
        id: 'les-4',
        title: t('Sort your waste properly', 'افرز نفاياتك بشكل صحيح'),
        summary: t(
          'What actually gets recycled locally, and what contaminates it.',
          'ما يُعاد تدويره محليًا فعلًا، وما يفسد عملية التدوير.',
        ),
        topic: LessonTopic.sustainability,
        minutes: 5,
        xpReward: 50,
        questionCount: 4,
        progress: 0,
      ),
      Lesson(
        id: 'les-5',
        title: t('Spot an online scam', 'اكتشف عمليات النصب الإلكتروني'),
        summary: t(
          'The four warning signs in messages that ask for money or codes.',
          'أربع علامات تحذيرية في الرسائل التي تطلب مالًا أو رموزًا.',
        ),
        topic: LessonTopic.digital,
        minutes: 7,
        xpReward: 60,
        questionCount: 6,
        progress: 0,
      ),
    ];
  }

  static List<FeedItem> feed({bool arabic = false}) {
    String t(String en, String ar) => arabic ? ar : en;
    return [
      FeedItem(
        id: 'feed-1',
        kind: FeedKind.issueResolved,
        text: t(
          'The community got the water leak near the school gate fixed',
          'أصلح المجتمع تسرّب المياه قرب بوابة المدرسة',
        ),
        placeName: t(
          'École primaire El Menzah',
          'المدرسة الابتدائية بالمنزه',
        ),
        happenedAt: _hoursAgo(6),
        celebrations: 34,
        celebratedByMe: false,
      ),
      FeedItem(
        id: 'feed-2',
        kind: FeedKind.eventJoined,
        text: t(
          '12 neighbors joined the beach cleanup at Plage Nord',
          'انضم 12 جارًا إلى حملة تنظيف شاطئ الشمال',
        ),
        placeName: t('Plage Nord', 'شاطئ الشمال'),
        happenedAt: _hoursAgo(20),
        celebrations: 21,
        celebratedByMe: true,
      ),
      FeedItem(
        id: 'feed-3',
        kind: FeedKind.volunteeringDone,
        text: t(
          'Sara completed 3 hours of tutoring at Lycée Ibn Khaldoun',
          'أتمّت سارة 3 ساعات من الدروس في معهد ابن خلدون',
        ),
        placeName: t('Lycée Ibn Khaldoun', 'معهد ابن خلدون'),
        happenedAt: _daysAgo(1),
        celebrations: 15,
        celebratedByMe: false,
      ),
      FeedItem(
        id: 'feed-4',
        kind: FeedKind.missionStarted,
        text: t(
          'The Clean Streets mission started in El Menzah',
          'انطلقت مهمة شوارع نظيفة في المنزه',
        ),
        placeName: t('El Menzah', 'المنزه'),
        happenedAt: _daysAgo(2),
        celebrations: 9,
        celebratedByMe: false,
      ),
    ];
  }

  static ImpactSummary impact({bool arabic = false}) {
    String t(String en, String ar) => arabic ? ar : en;
    final today = DateTime.now();
    const hours = [0.0, 1.5, 0.0, 0.0, 2.0, 0.5, 0.5];
    return ImpactSummary(
      levelNumber: 3,
      levelName: t('Community Helper', 'مساعد المجتمع'),
      xp: 1240,
      xpForNextLevel: 1800,
      hoursThisWeek: 4.5,
      totalHours: 42,
      issuesReported: 8,
      issuesResolved: 6,
      peopleHelped: 17,
      missionsCompleted: 5,
      eventsAttended: 7,
      badges: [
        ImpactBadge(
          id: 'bdg-1',
          name: t('First contribution', 'أول مساهمة'),
          description: t(
            'You took your first action in the community.',
            'قمت بأول مساهمة لك في المجتمع.',
          ),
          earnedAt: _daysAgo(198),
        ),
        ImpactBadge(
          id: 'bdg-2',
          name: t('Problem solver', 'حلّال المشكلات'),
          description: t(
            'Five issues you reported were resolved.',
            'حُلّت خمس مشكلات أبلغت عنها.',
          ),
          earnedAt: _daysAgo(46),
        ),
        ImpactBadge(
          id: 'bdg-3',
          name: t('10 hours volunteering', '10 ساعات تطوّع'),
          description: t(
            'Ten hours confirmed by organizers.',
            'عشر ساعات أكّدها المنظّمون.',
          ),
          earnedAt: _daysAgo(120),
        ),
        ImpactBadge(
          id: 'bdg-4',
          name: t('Environmental hero', 'بطل البيئة'),
          description: t(
            'Take part in five environment actions.',
            'شارك في خمسة أنشطة بيئية.',
          ),
          earnedAt: _daysAgo(12),
        ),
        ImpactBadge(
          id: 'bdg-5',
          name: t('Mentor', 'مرشد'),
          description: t(
            'Mentor one student through a whole term.',
            'رافق تلميذًا طوال ثلاثي كامل.',
          ),
        ),
      ],
      week: [
        for (var i = 6; i >= 0; i--)
          DailyContribution(
            day: DateTime(
              today.year,
              today.month,
              today.day,
            ).subtract(Duration(days: i)),
            hours: hours[6 - i],
          ),
      ],
    );
  }
}
