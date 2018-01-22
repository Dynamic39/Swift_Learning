# Siwft에 대하여 학습한 내용 정리


### PART1 - SWIFT BASIC & OUTLET
* Swift기초 - Button UI 연결, 간단한 Error 처리 관련 Tip
* Error 확인시, Console창 확인 및 IBAction과 연결된 부분이 정상적으로 되어 있는지 확인, Storyboard에서 확인이 가능함
* iOS App은 어떻게 구동되는가?</br>
	1) iOS의 시스템의 경우 상시 구동이긴 하나, 마치 잠자고 있는 상태와 같아서, 사용자가 특정 명령어를 주지 않는 이상, 동작하지 않는다.</br>
	2) 특정 명령어가 input되면 그 즉시 필요한 메서드를 구현하고, 사용자에게 그에 알맞는 Feed-Back을 제공하여 준다.</br>
	3) 사용자가 다시 input되기 전까지 다시 잠자기와 같은 상태로 돌아가서 또다른 Input이 들어올때 까지 기다린다.</br>

* Object란 무엇인가?</br>
	1) App 은 오브젝트들의 모임으로 이루어져있다.(ex: 데이터를 Parsing하거나, User를 인증하거나, 데이터를 계산하는 작업등을 한다.)</br>
	2) 몇몇 오브젝트들은 iOS에서 기본적으로 제공하여 준다.(UIButton, ViewController, AlertObject, String등)</br>
	3) 몇몇 오브젝트들은 개발자가 직접 써서 정의해줘야 한다.</br>
* Data란 무엇인가?</br>
	1) Object의 특성을 나타내는 것을 가르킨다. 예를 들면 Label의 컬러, 위치, 높이 넓이, 데이터의 값등을 나타낸다</br>
* Functionality란 무엇인가?</br>
	1) User의 Tap을 인식하거나, 강조하기 위한 기능을 수행하거나, 일련의 Action과정을 수행한다.</br>
	2) Swift에서는 주로 func 로 시작되는 메서드들을 지칭한다.</br>
	
Swift에서는 상위 세가지 개념들이 유기적인 관계를 가지며, 서로의 데이터를 교환하거나, 서로가 가지고 있는 Data를 교류하거나, 서로의 액션에 반응하며 일련의 행위들을 실행한다.
(객체지향 언어)

* Swift의 다양한 변수에 대한 Scope들
	1) Global Scope : 전체 App에서 사용될 수 있는 변수를 말한다.
	2) Instance Scope : View컨트롤러 같이 클래스내에서 정의되어 클래스 내에서 사용 될 수 있는 변수를 말한다.
	3) Local Scope : 메서드 내에서만 유효한 변수를 말한다.

* Method 설정
	1) Swift에서 Method를 사용하여, 기능을 구현할 수 있도록 한다.(func) </br>
	2) 개발을 진행하면서, 중복된 코드의 사용은 피하도록 하고, 하나의 Method로 정의하여 진행한다.</br>
	2) 메소드를 작성할때, 해당기능외의 기능을 구현해야 할때는, 새로운 메소드를 넣고 메소드 안에서 메소드를 실행하여 준다.(메소드의 기능 최소화)
* 변수와 상수의 차이
	1) 변수 : var 로 표시하며, 값이 바뀔 수 있다</br>
	2) 상수 : let 로 표시하며, 값이 바뀔 수 없다</br>
	3) 스위트프 컴파일러가 해당코드를 분석하여, 상수를 쓰는것이 적합한 경우, 상수를 쓸 것을 권장하여 준다.</br>
	
	













## 참고자료
### FastCampus 수업 내용
### Ray Wenderlich 강의 내용
### Udemy Swift4 강좌 내용(Mark Price, Ray Wenderlich)