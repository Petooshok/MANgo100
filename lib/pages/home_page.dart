import 'package:flutter/material.dart';
import '../components/manga_card.dart';
import '../models/manga_item.dart';
import 'manga_details_screen.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<MangaItem> mangaItems = [
    MangaItem(
      imagePath: 'assets/images/100.png',
      title: 'Том 1',
      description: 'Знакомство с Кагэямой Сигэо, известным как Моб, восьмиклассником с мощными физическими способностями. Моб пытается вести обычную жизнь, контролируя свои силы, чтобы избежать разрушений.  ',
      price: '100 руб за час',
      additionalImages: [
        'assets/images/1.png',
        'assets/images/2.png',
      ],
    ),
    MangaItem(
      imagePath: 'assets/images/200.png',
      title: 'Том 2',
      description: 'Моб сталкивается с новыми врагами и осознает, что его способности могут быть как благословением, так и проклятием. Он понимает глубину своих эмоций и их влияние на окружающих.',
      price: '110 руб за час',
      additionalImages: [
        'assets/images/3.png',
        'assets/images/4.png',
      ],
      
    ),
    MangaItem(
      imagePath: 'assets/images/300.png',
      title: 'Том 3',
      description: 'Моб исследует свои основные конфликты и учится использовать свои способности во благо. Он встречает новых друзей и врагов, которые помогают ему разобраться в своих чувствах.',
      price: '100 руб за час',
      additionalImages: [
        'assets/images/5.png',
        'assets/images/6.png',
      ],
    ),
    MangaItem(
      imagePath: 'assets/images/400.png',
      title: 'Том 4',
      description: 'Моб сталкивается с основными испытаниями и должен сделать выбор между использованием своих сил для борьбы со злом или стремлением к нормальной жизни. Этот том полон экшена и размышлений.',
      price: '150 руб за час',
      additionalImages: [
        'assets/images/7.png',
        'assets/images/8.png',
      ],
      
    ),MangaItem(
      imagePath: 'assets/images/500.png',
      title: 'Том 5',
      description: 'Моб начинает понимать уровень дружбы и поддержки со стороны окружающих. Он сталкивается с новыми вызовами и учится принимать помощь от других.',
      price: '100 руб за час',
      additionalImages: [
        'assets/images/9.png',
        'assets/images/10.png',
      ],
    ),
    MangaItem(
      imagePath: 'assets/images/600.png',
      title: 'Том 6',
      description: 'Том углубляется в прошлое персонажей, раскрывая их мотивацию. Моб сталкивается с трудными выборами, которые ставят под сомнение его моральные принципы.',
      price: '110 руб за час',
      additionalImages: [
        'assets/images/11.png',
        'assets/images/12.png',
      ],
      
    ),MangaItem(
      imagePath: 'assets/images/700.png',
      title: 'Том 7',
      description: 'История достигает кульминации, когда все персонажи едут к финишной границе. Моб должен использовать все свои силы, чтобы защитить друзей от угрозы.',
      price: '100 руб за час',
      additionalImages: [
        'assets/images/13.png',
        'assets/images/14.png',
      ],
    ),
    MangaItem(
      imagePath: 'assets/images/800.png',
      title: 'Том 8',
      description: 'Заключительный том подводит итоги истории о Мобе. Он должен решить, использовать свои способности или стремиться к обычной жизни. Читатели увидят завершение всех сюжетных линий.',
      price: '110 руб за час',
      additionalImages: [
        'assets/images/15.png',
        'assets/images/16.png',
      ],
      
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Scaffold(
      backgroundColor: const Color(0xFF191919),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'MANgo100',
              style: TextStyle(
                fontSize: isMobile ? 24.0 : 40.0, // Увеличен размер
                color: const Color(0xFFECDBBA),
                fontFamily: 'Tektur',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(mangaItems.length, (index) {
                    final mangaItem = mangaItems[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: MangaCard(
                        imagePath: mangaItem.imagePath,
                        title: mangaItem.title,
                        description: mangaItem.description,
                        price: mangaItem.price,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MangaDetailsScreen(
                                title: mangaItem.title,
                                price: mangaItem.price,
                                index: index + 1,
                                additionalImages: mangaItem.additionalImages,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
