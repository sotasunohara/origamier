class UserProfile {
  final String userId;
  String userName;
  String icon;
  String comment;

  UserProfile({
    required this.userId,
    required this.userName,
    required this.icon,
    required this.comment
  });

  // アイコンを変更する。引数が "" の時はアイコンを削除
  void changeIcon(String newIcon) {
    icon = newIcon;
  }
  // ユーザ名を変更する
  void changeUserName (String newUserName) {
    userName = newUserName;
  }
  // コメントを変更する。
  void changeComment(String newComment) {
    comment = newComment;
  }

}