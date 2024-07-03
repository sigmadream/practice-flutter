class FoodStoreModel {
  int? id;
  String? storeImgUrl;
  String storeAddress;
  String uid;
  String storeName;
  String storeComment;
  double latitude;
  double longitude;
  DateTime? createdAt;

  FoodStoreModel({
    this.id,
    this.storeImgUrl,
    required this.storeAddress,
    required this.uid,
    required this.storeName,
    required this.storeComment,
    required this.latitude,
    required this.longitude,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'store_img_url': storeImgUrl,
      'store_address': storeAddress,
      'uid': uid,
      'store_name': storeName,
      'store_comment': storeComment,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory FoodStoreModel.fromJson(Map<dynamic, dynamic> json) {
    return FoodStoreModel(
      id: json['id'],
      storeImgUrl: json['store_img_url'],
      storeAddress: json['store_address'],
      uid: json['uid'],
      storeName: json['store_name'],
      storeComment: json['store_comment'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
