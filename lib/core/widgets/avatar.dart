import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'avatar_initials.dart';

enum AvatarSize { small, medium, large }

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    this.imageUrl,
    required this.name,
    this.size = AvatarSize.medium,
  });

  final String? imageUrl;
  final String name;
  final AvatarSize size;

  double get _diameter => switch (size) {
    AvatarSize.small => 32,
    AvatarSize.medium => 48,
    AvatarSize.large => 72,
  };

  String get _initials {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty || parts.first.isEmpty) return '?';
    final first = parts.first.characters.first;
    final second = parts.length > 1 ? parts.last.characters.first : '';
    return '$first$second'.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final url = imageUrl;

    return ClipOval(
      child: url != null && url.isNotEmpty
          ? CachedNetworkImage(
              imageUrl: url,
              width: _diameter,
              height: _diameter,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) =>
                  AvatarInitials(diameter: _diameter, initials: _initials),
            )
          : AvatarInitials(diameter: _diameter, initials: _initials),
    );
  }
}
