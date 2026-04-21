import 'package:flutter/material.dart';
import 'package:car_rent_app/Renter/widget/booking.dart';

class CardDetails extends StatefulWidget {
  const CardDetails({super.key});

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  final List<_PlanOption> _plans = const [
    _PlanOption(
      title: 'Hour Rate',
      price: '\$380',
      unit: '/hr',
      icon: Icons.access_time_filled_rounded,
    ),
    _PlanOption(
      title: 'Daily',
      price: '\$1250',
      unit: '/day',
      icon: Icons.calendar_month_rounded,
    ),
    _PlanOption(
      title: 'Monthly',
      price: '\$8,250',
      unit: '/mo',
      icon: Icons.event_note_rounded,
    ),
  ];

  int _selectedPlanIndex = 0;

  @override
  Widget build(BuildContext context) {
    final selectedPlan = _plans[_selectedPlanIndex];

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      bottomNavigationBar: _BookNowBar(
        price: selectedPlan.price,
        unit: selectedPlan.unit,
        label: 'Book ${selectedPlan.title}',
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _upperSection(context),
              _imageSection(),
              _cardoverview(),
              const SizedBox(height: 20),
              _bottomsection(
                plans: _plans,

                selectedPlanIndex: _selectedPlanIndex,
                onPlanSelected: (index) {
                  setState(() => _selectedPlanIndex = index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlanOption {
  final String title;
  final String price;
  final String unit;
  final IconData icon;

  const _PlanOption({
    required this.title,
    required this.price,
    required this.unit,
    required this.icon,
  });
}

Widget _upperSection(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 12, 16, 18),
    child: Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black.withOpacity(0.05),
          ),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
              size: 18,
            ),
          ),
        ),
        const Expanded(
          child: Text(
            'Car details',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ),
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black.withOpacity(0.05),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.ios_share_rounded,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _imageSection() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: Text(
                'Mustang Fastback',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                  height: 1.15,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFD8FFC8),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Text(
                'Available',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF129E37),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/images/mustang_side_profile.png',
                height: 180,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  _PagerDot(isActive: false),
                  SizedBox(width: 8),
                  _PagerDot(isActive: true),
                  SizedBox(width: 8),
                  _PagerDot(isActive: false),
                  SizedBox(width: 8),
                  _PagerDot(isActive: false),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _PagerDot extends StatelessWidget {
  final bool isActive;

  const _PagerDot({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: isActive ? 24 : 12,
      height: 10,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFF4C414) : const Color(0xFFD7D7D7),
        borderRadius: BorderRadius.circular(999),
      ),
    );
  }
}

Widget _cardoverview() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Car Overview',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: const [
            Expanded(
              child: _OverviewChip(
                icon: Icons.local_gas_station_outlined,
                text: 'Patrol',
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: _OverviewChip(
                icon: Icons.event_seat_outlined,
                text: '4 Seats',
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: _OverviewChip(
                icon: Icons.speed_outlined,
                text: '306 km/h',
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

class _OverviewChip extends StatelessWidget {
  final IconData icon;
  final String text;

  const _OverviewChip({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF2E3338), width: 1.5),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: const Color(0xFF2E3338)),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF2E3338),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _bottomsection({
  required List<_PlanOption> plans,
  required int selectedPlanIndex,
  required ValueChanged<int> onPlanSelected,
}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF1D2024), Color(0xFF17191D)],
      ),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Plans',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 14),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(plans.length, (index) {
              final plan = plans[index];
              return Padding(
                padding: EdgeInsets.only(
                  right: index == plans.length - 1 ? 0 : 12,
                ),
                child: _PlanCard(
                  title: plan.title,
                  price: plan.price,
                  unit: plan.unit,
                  icon: plan.icon,
                  isHighlighted: selectedPlanIndex == index,
                  onTap: () => onPlanSelected(index),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 30),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF25282D),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0xFF34373D)),
          ),
          child: Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          color: Color(0xFFE9EAED),
                          size: 16,
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Location',
                          style: TextStyle(
                            color: Color(0xFFC5C8CE),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Spintex Road,\nAccra, Ghana',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        height: 1.15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '.....',
                      style: TextStyle(
                        color: Color(0xFF848892),
                        fontSize: 20,
                        letterSpacing: 2,
                        height: 0.8,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  width: 112,
                  height: 112,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFF0F3EE), Color(0xFFE0E7D9)],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Opacity(
                          opacity: 0.25,
                          child: Icon(
                            Icons.grid_on_rounded,
                            size: 120,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE94D4D),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            '9 min',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const Center(
                        child: Icon(
                          Icons.route_rounded,
                          color: Color(0xFF2B61D1),
                          size: 34,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'User Reviews',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'See All',
              style: TextStyle(
                color: Color(0xFFE8FF58),
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Row(
          children: [
            Icon(Icons.star_rounded, color: Color(0xFFF4C414), size: 20),
            SizedBox(width: 4),
            Text(
              '5.0',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(width: 10),
            Text(
              '25 Reviews',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _HighlightTag(text: 'Clean Car'),
              SizedBox(width: 8),
              _HighlightTag(text: 'On-time Pickup'),
              SizedBox(width: 8),
              _HighlightTag(text: 'Great Support'),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const _ReviewCard(),
      ],
    ),
  );
}

class _PlanCard extends StatelessWidget {
  final String title;
  final String price;
  final String unit;
  final IconData icon;
  final bool isHighlighted;
  final VoidCallback onTap;

  const _PlanCard({
    required this.title,
    required this.price,
    required this.unit,
    required this.icon,
    required this.onTap,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    const Color borderColor = Color(0xFF585B60);
    const Color highlightColor = Color(0xFFF5B754);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: 140,
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 14),
        decoration: BoxDecoration(
          color: const Color(0xFF23262A),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isHighlighted ? highlightColor : borderColor,
            width: 1.4,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: isHighlighted ? highlightColor : const Color(0xFF7A7D82),
                borderRadius: BorderRadius.circular(9),
              ),
              child: Icon(icon, size: 20, color: const Color(0xFF1E1E1E)),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: price,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextSpan(
                    text: unit,
                    style: const TextStyle(
                      color: Color(0xFF9EA1A7),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
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

class _HighlightTag extends StatelessWidget {
  final String text;

  const _HighlightTag({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF2B2E33),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0xFF44474C)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _ReviewCard extends StatelessWidget {
  const _ReviewCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
      decoration: BoxDecoration(
        color: const Color(0xFF23262A),
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'James Miller',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '2 days ago',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.star_rounded, color: Color(0xFFF4C414), size: 18),
              Icon(Icons.star_rounded, color: Color(0xFFF4C414), size: 18),
              Icon(Icons.star_rounded, color: Color(0xFFF4C414), size: 18),
              Icon(Icons.star_rounded, color: Color(0xFFF4C414), size: 18),
              Icon(Icons.star_rounded, color: Color(0xFF8A8D92), size: 18),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'Renting a car has never been this easy. '
            'The app is smooth, and I got my car in minutes!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              height: 1.3,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _BookNowBar extends StatelessWidget {
  final String price;
  final String unit;
  final String label;

  const _BookNowBar({
    required this.price,
    required this.unit,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5B754),
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 62,
                padding: const EdgeInsets.symmetric(horizontal: 10),

                child: Row(
                  children: [
                    const Icon(
                      Icons.sell_outlined,
                      color: Color(0xFF1E1E1E),
                      size: 22,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      price,
                      style: const TextStyle(
                        color: Color(0xFF1E1E1E),
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      unit,
                      style: const TextStyle(
                        color: Color(0xFF4A3A1A),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: SizedBox(
                height: 62,
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const BookingSheet(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E1E1E),
                    foregroundColor: const Color(0xFFF5B754),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    label,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
