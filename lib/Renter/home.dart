import 'package:flutter/material.dart';
import 'package:car_rent_app/Renter/card_details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(
        0xFFF6F6F6,
      ), // Light grey background to make white elements pop
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 80),
            _upperSection(),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: _buildCarCard(
                context: context,
                name: 'Mustang Fastback',
                year: '2025',
                price: '\$100',
                Condition: 'Excellent',
                color: 'Black',
                seats: '2-4',
                rating: '4.7',
                imagePath: 'assets/images/mustang_side_profile.png',
                imageScale: 2.0,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: _buildCarCard(
                context: context,
                name: 'Range Rover Velar',
                year: '2024',
                price: '\$80',
                Condition: 'Very Good',
                color: 'White',
                seats: '4',
                rating: '4.5',
                imagePath: 'assets/images/suv_side_profile.png',
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: _buildCarCard(
                context: context,
                name: 'Off-Road Truck',
                year: '2023',
                price: '\$120',
                Condition: 'Good',
                color: 'Grey',
                seats: '5',
                rating: '4.8',
                imagePath: 'assets/images/truck_side_profile.png',
              ),
            ),
            SizedBox(height: 120), // Bottom padding for navigation bar
          ],
        ),
      ),
    );
  }
}

Widget _upperSection() {
  return Container(
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Morning! Jerry',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 1),
                      Text(
                        "Where's your next destination?",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.grey[200],
                          child: Icon(
                            Icons.notifications_none_rounded,
                            color: Colors.black87,
                            size: 26,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 4,
                        top: 4,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: 20),

        // Search Bar and Filter
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              // Search Bar Pill
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: [
                      // Search icon circle
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey[200]!,
                            width: 1,
                          ),
                        ),
                        child: Icon(
                          Icons.search,
                          color: Colors.black54,
                          size: 22,
                        ),
                      ),
                      SizedBox(width: 12),
                      // Search input
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search for your car',
                            hintStyle: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                          ),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 12),
              // Filter Button
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: Color(0xFF1E1E1E),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.tune_rounded, color: Colors.white, size: 24),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Brands',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    _buildBrand(
                      'All Cars',
                      Icons.directions_car_outlined,
                      isSelected: true,
                    ),
                    _buildBrand(
                      'Toyota',
                      Icons.language,
                    ), // Note: You can replace with custom SVGs later
                    _buildBrand('BMW', Icons.motion_photos_auto),
                    _buildBrand('Tesla', Icons.electric_car_outlined),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildBrand(String name, IconData iconData, {bool isSelected = false}) {
  return Container(
    margin: EdgeInsets.only(right: 12),
    padding: EdgeInsets.only(left: 6, right: 16, top: 6, bottom: 6),
    decoration: BoxDecoration(
      color: isSelected
          ? Color(0xFFF5B754)
          : Colors.white, // App theme color if selected, else white
      borderRadius: BorderRadius.circular(30),
      border: isSelected
          ? null
          : Border.all(color: Colors.grey[200]!, width: 1),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Inner Circle Icon
        Container(
          width: 38,
          height: 40,
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFF1E1E1E) : Colors.white,
            shape: BoxShape.circle,
            border: isSelected
                ? null
                : Border.all(color: Colors.grey[200]!, width: 1),
          ),
          child: Icon(
            iconData,
            color: isSelected ? Colors.white : Colors.black87,
            size: 20,
          ),
        ),
        SizedBox(width: 10),
        // Brand Name Text
        Text(
          name,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}

// PREMIUM CAR CARD DESIGN
Widget _buildCarCard({
  required BuildContext context,
  required String name,
  required String year,
  required String price,
  required String Condition,
  required String color,
  required String seats,
  required String rating,
  required String imagePath,
  double imageScale = 1.0,
}) {
  return InkWell(
    borderRadius: BorderRadius.circular(24),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const CardDetails()),
      );
    },
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 24,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Name, Year, Price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    year,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: price,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    TextSpan(
                      text: '/hour',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Main Car Image
          SizedBox(height: 10),
          Center(
            child: Transform.scale(
              scale: imageScale, // Expands the image visually
              child: Image.asset(
                imagePath,
                height: 110, // Keeps the layout card height short
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 10),

          // Specs Row with Dividers
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSpecItem('Excellent', Condition),
                VerticalDivider(
                  width: 20,
                  thickness: 1,
                  color: Colors.grey[200],
                ),
                _buildSpecItem('Color', color),
                VerticalDivider(
                  width: 20,
                  thickness: 1,
                  color: Colors.grey[200],
                ),
                _buildSpecItem('Seats', seats),
                VerticalDivider(
                  width: 20,
                  thickness: 1,
                  color: Colors.grey[200],
                ),
                _buildSpecItem('Rating', rating),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

// Helper widget for rendering an individual spec block inside the car card
Widget _buildSpecItem(String title, String value) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.grey[500],
        ),
      ),
      SizedBox(height: 6),
      Text(
        value,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Colors.black87,
        ),
      ),
    ],
  );
}
