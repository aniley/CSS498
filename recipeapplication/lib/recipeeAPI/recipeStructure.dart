class Model {
  // search data
  String label;
  String image;
  String url;
  String source;

  //contructor to initialize data
  Model({this.label, this.image, this.source, this.url});

  //facotry for the model to create new recipee
  //uses data from the map which is parsed from API
  factory Model.fromMap(Map<String, dynamic> data) {
    return Model(
        image: data["image"],
        label: data["label"],
        source: data["source"],
        url: data["url"]);
  }
}
