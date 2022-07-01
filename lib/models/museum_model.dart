class MuseumModel {
  MuseumModel({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.country,
    required this.address,
    this.lat,
    this.lon,
    this.image,
  });

  int id;
  String name;
  String description;
  String city;
  String country;
  String address;
  double? lat;
  double? lon;
  String? image;

  factory MuseumModel.fromJson(Map<String, dynamic> json) => MuseumModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    city: json["city"],
    country: json["country"],
    address: json["address"],
    lat: json["lat"].toDouble(),
    lon: json["lon"].toDouble(),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "city": city,
    "country": country,
    "address": address,
    "lat": lat,
    "lon": lon,
    "image": image,
  };
}
