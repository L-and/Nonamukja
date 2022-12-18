import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  late int pk;
  late String title;
  late String content;
  late String photo;
  late String created_at;
  late String updated_at;
  late int writer;

  PostModel(this.pk, this.title, this.content, this.photo, this.created_at, this.updated_at, this.writer);

  PostModel.Initial() {
    pk=-1; title=""; content=""; photo=""; created_at=""; updated_at=""; writer=-1;
  }


  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);

  @override
  String toString() {
    String data;

    data ="""
          [PK]:${pk}
          [Title]:${title}
          [Content]:${content}
          [Photo]:${photo}
          [Created At]:${created_at}
          [Updated At]:${updated_at}
          [Writer]:${writer}
          """;

    return data;
  }
}
