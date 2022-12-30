import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String? userName;
  final String? comment;
  final String? userIcon;
  final List<String>? artworks;

  Users({
    this.userName,
    this.comment,
    this.userIcon,
    this.artworks
  });

  factory Users.fromFirestore(
    QueryDocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  )
  {
    final data = snapshot.data();
    return Users(
      userName: data['userName'],
      comment: data['comment'],
      userIcon: data['userIcon'],
      artworks: data['artworks'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if(userName != null) "userName": userName,
      if(comment != null) "comment": comment,
      if(userIcon != null) "userIcon": userIcon,
      if(artworks != null) "artworks": artworks,
    };
  }
}