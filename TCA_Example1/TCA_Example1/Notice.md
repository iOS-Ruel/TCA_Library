# TCA Example
- TCA 공식 예제를 진행하면서 추후다시 볼 수 있도록 번역한 ReadMe(GPT가 도와줌 ㅎㅎ..)

#  Reducer 생성

TCA에서 기능을 구성하는 기본 단위는 'Reducer()' 매크로와 'Reducer' 프로토콜임
이 프로토콜을 준수하는 것은 앱에서 기능의 로직과 동작을 나타냄.
Action이 시스템에 전달될 때 현재 상태가 다음 상태로 어떻게 발전하는지, 그리고 효과가 외부와 어떻게 소통하고 데이터를 시스템으로 전달하는지 포함.
가장 중요한 것은, 기느으이 핵심 로직과 동작이 SwiftUI 뷰와 전혀 연관되지 않은 상태로 완전히 독립적으로 구축될 수 있다는 점임.
이렇게 하면 독립적인 개발이 더 쉬워지고, 재사용이 더 용이하며, 테스트도 더 간편해짐

먼저, 카운터의 로직을 캡슐화하는 간단한 리듀서를 만들어보겠음.


 

