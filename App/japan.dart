import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(YenToWonApp());
}

class YenToWonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExchangeCalculator(),
    );
  }
}

class ExchangeCalculator extends StatefulWidget {
  @override
  _ExchangeCalculatorState createState() => _ExchangeCalculatorState();
}

class _ExchangeCalculatorState extends State<ExchangeCalculator> {
  double exchangeRate = 0.0;
  int yenAmount = 0;
  double wonAmount = 0.0;

  final rateController = TextEditingController();
  final yenController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadExchangeRate();
  }

  // 저장된 환율 불러오기
  void _loadExchangeRate() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      exchangeRate = prefs.getDouble('exchange_rate') ?? 0.0;
      rateController.text = exchangeRate != 0.0 ? exchangeRate.toString() : '';
    });
  }

  // 환율 저장
  void _saveExchangeRate() async {
    final prefs = await SharedPreferences.getInstance();
    double rate = double.tryParse(rateController.text) ?? 0.0;
    await prefs.setDouble('exchange_rate', rate);
    setState(() {
      exchangeRate = rate;
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('환율이 저장되었습니다!')));
  }

  // 환율 초기화
  void _resetExchangeRate() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('exchange_rate');
    setState(() {
      exchangeRate = 0.0;
      rateController.clear();
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('환율이 초기화되었습니다!')));
  }

  // 계산하기
  void _calculate() {
    setState(() {
      yenAmount = int.tryParse(yenController.text) ?? 0;
      wonAmount = yenAmount * exchangeRate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text('엔화 ➔ 원화 계산기', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: rateController,
                    decoration: InputDecoration(
                      labelText: '1엔 = ? 원',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _saveExchangeRate,
                  child: Text('저장'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                SizedBox(width: 5),
                ElevatedButton(
                  onPressed: _resetExchangeRate,
                  child: Text('초기화'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              controller: yenController,
              decoration: InputDecoration(
                labelText: '엔화 금액 입력',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _calculate,
              child: Text('계산하기', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: Text(
                wonAmount > 0
                    ? '₩ ${wonAmount.toStringAsFixed(0)} 원'
                    : '계산 결과가 여기에 표시됩니다',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

