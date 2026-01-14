import 'package:flutter/material.dart';

enum MaterialType { handout, pastQuestion, note, other }

class AppMaterial {
  final String id;
  final String title;
  final String description;
  final String url;
  final MaterialType type;
  final String semester; // 1st or 2nd
  final String session; // e.g., 2023/2024
  final DateTime uploadedAt;
  final String uploadedBy;

  AppMaterial({
    required this.id,
    required this.title,
    required this.description,
    required this.url,
    required this.type,
    required this.semester,
    required this.session,
    required this.uploadedAt,
    required this.uploadedBy,
  });
}

class Folder {
  final String id;
  final String name;
  final String? parentId;
  final List<Folder> subFolders;
  final List<AppMaterial> materials;
  final IconData? icon;

  Folder({
    required this.id,
    required this.name,
    this.parentId,
    this.subFolders = const [],
    this.materials = const [],
    this.icon,
  });
}
