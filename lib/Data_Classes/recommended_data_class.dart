class RecommendedDataClass {
  String id;
  String title;
  String description;
  String imagePath;

  RecommendedDataClass({
    this.id = "",
    required this.title,
    required this.description,
    required this.imagePath,
  });

  RecommendedDataClass.fromJson(Map<String, dynamic> json)
      : this(
          id: json["id"],
          title: json["title"],
          description: json["description"],
          imagePath: json["imagePath"],
        );


  Map<String,dynamic> toJson(){
    return {
      "id": id,
      "title": title,
      "description": description,
      "imagePath":imagePath,
    };
  }
}
