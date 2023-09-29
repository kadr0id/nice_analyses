import 'package:flutter/material.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (context) => const FaqPage(),
      settings: const RouteSettings(name: '/faq'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: false,
      appBar: AppBar(
        elevation: 0,
        title: const Text('ШАНОВНІ ПАЦІЄНТИ!'),
        leading: IconButton(
        key: const Key('signInPage_back_button'),
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.of(context).pop(),
          color: Colors.black,
        ),
          backgroundColor: Colors.amber,
        ),
      body:
      const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            """Переконливо просимо Вас звернути увагу на правила підготовки до забору біологічного матеріалу для лабораторних аналізів. Нагадуємо, що недотримання наступних, досить простих, правил може привести до некоректних результатiв лабораторного тестування.
              1. Напередоднi здачi ВЕНОЗНОЇ КPОВІ для БУДЬ-ЯКИХ лабораторних тестiв КАТЕГОPИЧНО виключити жирну їжу.
          2. При пiдготовцi до здачi УРОГЕНІТАЛЬНОГО МАТЕРІАЛУ для аналiзiв (зiшкріби, мазки i т.п.), особливо для ПЛР - дiагностики необхiдно дотримуватись наступних правил:
     протягом трьох дiб виключити прийом алкоголю i статеве життя;
    ✓ уникати мiсцевого застосування антисептикiв i/або iнших антибактерiальних (протигрибкових)
    препаратiв;
    ✓ безпосередньо перед взяттям матерiалу протягом трьох годин утриматися вiд сечовипускання;
    ✓ перед забором матерiалу повинно пройти хоча б два тижнi з дня закiнчення прийому антибiо-
    тикiв;
    ✓ перед взяттям матерiалу для МІКPОСКОПІЇ УPОГЕНІТАЛЬНОГО МАЗКУ бажано не проводити туалет
    зовнiшнiх статевих органiв у день здачi аналiзу.
    3. Слiд, також, запам'ятати, що кров для ВСІХ показникiв БІОХІМІЧНОЇ ПАНЕЛІ, ПАНЕЛІ ЦУКPОВОГО ДІА-
    БЕТУ, ЗАГАЛЬНОГО АНАЛІЗУ КPОВІ здається ВИКЛЮЧНО НАТЩЕСЕРЦЕ.
    4. При здачi венозної кровi для проведення iнших тестiв, якщо iнше не рекомендоване Вашим лiкарем,
    допускається легкий снiданок, що виключає молоко i молочнi продукти, твариннi жири (напр. сало, ве-
    ршкове масло ), м'ясо, шоколад i каву.
    5. ГОPМОНАЛЬНУ ПАНЕЛЬ краще здавати в ранковi години з 8.30 до 11.00 тому що мають місце добовi
    коливання рівня ряду гормонiв у кровi. ПPОЛАКТИН - здається в першi 2 години пiсля того як Ви проки-
    нулися.
    6. Перед здачею крові на ПСА (простатспецифічний антиген) не рекомендується приймати лiкарськi пре-
    парати, алкоголь, курити, а також проводити масажi сім’янних пухирцiв i простати. Протягом
    тижня виключити тепловi процедури такi як сауна, солярiй.
    7. Для здачi ЗАГАЛЬНОГО АНАЛІЗУ СЕЧІ необхiдно провести ретельний туалет зовнiшнiх полових органiв,
    пiсля чого збирається ВСЯ перша ранкова порцiя сечi в чистий посуд об’ємом 50-100 мл.
    8. Для здачi АНАЛІЗУ СЕЧІ ЗА НЕЧИПОPЕНКО необхiдно також провести ретельний туалет зовнiшнiх ста- тевих органiв, пiсля чого збирається СЕPЕДНЯ ПОPЦІЯ першої ранкової сечi в чистий посуд об’ємом 50-
    100 мл.
    9. Безпосередньо перед забором матерiалу з ОЧЕЙ - не вмиватися.
    ПАМ’ЯТАЙТЕ! Прийом БУДЬ-ЯКИХ медикаментiв, палiння, вживання алкоголю, кави може вплинути на ре- зультати лабораторного тестування. Лiкувальнi i дiагностичнi процедури (оперативнi втручання, iн'єкцiї, пункцiї, бiопсiї, масаж, ергометрiя, дiалiз, введення рентгеноконтрастних засобiв, iонiзуюче ви- промiнювання, ендоскопiчне дослiдження) також можуть вплинути на результати лабораторного до- слiдження.
    Термін виконання аналізів становить від 1- 10 діб, проте може залежати індивідуально в залеж- ності від кількості та специфіки призначених Вам досліджень, про що Вас повідомить реєстратор.',""",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}
