import 'package:flutter/material.dart';

class PictureList extends StatelessWidget {
  final List<PictureData> pictures = [
    PictureData(
      title: 'Geranium 1',
      imagePath: 'assets/images/geranium.jpg',
    ),
    PictureData(
      title: 'Geranium 2',
      imagePath: 'assets/images/geranium.jpg',
    ),

  PictureData(
  title: 'Geranium 2',
  imagePath: 'assets/images/geranium.jpg',
  ),

  PictureData(
  title: 'Geranium 2',
  imagePath: 'assets/images/geranium.jpg',
  ),
    // Add more picture data here
  ];

  @override
  Widget build(BuildContext context) {
    // Calculate the number of empty placeholders needed to create full rows
    final numberOfEmptyPlaceholders = (2 - (pictures.length % 2)) % 2;

    // Add empty placeholders to the end of the list
    final paddedPictures = List.from(pictures)
      ..addAll(List.generate(numberOfEmptyPlaceholders, (_) => PictureData()));

    return Container(
      constraints: BoxConstraints(maxHeight: 500.0), // Set the maximum height you desire
      child: ListView.builder(
        itemCount: (paddedPictures.length / 2).ceil(),
        itemBuilder: (context, index) {
          final startIndex = index * 2;
          final endIndex = startIndex + 2;
          final rowPictures = paddedPictures.sublist(startIndex, endIndex);

          return Row(
            children: rowPictures.map((pictureData) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: pictureData.imagePath.isNotEmpty
                      ? PictureCard(pictureData: pictureData)
                      : SizedBox(width: 100, height: 100), // Empty placeholder
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class PictureData {
  final String title;
  final String imagePath;

  PictureData({
    this.title = '',
    this.imagePath = '',
  });
}

class PictureCard extends StatelessWidget {
  final PictureData pictureData;

  PictureCard({
    required this.pictureData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), // Set the border radius you desire
            border: Border.all(
              color: Colors.black, // Set the border color
              width: 2.0, // Set the border width
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0), // Adjust this value as needed
            child: Image.asset(
              pictureData.imagePath,
              width: 100, // Set the width you desire
              height: 100, // Set the height you desire
            ),
          ),
        ),
        Text(
          pictureData.title,
          style: TextStyle(
            fontSize: 16, // Set the font size you desire
            color: Colors.yellow, // Set the text color to red
            decoration: TextDecoration.none, // Remove the underline
          ),
        ),
      ],

    );
  }
}
