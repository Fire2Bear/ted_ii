import 'package:openfoodfacts/model/User.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

/// Repository that interface openfoodfacts-dart API
class OpenFoodFactRepository {
  static final String apiUrl = "https://api-adresse.data.gouv.fr";

  Future<List<Product>> searchFood(String search) async {
    var parameters = <Parameter>[
      const OutputFormat(format: Format.JSON),
      const Page(page: 1),
      const PageSize(size: 30),
      const SearchSimple(active: true),
      const SortBy(option: SortOption.PRODUCT_NAME),
      /*
      const TagFilter(
          tagType: "categories",
          contains: true,
          tagName: "breakfast_cereals"),
          */
//      const TagFilter(tagType: "nutrition_grades", contains: true, tagName: "A")
    ];

    ProductSearchQueryConfiguration configuration =
        ProductSearchQueryConfiguration(
            parametersList: parameters,
            fields: [
              ProductField.NAME,
              ProductField.SELECTED_IMAGE,
              ProductField.INGREDIENTS_TEXT
            ],
            language: OpenFoodFactsLanguage.FRENCH);

    SearchResult result = await OpenFoodAPIClient.searchProducts(
        OpenFoodFactConstants.USER, configuration);

    return result.products;
  }
}

class OpenFoodFactConstants {
  static const User USER = const User(
    userId: "fire2bear",
    password: "v@!5KMz6G8eA!&UcZG67",
    comment: "open food fact api user",
  );
}
