class CourseCardModel {
  CourseCardModel(
    this.id,
    this.key,
    this.title,
    this.subtitle,
    this.logoUrl,
    this.favoriteList,
    this.favoriteNum,
  );
  String id;
  String key;
  String title;
  String subtitle;
  String logoUrl;
  List<String> favoriteList = [];
  int favoriteNum = 0;
}
