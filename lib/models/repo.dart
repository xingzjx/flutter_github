import 'package:json_annotation/json_annotation.dart';
import "user.dart";
part 'repo.g.dart';

@JsonSerializable()
class Repo {
  Repo();

  num id;

  String name;

  @JsonKey(name: "full_name")
  String fullName;

  User owner;

  Repo parent;

  bool private;

  @JsonKey(name: "html_url")
  String htmlUrl;

  String description;

  bool fork;

  String homepage;

  String language;

  @JsonKey(name: "forks_count")
  num forksCount;

  @JsonKey(name: "stargazers_count")
  num stargazersCount;

  @JsonKey(name: "watchers_count")
  num watchersCount;

  num size;

  @JsonKey(name: "default_branch")
  String defaultBranch;

  @JsonKey(name: "open_issues_count")
  num openIssuesCount;

  List topics;

  @JsonKey(name: "has_issues")
  bool hasIssues;

  @JsonKey(name: "has_projects")
  bool hasProjects;

  @JsonKey(name: "has_wiki")
  bool hasWiki;

  @JsonKey(name: "has_pages")
  bool hasPages;

  @JsonKey(name: "has_downloads")
  bool hasDownloads;

  @JsonKey(name: "pushed_at")
  DateTime pushedAt;

  @JsonKey(name: "created_at")
  DateTime createdAt;

  @JsonKey(name: "updated_at")
  DateTime updatedAt;

  Map<String,dynamic> permissions;

  @JsonKey(name: "subscribers_count")
  num subscribersCount;

  Map<String,dynamic> license;

  factory Repo.fromJson(Map<String, dynamic> json) => _$RepoFromJson(json);

  Map<String, dynamic> toJson() => _$RepoToJson(this);
}
