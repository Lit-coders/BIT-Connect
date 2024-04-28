import 'package:latlong2/latlong.dart';

final bit = {
  'name': "Bahir Dar Institute Of Technology",
  'description':
      "a campus of engineering in Bahir Dar University. historically, it is the oldest one - originated in 1963 by Emperor HaileSelassie",
  'position': [11.597621756651337, 37.39551835806901],
};

final List places = [
  {
    'category': 'Lounges',
    'places': [
      {
        'name': 'Kitaw Lounge',
        'description':
            'Named after the esteemed BiT alumnus, Engineer Kitaw Ejigu, this inviting student lounge offers a cozy space to relax, enjoy delicious food, and connect with fellow BiT students',
        'position': [11.597925500052817, 37.397444149178554]
      },
      {
        'name': 'BiT Main Lounge',
        'description':
            'Immerse yourself in the heart of the BiT community at our comfortable and vibrant main lounge. Indulge in delightful food while enjoying a welcoming atmosphere, fostering connections, and creating unforgettable memories with fellow BiT students',
        'position': [11.598283015211864, 37.39589959956143],
      },
    ]
  },
  {
    'category': 'dormitories',
    'places': [
      {
        'name': "Gafat Building: Male Dormitory",
        'description':
            'Our male dormitory, named after the historic Gafat, offers comfortable accommodations and a sense of community, providing a welcoming environment for male BiT students',
        'position': [11.598180000732109, 37.397755980491645],
      },
      {
        'name': "Abdissa Aga Building: Male Dormitory",
        'description':
            'Named in honor of the heroic Ethiopian figure, Abdissa Aga, our dormitory combines tribute with comfort. Experience a welcoming atmosphere and modern amenities that ensure your stay is both inspiring and comfortable.',
        'position': [11.599231398547118, 37.397739329225715],
      },
      {
        'name': "Guna Mountain Building: Male Dormitory",
        'description':
            'Located at the center of the BiT campus, our male dormitory is named after the majestic Mount Guna. Enjoy the convenience of its central location, making it easy to quickly reach any destination',
        'position': [11.598689869893942, 37.39736928087995],
      },
      {
        'name': "Aklilu Lemma Building : Male Dormitory",
        'description':
            'Our male dormitory, named after the renowned scientist Aklilu Lemma, offers a quiet and peaceful setting. With a green area behind it, residents can enjoy moments of tranquility and serenity.',
        'position': [11.598180000732109, 37.397755980491645],
      },
    ]
  },
  {
    'category': 'Cafes',
    'places': [
      {
        'name': 'Sister Cafe',
        'description':
            'The vibrant cafeteria for 2nd and 3rd-year students. Join us for a delightful dining experience and memorable moments.',
        'position': [11.598230439481872, 37.39662897021394]
      },
      {
        'name': 'Mother Cafe',
        'description':
            'It is a cafeteria 4th and 5th-year students gather for delicious meals and great company.',
        'position': [11.597893954575634, 37.396119483361076],
      },
    ]
  },
  {
    'category': 'Class Rooms',
    'places': [
      {
        'name': 'Poly A Building',
        'description':
            'Poly A Building is a contemporary and spacious classroom facility known for its modern design and comfortable amenities. It offers a welcoming environment for learning and teaching activities.',
        'position': [11.596156247264737,37.39481627941132]
      },
      {
        'name': 'Poly B Building',
        'description':
            'Poly B Building is a prominent classroom building that prioritizes student comfort. It features well-appointed classrooms and study spaces, combining functionality and aesthetic appeal.  ',
        'position': [11.595982834735972,37.39469826221467],
      },
      {
        'name': 'Poly C Building',
        'description':
            'Poly C Building is a functional classroom facility that provides standard classrooms and study spaces for students',
        'position': [11.595825186889083,37.39467144012452]
      },
      {
        'name': 'Poly D Building',
        'description':
            'Poly D Building is a technologically advanced and comfortable facility with smart rooms, providing students an immersive and innovative learning environment.',
        'position': [11.595636009355347,37.39462316036225],
      },
      {
        'name': 'Ghion Building',
        'description':
            'Ghion Building is a prominent learning facility with the largest number of classrooms on campus. It offers students access to internet connectivity, enhancing their educational experience.',
        'position': [11.595541420540414,37.395030856132514]
      },
      {
        'name': 'Emperor Tewodros Hall',
        'description':
            'Tewodros Hall is a spacious classroom named after Emperor Tewodros II. It has the capacity to accommodate a large number of students, providing ample space for educational activities and lectures.',
        'position': [11.596219306339401,37.39542782306672],
      },
    ]
  },
];

final List<LatLng> bitBorders = [
  const LatLng(11.5949517437591, 37.39396750992978),
  const LatLng(11.595104263890669, 37.39387103850565),
  const LatLng(11.60068893574915, 37.39706948532273),
  const LatLng(11.600060179446068, 37.39821357260628),
  const LatLng(11.599457191771728, 37.400297623781356),
  const LatLng(11.59764833249412, 37.40004739108627),
  const LatLng(11.596859189389615, 37.40034791596014),
  const LatLng(11.596596141192421, 37.40101336389521),
  const LatLng(11.59492314885836, 37.40105629602003),
  const LatLng(11.59491700034278, 37.39432222157943)
];
