class OnboardingModel {
  final String image;
  final String body;
  final String bodyBlue;
  final String bodyNotBlue;
  final String subBody;

  OnboardingModel(
      {required this.image,
      required this.body,
      required this.bodyBlue,
      this.bodyNotBlue = '',
      required this.subBody});
}
