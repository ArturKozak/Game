// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meme_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemeModel _$MemeModelFromJson(Map<String, dynamic> json) => MemeModel(
      id: json['id'] as String,
      image: json['image'] as String,
      title: json['title'] as String,
      lucky: (json['lucky'] as num).toDouble(),
      strange: (json['strange'] as num).toDouble(),
      rare: json['rare'] as String,
      smile: (json['smile'] as num).toDouble(),
      attributes: (json['attributes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      selected: json['selected'] as bool? ?? false,
    );

Map<String, dynamic> _$MemeModelToJson(MemeModel instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'rare': instance.rare,
      'strange': instance.strange,
      'smile': instance.smile,
      'lucky': instance.lucky,
      'attributes': instance.attributes,
      'selected': instance.selected,
    };
