class CourseCardModel {
  CourseCardModel(
    this.id,
    this.key,
    this.title,
    this.subtitle,
    this.logoUrl,
    this.favorite,
    this.favoriteList,
    this.favoriteNum,
  );
  String id;
  String key;
  String title;
  String subtitle;
  String logoUrl;
  bool favorite;
  List<String> favoriteList;
  int favoriteNum;
}
