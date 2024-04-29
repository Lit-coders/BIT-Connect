class OnboardingContent {
  String image;
  String title;
  String discription;

  OnboardingContent({required this.image, required this.title, required this.discription});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      title: 'Stay Informed',
      image: 'assets/desinging.png',
      discription:
          "Get the latest news and updates right at your fingertips. Stay informed about campus events, announcements, and important information with our app's dedicated news section."
     ),
  OnboardingContent(
      title: 'Unlock Campus Discoveries',
      image: 'assets/lunchtime.png',
      discription:
          "Easily locate classrooms, cafeterias, dormitories, lounges and student clubs with our user-friendly app"
    ),
  OnboardingContent(
      title: 'Academic Insights',
      image: 'assets/studentsreading.png',
      discription:
          "Gain valuable insights into your academic journey. Easily access and review your grades, course schedules, and important academic information through our app's intuitive interface."
    ),
];
