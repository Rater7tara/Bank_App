import 'package:flutter/material.dart';

//  1. App entry point
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking APP',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
      home: const MyHomePage(),
    );
  }
}

// 2. Design Constants
const Color primaryColor = Color(0xFF1E3A8A);
const Color secondaryColor = Color(0xFF4C1D95);

// 3. Main Page Structure
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    print('Navigation Item Tapped: $index');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),

      body: const _HomePageContent(),

      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // bottom navigation bar
  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        color: Colors.white,
        elevation: 0,
        child: SizedBox(
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, 'Home', 0),
              _buildNavItem(Icons.wallet, 'Account', 1),
              const SizedBox(width: 40), //Space for FAB
              _buildNavItem(Icons.folder, 'Apply', 3),
              _buildNavItem(Icons.more_horiz, 'More', 4),
            ],
          ),
        ),
      ),
    );
  }

  // build individual navigation items

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = selectedIndex == index;
    final color = isSelected ? primaryColor : Colors.grey;

    return InkWell(
      onTap: () => onTabTapped(index),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // floating Action Button
  Widget _buildFloatingActionButton() {
    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [primaryColor, secondaryColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: secondaryColor,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: FloatingActionButton(
        onPressed: () => onTabTapped(2),
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: const Icon(Icons.qr_code_scanner, color: Colors.white, size: 28),
      ),
    );
  }
}

// 4. Page Content Layout
class _HomePageContent extends StatelessWidget {
  const _HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          HeaderSection(),
          BankCardWidget(),
          // ActionGridSection(),
          // TransactionHistorySection(),
        ],
      ),
    );
  }
}

// 5. HEADER SECTION
// Top section with gradient brackground and greeting

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Gradient background
        Container(
          height: 150,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [secondaryColor, primaryColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),

        // Content Overlay
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopBar(),
              const SizedBox(height: 20),
              _buildGreeting(),
            ],
          ),
        ),
      ],
    );
  }

  // App bar with title and icons
  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'ED Bank',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            _buildCircleIcon(Icons.chat_bubble_outline),
            const SizedBox(width: 8),
            _buildCircleIcon(Icons.notifications_none),
          ],
        ),
      ],
    );
  }

  // Circular icon button
  Widget _buildCircleIcon(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.3),
      ),
      padding: const EdgeInsets.all(8),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }

  // User greeting section
  Widget _buildGreeting() {
    return Row(
      children: [
        const Icon(Icons.lock_outline, color: Colors.white, size: 24),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Good Morning',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            Text(
              'Mr Eddy Gonzales',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// 6. Bank card Widget
class BankCardWidget extends StatelessWidget {
  const BankCardWidget({super.key});

  @override
  Widget build(BuildContext) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(20),
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          colors: [primaryColor, secondaryColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCardTop(),
          _buildBalanceDisplay(),
          _buildCardNumber(),
          _buildCardDetails(),
        ],
      ),
    );
  }

  Widget _buildCardTop() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.credit_card, size: 40, color: Colors.yellow[800]),
        const Text(
          'VISA',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w900,
            shadows: [
              Shadow(
                blurRadius: 5,
                color: Colors.black54,
                offset: Offset(1, 1),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBalanceDisplay() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Available Balance',
          style: TextStyle(color: Colors.white70, fontSize: 12),
        ),
        SizedBox(height: 4),
        Text(
          '\$1, 234.50',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildCardNumber() {
    return const Text(
      '**** **** **** 1234',
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        letterSpacing: 4,
      ),
    );
  }

  Widget _buildCardDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Card Holder',
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
            Text(
              'EDDY GONZALES',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Text(
              'Expires',
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
            Text(
              '12/26',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// 7. ACTION GRID
