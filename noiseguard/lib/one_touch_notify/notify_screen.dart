import 'package:flutter/material.dart';

class ReportSelectionScreen extends StatefulWidget {
  const ReportSelectionScreen({super.key});

  @override
  NotifyPage createState() => NotifyPage();
}

class NotifyPage extends State<ReportSelectionScreen> {
  int? selectedIndex; // 하나만 선택 가능하도록 인덱스를 저장

  void selectItem(int index) {
    setState(() {
      selectedIndex = index; // 클릭 시 해당 인덱스로 변경 (단일 선택 유지)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "원하는 신고 탭을\n선택해 주세요",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildSelectableCard(
                    index: 0,
                    title: "관리사무소 전화",
                    description: "거주지 관리사무소에 직접 전화하여\n층간소음 문제를 문의하세요.",
                    icon: Icons.phone,
                  ),
                  _buildSelectableCard(
                    index: 1,
                    title: "정부기관 도움",
                    description: "정부 운영 층간소음 상담센터로 연결됩니다.\n신고 및 상담을 요청할 수 있어요.",
                    icon: Icons.favorite,
                  ),
                  _buildSelectableCard(
                    index: 2,
                    title: "경찰에 신고하기",
                    description: "소음이 심각할 경우 112에 전화하거나 문자로 신고할 수 있어요.",
                    icon: Icons.local_police,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: selectedIndex != null ? () {
                // 선택 완료 버튼 기능 추가 가능
              } : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedIndex != null ? Colors.blue : Colors.grey,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                "선택 완료",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectableCard({
    required int index,
    required String title,
    required String description,
    required IconData icon,
  }) {
    bool isSelected = selectedIndex == index; // 선택된 상태인지 확인

    return GestureDetector(
      onTap: () => selectItem(index),
      child: Container(
        margin: EdgeInsets.only(bottom: 25),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 5,
              spreadRadius: 1,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.red, size: 28),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
            Icon(
              isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isSelected ? Colors.blue : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
