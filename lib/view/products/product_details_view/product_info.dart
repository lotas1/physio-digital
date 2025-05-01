import 'package:flutter/material.dart';
import 'package:physio_digital/model/product/product.dart';

class ProductInfoSection extends StatefulWidget {
  final Product product;

  const ProductInfoSection({super.key, required this.product});

  @override
  State<ProductInfoSection> createState() => _ProductInfoSectionState();
}

class _ProductInfoSectionState extends State<ProductInfoSection> {
  int _selectedTab = 0;
  final List<String> _tabs = ['Details', 'Features'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTabBar(),
        const SizedBox(height: 16),
        _buildSelectedContent(),
      ],
    );
  }

  Widget _buildTabBar() {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: List.generate(
          _tabs.length,
              (index) => Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTab = index;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: _selectedTab == index
                      ? const Color(0xFF354AD9)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    _tabs[index],
                    style: TextStyle(
                      color: _selectedTab == index ? Colors.white : Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedContent() {
    switch (_selectedTab) {
      case 0:
        return _buildDetailsContent();
      case 1:
        return _buildFeaturesContent();
      default:
        return _buildDetailsContent();
    }
  }

  Widget _buildDetailsContent() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Description',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.product.details ?? 'No description available for this product.',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          _buildSpecifications(),
        ],
      ),
    );
  }

  Widget _buildSpecifications() {


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Specifications',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        // Here we would parse and display specifications
        // For now, just showing placeholder
        const Text(
          'Product specifications would be shown here.',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturesContent() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Key Features',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildFeaturesList(),
        ],
      ),
    );
  }

  Widget _buildFeaturesList() {
    if (widget.product.features == null || widget.product.features!.isEmpty) {
      return const Text(
        'No features available for this product.',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
      );
    }

    // For demonstration, splitting the features by newline
    // In a real app, you'd likely have a structured features list
    List<String> featuresList = widget.product.features!.split('\n');

    if (featuresList.isEmpty) {
      featuresList = [widget.product.features!];
    }

    return Column(
      children: featuresList.map((feature) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.check_circle,
                color: Color(0xFF354AD9),
                size: 20,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  feature.trim(),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

// Review section removed as requested
}