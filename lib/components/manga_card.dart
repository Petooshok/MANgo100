import 'package:flutter/material.dart';

class MangaCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String price;
  final VoidCallback onTap;

  const MangaCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color(0xFFECDBBA),
          borderRadius: BorderRadius.circular(35),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: isMobile ? screenWidth * 0.3 : 150,
                height: isMobile ? screenWidth * 0.45 : 225,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: isMobile ? 20 : 24,
                      color: const Color(0xFF2D4263),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: isMobile ? 10 : 12,
                      color: const Color(0xFF2D4263),
                      fontFamily: 'Tektur',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: isMobile ? 14 : 16,
                      color: const Color(0xFF2D4263),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}