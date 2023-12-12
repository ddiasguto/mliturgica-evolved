import 'package:signing_mass/models/imgHome.dart';

List<ImgHome> imgHome = [
  Holymary,
  Family,
  Samaria,
  Vatican,
  Vatican2,
  Teresinha1,
  TeresaAvila1,
  TeresaAvila2,
  JesusPensante,
  faustina,
  sermao,
  edith,
  agostinho,
  holyspirit,
  joana,
  francis
];

String putLegend(ImgHome element) {
  String str = element.hasLegend ? element.description : '';
  return str;
}

ImgHome francis = const ImgHome(
  filename: 'francis',
  hasLegend: true,
  description: "São Francisco de Assis",
);

ImgHome joana = const ImgHome(
  filename: 'joana',
  hasLegend: true,
  description:
      "Aparição de Santa Catarina e Santa Margarida à Joana d'Arc, a donzela de Orleans",
);

ImgHome Holymary = const ImgHome(
  filename: 'holymary2',
  hasLegend: true,
  description:
      "Minh'alma glorifica o Senhor, e meu espírito exulta de alegria em Deus, meu salvador\nLc 1,42",
);

ImgHome Family = const ImgHome(
  filename: 'family',
  hasLegend: false,
  description: '',
);

ImgHome Samaria = const ImgHome(
    filename: 'samaria2',
    hasLegend: true,
    description: 'Jesus e a samaritana (Jo 4)');

ImgHome Vatican = const ImgHome(
  filename: 'vatican3',
  hasLegend: false,
  description: '',
);

ImgHome Vatican2 = const ImgHome(
  filename: 'vatican4',
  hasLegend: false,
  description: '',
);

ImgHome Teresinha1 = const ImgHome(
    filename: 'teresinha1',
    hasLegend: true,
    description:
        "Santa Teresinha do Menino Jesus (1873-1897)\n Carmelita doutora da Igreja");

ImgHome TeresaAvila1 = const ImgHome(
  filename: 'teresadavila1',
  hasLegend: true,
  description: "Santa Teresa d'Ávila (1515-182)\n Carmelita doutora da Igreja",
);

ImgHome TeresaAvila2 = const ImgHome(
  filename: 'teresadavila2',
  hasLegend: false,
  description: '',
);

ImgHome JesusPensante = const ImgHome(
  filename: 'jesuspensante',
  hasLegend: false,
  description: '',
);

ImgHome faustina = const ImgHome(
  filename: 'faustina',
  hasLegend: true,
  description:
      "Santa Faustina Kowaska (1905-1938)\n Apostola da Divina Misericórida",
);

ImgHome sermao = const ImgHome(
  filename: "jesus-sermao-da-montanha",
  hasLegend: true,
  description: "Sermão sobre a montanha (Mt 5)",
);

ImgHome agostinho = const ImgHome(
    filename: 'agostinho',
    hasLegend: true,
    description: 'Santo Agostinho de Hipona (354 - 430)\n Doutor da graça');

ImgHome edith = const ImgHome(
    filename: 'edith',
    hasLegend: true,
    description: 'Santa Edith Stein (1891-1942)\n Doutora da Igreja');

ImgHome holyspirit = const ImgHome(
  filename: 'holyspirit',
  hasLegend: false,
  description: '',
);
