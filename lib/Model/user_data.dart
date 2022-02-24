import 'package:barg_flutter/Model/friends_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

@freezed
class User with _$User {
  const factory User ({
    required String guid,
    required bool isOwner,
    required String balance,
    required String picture,
    required int age,
    required String eyeColor,
    required String name,
    required String gender,
    required String company,
    required String email,
    required String phone,
    required String address,
    required String about,
    required String registered,
    required double latitude,
    required double longitude,
    required List tags,
    required List<Friend> friends,
    required String greeting,
    required String favoriteFruit,
  }) = _User;

  factory User.fromJson(Map<String,dynamic>json)=>_$UserFromJson(json);
}