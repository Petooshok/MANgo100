class MangaItem {
  final String imagePath;
  final String title;
  final String description;
  final String price;
  final List<String> additionalImages;

  MangaItem({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
    required this.additionalImages,
  });
}