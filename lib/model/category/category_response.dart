import 'category_description.dart';

class CategoryResponse
{
   final int status;
   final String message;
   final List<CategoryDescription> categoryDescriptionList;

   CategoryResponse({this.status, this.message, this.categoryDescriptionList});
}