import 'package:news/ui/utils/app_assets.dart';

class AppCategory {
  String name;
  String lightImageUrl;
  String darkImageUrl;

  AppCategory({
    required this.name,
    required this.lightImageUrl,
    required this.darkImageUrl,
  });

  static List<AppCategory> categories = [
    AppCategory(
      name: "General",
      lightImageUrl: AppAssets.general,
      darkImageUrl: AppAssets.generalDark,
    ),
    AppCategory(
      name: "Business",
      lightImageUrl: AppAssets.business,
      darkImageUrl: AppAssets.businessDark,
    ),
    AppCategory(
      name: "Sports",
      lightImageUrl: AppAssets.sport,
      darkImageUrl: AppAssets.sportDark,
    ),
    AppCategory(
      name: "Technology",
      lightImageUrl: AppAssets.technology,
      darkImageUrl: AppAssets.technologyDark,
    ),
    AppCategory(
      name: "Entertainment",
      lightImageUrl: AppAssets.entertainment,
      darkImageUrl: AppAssets.entertainmentDark,
    ),
    AppCategory(
      name: "Health",
      lightImageUrl: AppAssets.health,
      darkImageUrl: AppAssets.healthDark,
    ),
    AppCategory(
      name: "Science",
      lightImageUrl: AppAssets.science,
      darkImageUrl: AppAssets.scienceDark,
    ),
  ];
}
