import 'package:flutter/material.dart';
import 'package:noiseguard/legal_assistance/legal_screen.dart';
import 'package:noiseguard/market/market_screen.dart';
import 'package:noiseguard/one_touch_notify/notify_screen.dart';
import 'package:noiseguard/ai_noise_measure/measure_screen.dart';
import 'package:noiseguard/noise_talk/noisetalk_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // 각 페이지 리스트
  final List<Widget> _pages = [
    ReportSelectionScreen(),
    NoiseTalkScreen(),
    AINoiseMeasureScreen(),
    LegalScreen(),
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