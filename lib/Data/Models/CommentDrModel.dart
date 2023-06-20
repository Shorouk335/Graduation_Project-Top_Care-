class CommentDrModelModel {
  String img = "";
  String namedr;
  String commentInf;
  List<String> comments;

  CommentDrModelModel({
    required this.img,
    required this.namedr,
    required this.commentInf,
    this.comments = const [],
  });
}
