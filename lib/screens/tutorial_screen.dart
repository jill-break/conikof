import 'package:flutter/material.dart';
import 'home_screen.dart';

class TutorialScreen extends StatefulWidget {
  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _goToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) => setState(() => _currentPage = index),
              children: [
                _buildPageOne(),
                _buildPageTwo(),
              ],
            ),
          ),
          _buildBottomNavigation(),
        ],
      ),
    );
  }

  Widget _buildPageOne() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('CONIKOF',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text('CSSVD · BPD DETECTOR',
                  style: TextStyle(fontSize: 14, letterSpacing: 1.2)),
              SizedBox(height: 32),
              Text(
                'Detect Cocoa Diseases\nWith Your Phone',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold, height: 1.3),
              ),
              SizedBox(height: 16),
              Text(
                'Use your phone’s camera to detect cocoa or cocoa leaves for signs of diseases. Get instant results and recommendations.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.black87),
              ),
            ],
          ),
          Image.asset('assets/tutorial1.png', height: 280),
        ],
      ),
    );
  }

  Widget _buildPageTwo() {
    final diseases = [
      {
        'name': 'Black Pod',
        'desc': 'Phytophthora palmivora',
        'img': 'assets/blackpod.jpg',
      },
      {
        'name': 'Healthy cocoa',
        'desc': 'No visible signs',
        'img': 'assets/healthy.jpg',
      },
      {
        'name': 'Mealybugs (CSSVD)',
        'desc': 'Vector of the virus',
        'img': 'assets/mealybug.jpg',
      },
      {
        'name': 'Mottled/chlorosis patches',
        'desc': 'Potential CSSVD sign',
        'img': 'assets/mottle.jpg',
      },
      {
        'name': 'CSSVD',
        'desc': 'Cocoa Swollen Shoot Virus Disease',
        'img': 'assets/cssvd.jpg',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text('CONIKOF',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 4),
          Center(
            child: Text('CSSVD · BPD DETECTOR',
                style: TextStyle(fontSize: 13, letterSpacing: 1.2)),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search for disease',
              prefixIcon: Icon(Icons.search),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Common Cocoa Diseases Detected\nBy Most Users',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: diseases.length,
              itemBuilder: (context, index) {
                final d = diseases[index];
                return ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 4),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(d['img']!,
                        width: 50, height: 50, fit: BoxFit.cover),
                  ),
                  title: Text(d['name']!),
                  subtitle: Text(d['desc']!),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    final isLastPage = _currentPage == 1;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(2, (index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 12 : 8,
                height: _currentPage == index ? 12 : 8,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.purple : Colors.grey,
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),
          SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: isLastPage
                  ? _goToHome
                  : () => _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(vertical: 14),
              ),
              child: Text(
                isLastPage ? 'Start' : 'Get Started',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
