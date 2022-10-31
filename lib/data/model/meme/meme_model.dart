import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'meme_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MemeModel {
  static const idKey = 'id';
  static const imageKey = 'image';
  static const titleKey = 'title';
  static const rareKey = 'rare';
  static const strangeKey = 'strange';
  static const smileKey = 'smile';
  static const luckyKey = 'lucky';
  static const attributesKey = 'attributes';
  static const selectedKey = 'selected';

  @JsonKey(name: idKey)
  final String id;

  @JsonKey(name: imageKey)
  final String image;

  @JsonKey(name: titleKey)
  final String title;

  @JsonKey(name: rareKey)
  final String rare;

  @JsonKey(name: strangeKey)
  final double strange;

  @JsonKey(name: smileKey)
  final double smile;

  @JsonKey(name: luckyKey)
  final double lucky;

  @JsonKey(name: attributesKey)
  final List<String> attributes;

  @JsonKey(name: selectedKey)
  bool selected;

  MemeModel({
    required this.id,
    required this.image,
    required this.title,
    required this.lucky,
    required this.strange,
    required this.rare,
    required this.smile,
    required this.attributes,
    this.selected = false,
  });

  factory MemeModel.fromJson(DocumentSnapshot snapshot) {
    final json = snapshot.data() as Map<String, dynamic>;
    return _$MemeModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MemeModelToJson(this);

  @override
  bool operator ==(other) => other is MemeModel && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class MemeRepo {
  static final memes = [
    MemeModel(
      id: '1',
      image:
          'https://imgs.search.brave.com/710_jZGbQHo2zlD4FXe1H5mcVyHCyil4SkCqlL1yCUs/rs:fit:1200:720:1/g:ce/aHR0cHM6Ly93d3cu/Z2FtZXBvdy5jby93/cC1jb250ZW50L3Vw/bG9hZHMvSnVhbi1K/b3lhLUJvcmphLUtF/S1cucG5n',
      title: 'Dora',
      rare: 'common',
      selected: false,
      lucky: 7,
      smile: 6,
      strange: 4,
      attributes: ['notes', 'teddy'],
    ),
    MemeModel(
      id: '2',
      image:
          'https://imgs.search.brave.com/1_2pvXc1kEtXa1zXeFcwlkwaDbdgqdNrq_QxvummbKM/rs:fit:1200:946:1/g:ce/aHR0cHM6Ly9tZWxt/YWdhemluZS5jb20v/d3AtY29udGVudC91/cGxvYWRzLzIwMTkv/MDcvU2NyZWVuLVNo/b3QtMjAxOS0wNy0z/MS1hdC01LjQ3LjEy/LVBNLnBuZw',
      title: 'Joker',
      rare: 'uncommon',
      selected: false,
      lucky: 9,
      smile: 9,
      strange: 8,
      attributes: ['heart', 'teddy'],
    ),
    MemeModel(
      id: '3',
      image:
          'https://imgs.search.brave.com/EheTJ8BjjNn5ttHWis5egwcOCnLVbucNtzPER9Bsb2I/rs:fit:1200:835:1/g:ce/aHR0cHM6Ly9pbWFn/ZXMuZm9yd2FyZGNk/bi5jb20vaW1hZ2Uv/MTMwMHgvY2VudGVy/L2ltYWdlcy9jcm9w/cGVkL3BlcGUtMTQ2/NzczNjEzNS0xNDcy/MTM2NTMwLmpwZw',
      title: 'Predator',
      rare: 'rare',
      selected: false,
      lucky: 12,
      smile: 10,
      strange: 9,
      attributes: ['lantern', 'power'],
    ),
    MemeModel(
      id: '4',
      image:
          'https://imgs.search.brave.com/owAenRD8paG5JWNjQvQYXHsNJnM6g8xr4CVxtjsVMmM/rs:fit:612:448:1/g:ce/aHR0cHM6Ly90cmtt/ZWRpYS5vbGxjZG4u/bmV0L3VwbG9hZHMv/bmxvLXd3dy9vc3Rh/bHlub2plLzVhNzgy/YjZjNmYzNDlfNTBf/Z3JuLnBuZw',
      title: 'Anabelle',
      rare: 'epic',
      selected: false,
      lucky: 17,
      smile: 14,
      strange: 14,
      attributes: ['heart', 'teddy', 'power'],
    ),
    MemeModel(
      id: '5',
      image:
          'https://i.pinimg.com/564x/95/3f/5a/953f5a3940b2ef6120e9c1cf08893a6c.jpg',
      title: 'Hello',
      rare: 'legendary',
      selected: false,
      lucky: 19,
      smile: 20,
      strange: 18,
      attributes: ['notes', 'lantern', 'power'],
    ),
    MemeModel(
      id: '6',
      image:
          'https://imgs.search.brave.com/9tkGkuGbrCOSo8qNZi0EDyQtl6a3vxx9mbt56xaojmg/rs:fit:1200:1103:1/g:ce/aHR0cHM6Ly93d3cu/ZGFpbHlkb3QuY29t/L3dwLWNvbnRlbnQv/dXBsb2Fkcy8yMDE4/LzEwL3NpbXBzb25z/LWxpbWV3aXJlLW1l/bWVzLmpwZw',
      title: 'Homer',
      rare: 'legendary',
      selected: false,
      lucky: 19,
      smile: 15,
      strange: 18,
      attributes: ['notes', 'lantern', 'power'],
    ),
  ];
}
