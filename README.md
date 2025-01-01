
# ValueNotifier
## 부제 : 상태관리 패키지(riverpod, getx:controller, ...) 를 사용하지 않고 상태관리 하는 방법

Flutter에서 상태관리를 위한 `ValueNotifier` 사용법을 배워봅시다.

## ValueNotifier란?

`ValueNotifier`는 Flutter에서 제공하는 간단한 상태 관리 도구입니다. 값의 변경을 감지하고 이를 구독하는 위젯(ValueListenableBuilder)들에게 알려주는 역할을 합니다.

## ValueNotifier의 활용

- 단일 화면 내의 위젯 상태 관리
  - 버튼의 활성화 상태
  - 토글버튼의 상태(활성화, 비활성화) 등
  - 단순한 카운터나 타이머

## 실습 예제: 카운터 앱 만들기

이 프로젝트에서는 기본 카운터 앱을 통해 `ValueNotifier`의 사용법을 학습합니다.

### 1. ValueNotifier 생성하기
```dart
// 정수형값을 관리하는 ValueNotifier 생성
final counterController = ValueNotifier<int>(0);

// bool 값을 관리하는 ValueNotifier 생성
final isHide = ValueNotifier<bool>(false);
```

### 2. ValueListenableBuilder 사용하기
```dart
ValueListenableBuilder(
  valueListenable: counterController,  // 감지할 ValueNotifier
  builder: (context, value, child) {   // 값이 변경될 때마다 호출되는 builder
    return Text('$value');
  },
)
```

### 3. 값 변경하기
```dart
// 값을 직접 변경
counterController.value++;  // 증가
counterController.value--;  // 감소

// bool 값 토글
isHide.value = !isHide.value;
```

## 실습 단계

1. Flutter 프로젝트 생성
    ```bash
    flutter create value_notifier_example
    ```

2. 기본 카운터 앱의 상태를 ValueNotifier로 변경
    - `counterController` 생성
    - 숨기기 기능을 위한 `isHide` 생성

3. ValueListenableBuilder로 UI 구현
    - 카운터 표시 위젯
    - 증가/감소 버튼
    - 숨기기/보이기 토글 버튼

## ValueNotifier의 장점

1. 간단한 사용법
   - 복잡한 설정 없이 바로 사용 가능
   - 직관적인 값 변경 방식

2. 효율적인 리빌드
   - 값이 변경된 위젯만 다시 빌드
   - 불필요한 리빌드 방지

3. 작은 규모의 상태 관리에 적합
   - 단순한 상태 관리에 효과적
   - 별도의 패키지 설치 불필요

## 추가 학습

- TextEditingController, TextField위젯과 비교해보기
- 여러 개의 `ValueNotifier` 조합하여 사용하기
- 복잡한 객체에서 `ValueNotifier` 활용하기
