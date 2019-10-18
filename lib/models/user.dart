import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User();

  String login;

  num id;

  @JsonKey(name: "avatar_url")
  String avatarUrl;

  String url;

  String type;

  @JsonKey(name: "site_admin")
  bool siteAdmin;

  String name;

  String company;

  String blog;

  String location;

  String email;

  bool hireable;

  String bio;

  @JsonKey(name: "public_repos")
  num publicRepos;

  @JsonKey(name: "public_gists")
  num publicGists;

  num followers;

  num following;

  @JsonKey(name: "created_at")
  DateTime createdAt;

  @JsonKey(name: "updated_at")
  DateTime updatedAt;

  @JsonKey(name: "total_private_repos")
  num totalPrivateRepos;

  @JsonKey(name: "owned_private_repos")
  num ownedPrivateRepos;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
