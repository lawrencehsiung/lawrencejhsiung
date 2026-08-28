import 'package:flutter/material.dart';
import 'core/theme/bauhaus_theme.dart';
import 'core/widgets/bauhaus_app_bar.dart';
import 'core/widgets/bauhaus_footer.dart';
import 'features/blog/views/blog_detail_page.dart';
import 'features/blog/views/blog_list_page.dart';
import 'features/home/views/home_page.dart';
import 'features/portfolio/views/portfolio_page.dart';
import 'features/resume/views/resume_page.dart';
import 'router/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const LawrenceHsiungWebsiteApp());
}

class LawrenceHsiungWebsiteApp extends StatefulWidget {
  const LawrenceHsiungWebsiteApp({super.key});

  @override
  State<LawrenceHsiungWebsiteApp> createState() => _LawrenceHsiungWebsiteAppState();
}

class _LawrenceHsiungWebsiteAppState extends State<LawrenceHsiungWebsiteApp> {
  final AppRouteInformationParser _routeInformationParser = AppRouteInformationParser();
  late final AppRouterDelegate _routerDelegate;

  @override
  void initState() {
    super.initState();
    _routerDelegate = AppRouterDelegate();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Lawrence Hsiung | Systems & Electrical Engineer',
      debugShowCheckedModeBanner: false,
      theme: BauhausTheme.themeData,
      routeInformationParser: _routeInformationParser,
      routerDelegate: _routerDelegate,
    );
  }
}

class AppRouterDelegate extends RouterDelegate<AppRouteInfo>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRouteInfo> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  AppRouteInfo _currentRoute = const AppRouteInfo('/');

  AppRouteInfo get currentRoute => _currentRoute;

  @override
  AppRouteInfo get currentConfiguration => _currentRoute;

  void navigateTo(String path) {
    final uri = Uri.parse(path);
    _currentRoute = AppRouteInfo.fromUri(uri);
    notifyListeners();
  }

  @override
  Future<void> setNewRoutePath(AppRouteInfo configuration) async {
    _currentRoute = configuration;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey(_currentRoute.toPathString()),
          child: WebsiteScaffold(
            currentRoute: _currentRoute,
            onNavigate: navigateTo,
          ),
        ),
      ],
      onDidRemovePage: (page) {
        if (_currentRoute.path == '/blog' && _currentRoute.param != null) {
          _currentRoute = const AppRouteInfo('/blog');
          notifyListeners();
        }
      },
    );
  }
}

class WebsiteScaffold extends StatelessWidget {
  final AppRouteInfo currentRoute;
  final Function(String route) onNavigate;

  const WebsiteScaffold({
    super.key,
    required this.currentRoute,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BauhausColors.paper,
      appBar: BauhausAppBar(
        currentRoute: currentRoute.toPathString(),
        onNavigate: onNavigate,
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildPageBody(),
          ),
          BauhausFooter(
            onNavigate: onNavigate,
          ),
        ],
      ),
    );
  }

  Widget _buildPageBody() {
    if (currentRoute.path == '/portfolio') {
      return PortfolioPage(onNavigate: onNavigate);
    } else if (currentRoute.path == '/blog') {
      if (currentRoute.param != null) {
        return BlogDetailPage(
          postId: currentRoute.param!,
          onNavigate: onNavigate,
        );
      }
      return BlogListPage(onNavigate: onNavigate);
    } else if (currentRoute.path == '/resume') {
      return ResumePage(onNavigate: onNavigate);
    }

    return HomePage(onNavigate: onNavigate);
  }
}
