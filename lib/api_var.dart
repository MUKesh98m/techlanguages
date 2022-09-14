class data_con {
  final String id;
  final String name;
  final String image;

  data_con({required this.id, required this.name, required this.image});
  factory data_con.fromJson(Map<String, dynamic> json) {
    return data_con(
      id: json['id'],
      name: json['c_name'],
      image: json['c_image'],
    );
  }
}

class features_con {
  final String id;
  final String name;
  final String image;
  final String price;
  final String duration;
  final String session;
  final String review;
  final String is_favorited;
  final String description;

  features_con(
      {required this.id,
      required this.name,
      required this.image,
      required this.price,
      required this.duration,
      required this.session,
      required this.review,
      required this.is_favorited,
      required this.description});

  factory features_con.fromJson(Map<String, dynamic> json) {
    return features_con(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
      duration: json['duration'],
      session: json['session'],
      review: json['review'],
      is_favorited: json['is_favorited'],
      description: json['description'],
    );
  }
}