# 당근마켓 판매글 업로드 뷰

- 작업 분배
- TIL
- 해결했던 이슈
- 협업을 하면서 느낀점

  

## 작업 분배

  

|                          뷰 이미지                           |                 뷰 설명                  | 뷰 담당  |
| :----------------------------------------------------------: | :--------------------------------------: | :------: |
| <img src="/Users/kimjihyeon/Library/Application Support/typora-user-images/스크린샷 2022-06-17 오후 3.17.54.png" alt="스크린샷 2022-06-17 오후 3.17.54" style="zoom:33%;" /> |  업로드 된 판매글 목록 뷰 & 탭바 커스텀  |   정빈   |
| <img src="/Users/kimjihyeon/Library/Application Support/typora-user-images/스크린샷 2022-06-17 오후 3.18.17.png" alt="스크린샷 2022-06-17 오후 3.18.17" style="zoom:33%;" /> | **판매글 작성 뷰 & 네비게이션바 커스텀** | **지현** |
| <img src="/Users/kimjihyeon/Library/Application Support/typora-user-images/스크린샷 2022-06-17 오후 3.19.13.png" style="zoom:33%;" /> |        사진 업류드 이미지 피커 뷰        |   윤휘   |

  

  

## TIL

  

### 키보드에 맞춰 ScrollView Content Inset 변경하기

https://teunteun2.tistory.com/16

  

### Collection View Cell 내부의 Button Action (tag & delegate & closure 차이점)





  

## 해결했던 이슈

  

### XIB를 이용한 커스텀 뷰 만들 때 - required init?(coder:NSCoder) & awakeFromNib() 의 호출 시점

outlet 초기설정을 required init에서 해주어 생긴 이슈 원인 파악 및 해결

https://teunteun2.tistory.com/11

  

### Collection View Cell 내부의 Button Action (tag & delegate & closure 차이점) 코드X

https://teunteun2.tistory.com/13

  

  

## 협업을 하면서 느낀점



항상 혼자서만 작업을 해와서 조장 친구가 컨벤션을 팀원들과 함께 정하는 모습, 이슈&PR 템플릿을 생성하는 과정, 서로의 작업속도에 맞추어 뷰를 연결하고 에러가 났을 때 자신의 뷰 담당이 아니어도 바로 줌을 켜서 같이 머리를 맞대는 과정 모두가 처음이었는데 너무 재미있었다.

  

초기 컨벤션 설정 및 약속을 하는 것이 굉장히 중요하다고 느꼈는데, 애초에 체계적으로 순서를 정리하고 통일하고자 하는 것을 잘 정해놓으니까 일이 순서대로 진행되고 있는 것이 한 눈에 잘 보였다.

  

그리고 하나 더 느낀점... 이슈가 생겼을 땐 딱 정해진 시간 만큼만 고민하고 바로 팀원들에게 공유하자. 셋이 뭉치니까 어디가 문제인지 금방 찾을 수 있었다.

