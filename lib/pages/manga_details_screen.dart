import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MangaDetailsScreen extends StatelessWidget {
  final String title;
  final String price;
  final int index;
  final List<String> additionalImages;

  const MangaDetailsScreen({
    Key? key,
    required this.title,
    required this.price,
    required this.index,
    required this.additionalImages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 450;

     final List<String> descriptions = [
      'Том 1: Знакомит читателей с Кагэямой Сигэо, известным как Моб, — восьмиклассником с мощными психическими способностями. Он старается вести обычную жизнь и мечтает о дружбе с девочкой по имени Цубоми. В этом томе раскрываются его внутренние конфликты, страхи и отношения с Рейгеном Аратакой, жуликоватым экстрасенсом, который становится его наставником. ',
      'Том 2: Моб продолжает развивать свои способности и сталкивается с различными экстрасенсами и духами. Он начинает работать с Рейгеном, который использует его для своих собственных целей. Читатели видят, как Моб борется с давлением и ожиданиями окружающих, а также начинает осознавать важность дружбы и поддержки.',
      'Том 3: Углубляет тему дружбы и самопринятия. Моб сталкивается с новыми врагами и испытаниями, которые заставляют его задуматься о своих силах и их использовании. Он также начинает развивать отношения с одноклассниками, что помогает ему стать более уверенным в себе.',
      'Том 4: Моб сталкивается с настоящими угрозами, когда его способности начинают привлекать внимание более опасных противников. Он учится контролировать свои эмоции и использовать свои силы для защиты друзей. Этот том подчеркивает важность доверия и поддержки в трудные времена.',
      'Том 5: Фокусируется на внутренней борьбе Моба с его эмоциями и страхами. Он сталкивается с последствиями своих действий и начинает понимать, что его силы могут быть как благословением, так и проклятием. Это приводит к важным урокам о самоконтроле и ответственности.',
      'Том 6: Моб сталкивается с новыми вызовами, включая противостояние со старым знакомым и раскрытие тёмных сторон своих сил. Он продолжает развиваться как персонаж, осознавая важность дружбы и поддержки от близких людей.',
      'Том 7: Исследует тему самоидентификации и принятия себя. Моб начинает понимать, что его силы не определяют его как личность. Он продолжает развивать свои отношения с друзьями и учится принимать свою уникальность.',
      'Том 8: Начинается новая арка сюжета, где Моб сталкивается с более серьезными угрозами. Его способности подвергаются испытаниям, а он сам оказывается в центре конфликта между добром и злом. Этот том акцентирует внимание на моральных дилеммах и выборе между личными интересами и благом других.',
    ];
    Future<void> _handleEscKey() async {
      if (ModalRoute.of(context)?.isCurrent == true) {
        Navigator.pop(context);
      }
    }

    SystemChannels.keyEvent.setMessageHandler((message) async {
      final keyMessage = message as Map<String, dynamic>?;
      if (keyMessage != null && keyMessage['type'] == 'keydown') {
        final keyCode = keyMessage['keyCode'];
        if (keyCode == 27) {
          await _handleEscKey();
        }
      }
      return null;
    });

    return Scaffold(
      backgroundColor: const Color(0xFF2D4263),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 27, 20, 43),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'MAN ',
                      style: TextStyle(
                        fontFamily: 'RussoOne',
                        fontSize: isMobile ? 28.0 : 60.0, // Увеличен размер
                        color: const Color(0xFFECDBBA),
                      ),
                    ),
                    TextSpan(
                      text: 'go100',
                      style: TextStyle(
                        fontFamily: 'Tektur',
                        fontSize: isMobile ? 28.0 : 60.0, // Увеличен размер
                        color: const Color(0xFFECDBBA),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'RussoOne',
                  fontSize: isMobile ? 28.0 : 50.0, // Увеличен размер
                  color: const Color(0xFFECDBBA),
                ),
              ),
              const SizedBox(height: 50), // Увеличен размер отступа
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(28),
                          child: Image.asset(
                            'assets/images/${index * 100}.png',
                            width: 250, 
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 50), 
                        Text(
                          'Твердый переплет\nФормат издания 19.6 x 12.5 см\nкол-во стр от 380 до 400',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Tektur',
                            fontSize: isMobile ? 12.0 : 20.0, 
                            color: const Color(0xFFECDBBA),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20), 
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '№ глав: ${index * 36 - 35}-${index * 36}',
                          style: TextStyle(
                            fontFamily: 'RussoOne',
                            fontSize: isMobile ? 16.0 : 28.0, 
                            color: const Color(0xFFC84B31),
                          ),
                        ),
                        const SizedBox(height: 40), 
                        Text(
                          descriptions[index - 1],
                          style: TextStyle(
                            fontFamily: 'RussoOne',
                            fontSize: isMobile ? 12.0 : 18.0, 
                            color: const Color(0xFFECDBBA),
                          ),
                        ),
                        const SizedBox(height: 30), 
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFC84B31),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 60, 
                              vertical: 15, 
                            ),
                          ),
                          child: Text(
                            '$price',
                            style: TextStyle(
                              fontFamily: 'RussoOne',
                              fontSize: 20, 
                              color: const Color(0xFFECDBBA),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 20), 
                        Row(
                          children: additionalImages.map((image) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10), 
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: Image.asset(
                                  image,
                                  width: 100, 
                                  height: 100, 
                                  fit: BoxFit.contain,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50), 
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'Tektur',
                    fontSize: isMobile ? 12.0 : 16.0, 
                    color: const Color(0xFFECDBBA),
                  ),
                  children: [
                    const TextSpan(
                      text: '\n\nПеревод выполнен профессионально, сохраняя дух оригинала.',
                    ),
                    const TextSpan(text: 'Издательство '),
                    TextSpan(
                      text: 'Терлецки Комикс',
                      style: TextStyle(
                        fontFamily: 'Tektur',
                        fontSize: 20,
                        color: const Color(0xFFC84B31),
                      ),
                    ),
                    const TextSpan(
                      text: ' уделяет внимание деталям при производстве книг, что делает каждое издание не только интересным для чтения, но и привлекательным для коллекционеров.',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30), // Увеличен размер отступа
             
            ],
          ),
        ),
      ),
    );
  }
}
