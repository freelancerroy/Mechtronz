import 'package:flutter/material.dart';
import 'package:mechtronz/constants/app_colors.dart';

class ColorPaletteGallery extends StatelessWidget {
  const ColorPaletteGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Palette'),
        backgroundColor: AppColors.primary[500], // Primary color for the AppBar
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildColorSection("Primary Colors", AppColors.primary, 800),
            const SizedBox(height: 16),
            _buildColorSection("Secondary Colors", AppColors.secondary, 500),
            const SizedBox(height: 16),
            _buildGrayColorsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildColorSection(
      String title, MaterialColor palette, int defaultShade) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            50,
            100,
            200,
            300,
            400,
            500,
            600,
            700,
            800,
            900,
          ].map((shade) {
            return _buildColorTile(shade.toString(), palette[shade]!,
                isDefault: shade == defaultShade);
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildGrayColorsSection() {
    final grayColors = {
      "Gray 50": AppColors.gray50,
      "Gray 100": AppColors.gray100,
      "Gray 200": AppColors.gray200,
      "Gray 300": AppColors.gray300,
      "Gray 400": AppColors.gray400,
      "Gray 500": AppColors.gray500,
      "Gray 600": AppColors.gray600,
      "Gray 700": AppColors.gray700,
      "Gray 800": AppColors.gray800,
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Gray Colors",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: grayColors.entries.map((entry) {
            return _buildColorTile(entry.key, entry.value);
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildColorTile(String label, Color color, {bool isDefault = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                    fontSize: 12,
                    color: color.computeLuminance() > 0.5
                        ? Colors.black
                        : Colors.white),
                textAlign: TextAlign.center,
              ),
              if (isDefault)
                Text(
                  "Default",
                  style: TextStyle(
                      fontSize: 12,
                      color: color.computeLuminance() > 0.5
                          ? Colors.black
                          : Colors.white),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
