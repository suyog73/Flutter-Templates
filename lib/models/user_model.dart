class UserModel {
  String? name;
  String? prn;
  String? email;
  String? imageUrl;
  String? year;
  String? passOutYear;
  String? adminCategory;
  String? branch;
  String? uid;
  List<dynamic> bookmarkNotices = [];
  bool isAdmin = false;

  UserModel({
    required this.name,
    required this.prn,
    required this.email,
    required this.imageUrl,
    required this.year,
    required this.passOutYear,
    required this.adminCategory,
    required this.branch,
    required this.uid,
    this.bookmarkNotices = const [],
    required this.isAdmin,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      adminCategory: map['adminCategory'],
      year: map['year'],
      imageUrl: map['imageUrl'],
      name: map['name'],
      isAdmin: map['isAdmin'] ?? false,
      branch: map['branch'],
      passOutYear: map['passOutYear'],
      prn: map['prn'],
      bookmarkNotices: map['bookmarks'] ?? [],
      email: map['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'adminCategory': adminCategory,
      'year': year,
      'imageUrl': imageUrl,
      'name': name,
      'isAdmin': isAdmin,
      'branch': branch,
      'passOutYear': passOutYear,
      'prn': prn,
      'email': email,
      'bookmarks': bookmarkNotices,
    };
  }
}
