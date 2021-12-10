class CastModel{
  int? id;
  String? name;
  String? character;
  String? profilePath;

  CastModel({
    this.id,
    this.name,
    this.character,
    this.profilePath
  });

  factory CastModel.fromMap(Map<String,dynamic> map){
    return CastModel(
      id: map['id'],
      name: map['name'],
      character: map['character'],
      profilePath: map['profile_path']
    );
  }
}