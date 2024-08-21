# TCA_Library
- TCA를 학습하며 예제 프로젝트를 위한 레포지토리입니다.

## TCA: The Composable Architecture
[TCA GitHub](https://github.com/pointfreeco/swift-composable-architecture?tab=readme-ov-file)

TCA는 개발할 때 몇가지 문제를 해결하기 위해 탄생했습니다.

1. 앱의 상태를 간단한 방식으로 관리하고, <br>이를 다른 화면들 사이에서 공유하여 한 화면에서의 상태 변경이 다른 화면들에서 관찰될 수 있도록 합니다.
2. 같은 화면을 구성하는 다른 부분들의 구현을 분리하고,<br> 나중에다시 이들을 결합하여(구성하여) 전체를 형성할 수 있게 합니다.
3. 단위 테스트 뿐만 아니라 통합 테스트와 종단간 테스트 수준에서도 테스트를 용이하게 합니다.
4. 각 구성 요소를 구현하기 위한 API를 제공하는 라이브러리를 사용하여 이 모든 것을 쉽게 구현할 수 있습니다.



### 작동방식
TCA는 반응형 프로그래밍의 원칙에 따라 선언적 방식으로 작동하는 아키텍쳐로, Redux 패턴에 따라 코드를 구조화합니다.<br>
SwiftUI(선언적)와 함께 사용하도록 최적화되어 있지만 UIKit(명령형)과도 사용할 수 있습니다.

TCA는 The Elm Architecture에서 파생되었지만, TCA는 예를 들어 각 View가 자체 Store를 가지고 있다는 아이디어로 동작합니다.<br>
하지만 이런 각 자식 store는 부모 view 상태의 부분 복사본을 가지고 있습니다.
view의 Store로 action이 전송될 때마다, 이는 반응적으로 부모의 store로 전달됩니다.


![image](https://github.com/user-attachments/assets/802e61fb-ebf9-4979-8bff-f0610399cb32)
- 각 View는 자체 Store를 가짐


` TCA는 View가 Store를 가지고 있는 것을 확인 할 수있는데 구성하는 요소들은 아래와 같음`

## 구성요소
TCA는 여섯가지 구성요소를 기반으로 함.</br>
State, View, Action, Reducer, Environment, Store

![image](https://github.com/user-attachments/assets/bcb75300-531f-46f7-a83a-b44050a18cdf)

### State
- 앱의 상태를 나타내고 View를 업데이트하는 데필요한 변수들의 집합
### View 
- State의 데이터를 받아 표현하는 역할
### Action
- 일반적으로 발생할 수 있는 모든 액션을 케이스로 포함하는 <b>enum</b>.
- 이벤트, 알림, 사용자 액션(ex, 액션은 서버로부터 데이터를 받는 것과 버튼을 터치하는 것 모두가 될 수 있음.)
### Reducer
- 단순히 Action과 현재 State를 받아 새로운 State로 변환하는 함수.
- 모든 Effect(Ex: 외부 서버 호출)를 반환하는 역할도 함
### Environment(Effect)
- 앱내 존재할 수 있는 종속성(Ex: 외부 서버 호출)을 포함하며 외부와의 상호 작용 로직을 포함함.
- 이는 Redux의 Middleware와 같으며, 일반적으로 Reducer에 주입됨(의존성 주입)
- Effect는 Action의 결과이며 Reducer에 의해 생성됨.(외부와 연결할 수 있게 해줌)
- Effect가 작업을 완료하면 다른 Action을 트리거 할 수 있음
### Store
- Store는 State, Action, Reducer의 조합.
- 사용자의 액션을 받아 State와 함께 Reducer에 전송
- 새로운 상태가 생성되면 View가 업데이트 됨

## 장점과 단점 
### 장점
1. 데이터 흐름이 단방향임.
2. Reducer만이 State를 수정할 수 있어 테스트가 용이함.
3. 앱은 다양한 기능의 구성으로 만들어지는데, 이를 통해 각 기능을 별도로 설계, 개발 및 테스트할 수 있음.
4. Environment에서 모든 종속성을 찾을 수 있음.
디버깅 작업을 쉽게 하고, 개발환경에서 생산환경으로 전환하는 것이 더 쉬워짐.
5. 선언적 방식으로 뷰를 개발할 수 있음.
### 단점
1. TCA는 SwiftUI와 더 잘 맞지만, UIKit에서도 사용할 수 있음.
<br>SwiftUI의 선언적 UI 패러다임과 TCA의 단방향 데이터 흐름이 자연스럽게 어우러지기 때문. 
<br>UIKit에서도 TCA를 사용할 수 있지만, SwiftUI만큼 자연스럽지 않음

2. 여러 상태를 가짐으로써 이들 간의 동기화가 복잡해질 수 있음.
3. 학습에 시간이 오래 걸려 처음 접하게 된다면 빠르게 적용하지 못할 수 있음.