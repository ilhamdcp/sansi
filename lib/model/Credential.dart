import 'package:flutter/foundation.dart';

@immutable
class Credential {
  final String name;
  final String? url;
  final String? username;
  final String? password;
  final String? bannerUrl;
  final String? note;

  const Credential({required this.name, this.username, this.password, this.url,
      this.bannerUrl, this.note});
}