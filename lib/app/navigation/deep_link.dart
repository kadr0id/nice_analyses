import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum TargetPage {
  login,
  main,
}

typedef PageBuilder = Page Function();

TargetPage parseTargetPage(Uri uri) {
  switch (uri.pathSegments.first) {
    case 'main':
      return TargetPage.login;
    default:
      throw UnimplementedError('Target page $uri not supported');
  }
}

String parseId(Uri uri) {
  if (uri.pathSegments.length >= 2) {
    return uri.pathSegments.last;
  } else {
    return '0';
  }
}

/// Class describing the current deep link
class DeepLink extends Equatable {
  const DeepLink({
    this.targetPage = TargetPage.main,
    this.id,
    this.uri,
  });

  DeepLink.fromUri(this.uri)
      : id = parseId(uri!),
        targetPage = parseTargetPage(uri);

  const DeepLink.main({
    required this.id,
    required this.uri,
  }) : targetPage = TargetPage.main;

  final TargetPage targetPage;
  final String? id;
  final Uri? uri;

  bool isEquivalentToRoute(Route route) {
    return route.settings.name == uri.toString();
  }

  @override
  List<Object?> get props => [targetPage, id, uri];
}
