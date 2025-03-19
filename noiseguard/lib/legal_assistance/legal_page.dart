import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LegalPage extends StatelessWidget {
  final List<Lawyer> lawyers = [
    Lawyer(
      name: "김도윤 변호사",
      field: "층간소음 피해 소송",
      phone: "02-1234-5678",
      workingHours: "평일 11:00 - 18:00",
      image: "assets/lawyer1.jpeg",
      email: "doyunlaw@example.com",
      description:
      "층간소음으로 인한 법적 피해를 전문적으로 다루는 변호사입니다. 여러 케이스를 성공적으로 해결한 경험이 풍부합니다.",
    ),
    Lawyer(
      name: "곽두팔 변호사",
      field: "층간소음 피해 소송",
      phone: "02-9876-5432",
      workingHours: "평일 10:00 - 17:00",
      image: "assets/lawyer2.jpeg",
      email: "kwaklaw@example.com",
      description:
      "층간소음 및 환경 소송 전문 변호사로, 원만한 해결과 승소율이 높은 전략을 제공합니다.",
    ),
    Lawyer(
      name: "송윤섭 변호사",
      field: "층간소음 피해 소송",
      phone: "02-9876-5672",
      workingHours: "평일 10:00 - 17:00",
      image: "assets/lawyer3.jpeg",
      email: "kwaklaw@example.com",
      description:
      "층간소음 및 환경 소송 전문 변호사로, 원만한 해결과 승소율이 높은 전략을 제공합니다.",
    ),
    Lawyer(
      name: "김민지 변호사",
      field: "층간소음 피해 소송",
      phone: "02-9876-1234",
      workingHours: "평일 10:00 - 17:00",
      image: "assets/lawyer4.jpeg",
      email: "kwaklaw@example.com",
      description:
      "층간소음 및 환경 소송 전문 변호사로, 원만한 해결과 승소율이 높은 전략을 제공합니다.",
    ),
  ];

  LegalPage({super.key});

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
            Row(
              children: [
                Text(
                  "📜 법적 대응이 필요할 때\n확실한 해결책을 찾아보세요.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: lawyers.length,
                itemBuilder: (context, index) {
                  return _buildLawyerCard(context, lawyers[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLawyerCard(BuildContext context, Lawyer lawyer) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(lawyer.image),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lawyer.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    lawyer.field,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.phone, color: Colors.blue, size: 18),
                  SizedBox(width: 4),
                  Text(
                    lawyer.phone,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.access_time, color: Colors.blue, size: 18),
                  SizedBox(width: 4),
                  Text(
                    lawyer.workingHours,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
          Divider(color: Colors.grey.shade300),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LawyerDetailScreen(lawyer: lawyer)),
              );
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue.shade100,
              minimumSize: Size(double.infinity, 36),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              "Detail",
              style: TextStyle(color: Colors.blue, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

// 변호사 상세 페이지
class LawyerDetailScreen extends StatelessWidget {
  final Lawyer lawyer;

  LawyerDetailScreen({required this.lawyer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lawyer.name),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(lawyer.image),
              ),
            ),
            SizedBox(height: 12),
            Center(
              child: Text(
                lawyer.name,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                lawyer.field,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            SizedBox(height: 20),
            _buildInfoRow(Icons.phone, lawyer.phone),
            _buildInfoRow(Icons.email, lawyer.email),
            _buildInfoRow(Icons.access_time, lawyer.workingHours),
            SizedBox(height: 20),
            Text(
              "변호사 소개",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              lawyer.description,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _makePhoneCall(lawyer.phone),
                icon: Icon(Icons.phone),
                label: Text("전화하기"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.blue),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  void _makePhoneCall(String phoneNumber) async {
    final Uri url = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print("전화를 걸 수 없습니다.");
    }
  }
}
/*
class Lawyer {
  final String name;
  final String image;

  Lawyer({required this.name, required this.image});
}
*/
// 변호사 데이터 모델
class Lawyer {
  final String name;
  final String field;
  final String phone;
  final String workingHours;
  final String image;
  final String email;
  final String description;

  Lawyer({
    required this.name,
    required this.field,
    required this.phone,
    required this.workingHours,
    required this.image,
    required this.email,
    required this.description,
  });
}
