import 'package:freezed_annotation/freezed_annotation.dart';

part 'friends_data.freezed.dart';
part 'friends_data.g.dart';

@freezed
class Friend with _$Friend {
  const factory Friend ({
    required int id,
    required String guid,
    required String name,
  }) = _Friend;

  factory Friend.fromJson(Map<String,dynamic>json)=>_$FriendFromJson(json);
}