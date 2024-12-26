import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ValueNotifier Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(title: 'ValueNotifier Example'),
    );
  }
}

// ValueNotifier를 사용하는 메인 화면
// StatelessWidget을 사용하면서도 상태 관리가 가능합니다.
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.title});
  final String title;

  // ValueNotifier를 사용하여 카운터 값 관리
  // 정수형 값을 관리하는 ValueNotifier를 0으로 초기화
  final counterController = ValueNotifier<int>(0);
  
  // UI 표시 여부를 관리하는 ValueNotifier
  // bool 값을 관리하는 ValueNotifier를 false로 초기화
  final isHide = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // isHide 값의 변화를 감지하는 ValueListenableBuilder
            ValueListenableBuilder(
              valueListenable: isHide,
              builder: (context, value, child) {
                // value가 true이면 빈 공간을 반환
                if (value) {
                  return SizedBox.shrink();
                }
                // value가 false이면 카운터 UI를 표시
                return ValueListenableBuilder(
                  // counterController 값의 변화를 감지
                  valueListenable: counterController,
                  builder: (context, value, child) {
                    return Column(
                      children: [
                        const Text(
                          'You have pushed the button this many times:',
                        ),
                        // 현재 카운터 값을 표시
                        Text(
                          '$value',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        // 증가/감소 버튼
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: increment,
                                child: const Text('+')),
                            const SizedBox(width: 20),  // 버튼 사이 간격
                            ElevatedButton(
                                onPressed: decrement,
                                child: const Text('-')),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 20),  // 버튼과의 간격
            // 숨기기/보이기 토글 버튼
            ElevatedButton(
              onPressed: () {
                // isHide 값을 토글
                isHide.value = !isHide.value;
              },
              child: ValueListenableBuilder(
                valueListenable: isHide,
                builder: (context, value, child) {
                  // 현재 상태에 따라 버튼 텍스트 변경
                  return Text(value ? 'Show Counter' : 'Hide Counter');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 카운터 값을 증가시키는 메서드
  void increment() {
    counterController.value++;
  }

  // 카운터 값을 감소시키는 메서드
  void decrement() {
    counterController.value--;
  }
}
