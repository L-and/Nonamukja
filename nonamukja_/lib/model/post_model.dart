import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  late int pk;
  late String title;
  late String content;
  late String talk_link;
  late String photo;
  late String created_at;
  late String updated_at;
  late Map<String, String> writer;

  PostModel(this.pk, this.title, this.content, this.talk_link, this.photo, this.created_at, this.updated_at, this.writer);

  PostModel.Initial() {
    pk=-1; title=""; content=""; photo=""; created_at=""; updated_at=""; writer= Map();
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
          [talk_link]:${talk_link}
          [Photo]:${photo}
          [Created At]:${created_at}
          [Updated At]:${updated_at}
          [Writer Eamil]:${writer['email']}
          [Writer Nickname]:${writer['nickname']}
          """;

    return data;
  }
}
