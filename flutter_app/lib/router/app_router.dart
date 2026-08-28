import 'package:flutter/material.dart';

class AppRouteInfo {
  final String path;
  final String? param;

  const AppRouteInfo(this.path, [this.param]);

  static AppRouteInfo fromUri(Uri uri) {
    final pathSegments = uri.pathSegments;
    if (pathSegments.isEmpty || pathSegments.first.isEmpty) {
      return const AppRouteInfo('/');
    }

    final first = pathSegments.first;
    if (first == 'portfolio') {
      return const AppRouteInfo('/portfolio');
    } else if (first == 'blog') {
      if (pathSegments.length > 1) {
        return AppRouteInfo('/blog', pathSegments[1]);
      }
      return const AppRouteInfo('/blog');
    } else if (first == 'resume') {
      return const AppRouteInfo('/resume');
    }

    return const AppRouteInfo('/');
  }

  String toPathString() {
    if (path == '/blog' && param != null) {
      return '/blog/$param';
    }
    return path;
  }
}

class AppRouteInformationParser extends RouteInformationParser<AppRouteInfo> {
  @override
  Future<AppRouteInfo> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = routeInformation.uri;
    return AppRouteInfo.fromUri(uri);
  }

  @override
  RouteInformation? restoreRouteInformation(AppRouteInfo configuration) {
    return RouteInformation(uri: Uri.parse(configuration.toPathString()));
  }
}
