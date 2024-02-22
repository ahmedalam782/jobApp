

class CountryRegisterModel {
  final String image;
  final String title;
  final Function()? onTap;

  CountryRegisterModel({
    this.onTap,
    required this.image,
    required this.title,
  });
}
