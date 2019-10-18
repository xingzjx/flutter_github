// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repo _$RepoFromJson(Map<String, dynamic> json) {
  return Repo()
    ..id = json['id'] as num
    ..name = json['name'] as String
    ..fullName = json['full_name'] as String
    ..owner = json['owner'] == null
        ? null
        : User.fromJson(json['owner'] as Map<String, dynamic>)
    ..parent = json['parent'] == null
        ? null
        : Repo.fromJson(json['parent'] as Map<String, dynamic>)
    ..private = json['private'] as bool
    ..htmlUrl = json['html_url'] as String
    ..description = json['description'] as String
    ..fork = json['fork'] as bool
    ..homepage = json['homepage'] as String
    ..language = json['language'] as String
    ..forksCount = json['forks_count'] as num
    ..stargazersCount = json['stargazers_count'] as num
    ..watchersCount = json['watchers_count'] as num
    ..size = json['size'] as num
    ..defaultBranch = json['default_branch'] as String
    ..openIssuesCount = json['open_issues_count'] as num
    ..topics = json['topics'] as List
    ..hasIssues = json['has_issues'] as bool
    ..hasProjects = json['has_projects'] as bool
    ..hasWiki = json['has_wiki'] as bool
    ..hasPages = json['has_pages'] as bool
    ..hasDownloads = json['has_downloads'] as bool
    ..pushedAt = json['pushed_at'] == null
        ? null
        : DateTime.parse(json['pushed_at'] as String)
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String)
    ..permissions = json['permissions'] as Map<String, dynamic>
    ..subscribersCount = json['subscribers_count'] as num
    ..license = json['license'] as Map<String, dynamic>;
}

Map<String, dynamic> _$RepoToJson(Repo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'full_name': instance.fullName,
      'owner': instance.owner,
      'parent': instance.parent,
      'private': instance.private,
      'html_url': instance.htmlUrl,
      'description': instance.description,
      'fork': instance.fork,
      'homepage': instance.homepage,
      'language': instance.language,
      'forks_count': instance.forksCount,
      'stargazers_count': instance.stargazersCount,
      'watchers_count': instance.watchersCount,
      'size': instance.size,
      'default_branch': instance.defaultBranch,
      'open_issues_count': instance.openIssuesCount,
      'topics': instance.topics,
      'has_issues': instance.hasIssues,
      'has_projects': instance.hasProjects,
      'has_wiki': instance.hasWiki,
      'has_pages': instance.hasPages,
      'has_downloads': instance.hasDownloads,
      'pushed_at': instance.pushedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'permissions': instance.permissions,
      'subscribers_count': instance.subscribersCount,
      'license': instance.license
    };
