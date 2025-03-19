import 'package:flutter/material.dart';
// import 'package:noiseguard/legal_assistance/lawyerlist_page.dart';
import 'package:noiseguard/legal_assistance/legal_page.dart';
import 'package:noiseguard/market/market_page.dart';
import 'package:noiseguard/one_touch_notify/notify_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noise Guard',
      theme: ThemeData.dark(),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // 각 페이지 리스트
  final List<Widget> _pages = [
    ReportSelectionScreen(),
    NoiseTalkScreen(),
    AINoiseMeasureScreen(),
    LegalPage(),
    MarketPage(),
  ];

  // 네비게이션 아이템 선택 시 실행
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // 현재 선택된 화면 표시
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // 5개 이상 아이템 고정
        backgroundColor: Colors.black,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.report),
            label: '원터치 신고',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '소음톡',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mic),
            label: 'AI소음측정',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gavel),
            label: '법률지원',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: '소음마켓',
          ),
        ],
      ),
    );
  }
}

// 임시 페이지
class NoiseTalkScreen extends StatelessWidget {
  const NoiseTalkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Text('소음톡 페이지', style: TextStyle(color: Colors.white))),
    );
  }
}

class AINoiseMeasureScreen extends StatelessWidget {
  const AINoiseMeasureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Text('AI 소음측정 페이지', style: TextStyle(color: Colors.white))),
    );
  }
}