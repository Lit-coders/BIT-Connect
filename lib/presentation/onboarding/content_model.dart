class OnboardingContent {
  String image;
  String title;
  String discription;

  OnboardingContent({required this.image, required this.title, required this.discription});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      title: 'Experimenting',
      image: 'assets/desinging.png',
      discription:
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
     ),
  OnboardingContent(
      title: 'Oncampus',
      image: 'assets/lunchtime.png',
      discription:
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
    ),
  OnboardingContent(
      title: 'Campus Life',
      image: 'assets/studentsreading.png',
      discription:
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
    ),
];
