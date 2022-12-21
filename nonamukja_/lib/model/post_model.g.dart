// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) {
  return PostModel(
    json['pk'] as int,
    json['title'] as String,
    json['content'] as String,
    json['talk_link'] as String,
    json['photo'] as String,
    json['created_at'] as String,
    json['updated_at'] as String,
    (json['writer'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'pk': instance.pk,
      'title': instance.title,
      'content': instance.content,
      'photo': instance.photo,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'writer': instance.writer,
    };
