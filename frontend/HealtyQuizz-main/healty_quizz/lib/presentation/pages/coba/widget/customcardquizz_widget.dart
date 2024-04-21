import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final VoidCallback onTap;
  final String imageUrl;
  final String title;
  final String description;
  final Color color;

  const CustomCard({
    Key? key,
    required this.onTap,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.color, // Default color is red
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(
              bottomStart: Radius.circular(16), bottomEnd: Radius.circular(16)),
          color: color,
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              width: double.infinity,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
