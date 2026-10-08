import 'package:community_site/constants/events.dart';
import 'package:community_site/styles.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'app-container', [
      Router(
        routes: [
          Route(path: '/', builder: (context, state) => const CorporateInfoPage()),
        ],
      ),
      footer([
        p([text('© 2021-2026 Flutter日本ユーザーグループ (大阪)')]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('html, body').styles(
      margin: Margin.zero,
      padding: Padding.zero,
      backgroundColor: DesignTokens.background,
      color: DesignTokens.text,
      fontFamily: FontFamily('sans-serif'),
    ),
    css('.content-wrapper').styles(
      maxWidth: DesignTokens.containerWidth.px,
      margin: Margin.symmetric(horizontal: Unit.auto),
      padding: Padding.symmetric(vertical: DesignTokens.sectionPadding.px, horizontal: 24.px),
    ),
    css('.info-section').styles(margin: Margin.only(bottom: 48.px)),
    css('h3').styles(
      fontSize: 1.15.rem,
      fontWeight: FontWeight.w700,
      margin: Margin.only(bottom: 12.px),
    ),
    css('.sub-label').styles(
      display: Display.block,
      margin: Margin.only(top: 24.px),
      fontWeight: FontWeight.bold,
      color: DesignTokens.primary,
    ),
    css('.announcement-row').styles(
      display: Display.flex,
      justifyContent: JustifyContent.spaceBetween,
      alignItems: AlignItems.center,
      margin: Margin.only(top: 20.px),
    ),
    css('.pdf-button').styles(
      backgroundColor: Color('#FF5242'),
      color: Colors.white,
      padding: Padding.symmetric(vertical: 10.px, horizontal: 28.px),
      textDecoration: TextDecoration.none,
      radius: BorderRadius.circular(2.px),
      fontWeight: FontWeight.bold,
    ),
    css('.cards-grid').styles(
      display: Display.grid,
      raw: {'grid-template-columns': 'repeat(auto-fit, minmax(400px, 1fr))'},
      gap: Gap.all(24.px),
      margin: Margin.only(top: 40.px),
    ),
    css('.card').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      backgroundColor: Color('rgba(255, 255, 255, 0.6)'),
      padding: Padding.all(32.px),
      radius: BorderRadius.circular(24.px),
      border: Border.all(color: Color.rgba(0, 0, 0, 0.05), width: 1.px),
      gap: Gap.all(16.px),
    ),
    css('.doc-link').styles(
      display: Display.flex,
      justifyContent: JustifyContent.spaceBetween,
      padding: Padding.symmetric(vertical: 8.px),
      color: Color('#007AFF'),
      textDecoration: TextDecoration.none,
    ),
    css('.social-tile').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      padding: Padding.all(16.px),
      backgroundColor: Color('#E3F2FD'),
      radius: BorderRadius.circular(16.px),
      textDecoration: TextDecoration.none,
      color: DesignTokens.text,
    ),
    css('.tile-icon').styles(
      width: 40.px,
      height: 40.px,
      margin: Margin.only(right: 16.px),
      backgroundColor: Color('#BBDEFB'),
      radius: BorderRadius.circular(50.percent),
      display: Display.flex,
      justifyContent: JustifyContent.center,
      alignItems: AlignItems.center,
    ),
    css('.tile-title').styles(display: Display.block, fontWeight: FontWeight.bold),
    css('.tile-sub').styles(fontSize: 0.85.rem, color: DesignTokens.muted),
    css('.social-links-row').styles(
      display: Display.flex,
      justifyContent: JustifyContent.center,
      alignItems: AlignItems.center,
      gap: Gap.all(20.px),
      margin: Margin.only(top: 24.px),
    ),

    css('.social-icon-btn').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      width: 40.px,
      height: 40.px,
      radius: BorderRadius.circular(50.percent),
      backgroundColor: Color('transparent'),
      textDecoration: TextDecoration.none,
    ),
    css('.social-icon-btn img').styles(
      width: 40.px,
      height: 40.px,
    ),

    css('.event-list').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      gap: Gap.all(12.px),
      margin: Margin.only(top: 16.px),
    ),
    css('.event-item').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      backgroundColor: Color('rgba(255, 255, 255, 0.6)'),
      padding: Padding.all(16.px),
      radius: BorderRadius.circular(12.px),
      border: Border.all(color: Color.rgba(0, 0, 0, 0.05), width: 1.px),
      gap: Gap.all(4.px),
    ),
    css('.event-date').styles(
      fontSize: 0.85.rem,
      color: DesignTokens.muted,
      fontWeight: FontWeight.bold,
    ),
    css('.event-title-link').styles(
      fontSize: 1.0.rem,
      color: Color('#007AFF'),
      textDecoration: TextDecoration.none,
      fontWeight: FontWeight.w600,
    ),
    css('.event-title').styles(
      fontSize: 1.0.rem,
      color: DesignTokens.text,
      fontWeight: FontWeight.w600,
    ),
  ];
}

class CorporateInfoPage extends StatelessComponent {
  const CorporateInfoPage({super.key});

  @override
  Component build(BuildContext context) {
    return main_([
      div(classes: 'content-wrapper', [
        _section('組織', [
          p([text('Flutter日本ユーザーグループ (大阪) / Flutter Meetup Osaka')]),
        ]),
        _section('活動内容', [
          p([text('ハンズオンやミートアップなどを予定しています。')]),
        ]),

        div(classes: 'social-links-row', [
          _iconLink('GitHub', 'https://github.com/flutter-osaka-dev', '/images/github_logo.svg'),
          _iconLink('YouTube', 'https://www.youtube.com/@flutter-osaka', '/images/youtube_logo.svg'),
          _iconLink('connpass', 'https://flutter-jp.connpass.com/', '/images/connpass_logo.svg'),
          _iconLink('Meetup', 'https://www.meetup.com/ja-jp/flutter-meetup-osaka/', '/images/meetup_com_logo.svg'),
        ]),

        EventSection(),

        div(classes: 'cards-grid', [
          _buildCard('📄 ドキュメント', [
            p([text('日本語で書かれた以下のドキュメントをご覧いただけます。')]),
            _docLink('行動規範', 'https://flutter-osaka-dev.github.io/Code-of-Conduct/'),
          ]),
          _buildCard('👥 コミュニティに参加する', [
            p([text('Flutter Osakaのコミュニティに参加して、最新情報を入手したり、他の開発者と交流したりしましょう。ハンズオンやミートアップなどを定期的に開催・予定しています。')]),
            _socialTile('GitHub', 'Flutter Osakaリポジトリに貢献する', 'https://github.com/flutter-osaka-dev', '📂'),
          ]),
        ]),
      ]),
    ]);
  }

  Component _section(String title, List<Component> children) => div(classes: 'info-section', [
    h3([text(title)]),
    ...children,
  ]);

  Component _sub(String label) => strong(classes: 'sub-label', [text(label)]);

  Component _buildCard(String title, List<Component> children) => div(classes: 'card', [
    h3([text(title)]),
    ...children,
  ]);

  Component _docLink(String label, String href) => a(href: href, classes: 'doc-link', [
    text(label),
    span([text('→')]),
  ]);

  Component _socialTile(String title, String sub, String href, String icon) => a(href: href, classes: 'social-tile', [
    div(classes: 'tile-icon', [text(icon)]),
    div([
      strong(classes: 'tile-title', [text(title)]),
      span(classes: 'tile-sub', [text(sub)]),
    ]),
  ]);

  Component _iconLink(String alt, String href, String iconSrc) => a(href: href, classes: 'social-icon-btn', [
    img(src: iconSrc, alt: alt),
  ]);
}

class EventSection extends StatelessComponent {
  const EventSection({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'info-section', [
      h3([text('過去のイベント')]),
      div(classes: 'event-list', [
        for (final item in eventList)
          div(classes: 'event-item', [
            div(classes: 'event-date', [text(item.date)]),
            if (item.url != null)
              a(
                href: item.url!,
                target: Target.blank,
                classes: 'event-title-link',
                [text(item.title)],
              )
            else
              span(classes: 'event-title', [text(item.title)]),
          ]),
      ]),
    ]);
  }
}
