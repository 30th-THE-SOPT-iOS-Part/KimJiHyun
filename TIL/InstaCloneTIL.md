

- Extension NSMutableAttributedString

- GestureRecognizer&TextKit 으로 UILabel text 클릭 이벤트 발생시키기   

  
   


# Extension NSMutableAttributedString



별거 아닐진 몰라도 .. 이제서야 친해진 NSMutableAttributedString

인스타그램 클론코딩을 하면서 최대한 디테일한 부분까지 신경쓰려고 노력했는데 그 부분 중 하나가 게시물 content 부분인 것 같다. UserName과 Content 부분이 분명 하나의 Label인데 굵기도 다르고 심지어 어딜 누르냐에 따라 뷰 이동이 다르다.

 

1. 우선 하나의 Label로 만든 후 유저아이디와 콘텐츠 부분의 굵기를 다르게 해주기 위해 extension으로 메서드를 만들었다.
 


**string.append** -> NSAttributedString을 추가할 수 있다. 영역 지정 X

**string.setAttributes** -> 추가된 NSAttributedString 내에서 range에 따라 attributes를 다르게 설정할 수 있다

```swift
extension NSMutableAttributedString {
    
    func changeWeight(to weight: UIFont.Weight, content: String, targetString: String, size: CGFloat = 12) -> NSMutableAttributedString {
        
        let font = UIFont.systemFont(ofSize: size, weight: weight)
        self.append(
            NSAttributedString(string: content,attributes: [.font: UIFont.systemFont(ofSize: size, weight: .regular)])
          )
        
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        self.setAttributes(attributes, range: (string as NSString).range(of: targetString))
        
        return self
    } 
}
```
 


2. fullContent 는 유저아이디와 콘텐츠를 합친 String

```swift
fullContent = "\(postData.name) \(postData.content)"
```

 

3. fullContent willSet 정의

```swift
var fullContent: String = "" {
        willSet {
            contentLabel.attributedText = NSMutableAttributedString()
                .changeWeight(to: .medium, content: newValue, targetString: postUserName)
        }
    }
```

 

 

# GestureRecognizer&TextKit 으로 UILabel text 클릭 이벤트 발생시키기



NSMutableAttributedString을 통해 폰트와 굵기 등의 스타일은 다르게 주었지만

사용자아이디를 눌렀을 때와, 그 외 content 부분을 눌렀을 때 다른 이벤트가 발생하도록 하려면 어떻게 해야할까

<img src="https://blog.kakaocdn.net/dn/IPWyQ/btrBMFsowjD/xoqXcQkWmXjG7aZzK8IyE0/img.png" alt="img" style="zoom:20%;" />
 


우선 UITapGestureRecognizer로 눌린 부분의 CGPoint가 어느 영역에 있는 것인지 알아야했기 때문에 사용자아이디 text부분의 CGRect를 계산하는 메서드가 필요했다.

그래서 공부하게 된 Textkit...


 






## TextKit

![img](https://blog.kakaocdn.net/dn/GZTfR/btrBPdVYH6n/F44Nul41lm9Tt907ylMQ9K/img.png)

TextKit은 텍스트저장소를 관리하고, 텍스트 기반의 콘텐츠 레이아웃을 담당한다.

근데 우리는 한번도 import TextKit이라고 코드를 쓴적이 없다.

 

왜냐면 UIKit이 포함하고 있기 때문 ~


  
![img](https://blog.kakaocdn.net/dn/du3Vq8/btrBNbxOMNE/LCKmdkmgnbzIKm1xSVykx0/img.png)

TextKit은 MVC 디자인 패턴 기반으로 만들어졌으며

View는 우리가 UIKit에서 사용하는 UILabel, UITextView 등을 의미하고

우리가 주목해야할 것은 Controller과 Model이다.

 

------

## NSTextStorage

NSMutableAttributedString의 하위 클래스.

텍스트를 저장하고 속성(attributes)을 저장한다.
 


## NSTextContainer

텍스트 영역의 레이아웃을 가진다. 말 그대로 컨테이너 !
 


## NSLayoutManager

textStorage를 바탕으로

텍스트를 화면에 보일 글리프(glyph)로 변환하는

매니저 역할을 하는 Controller

------

 

이 셋의 흐름을 보면 이렇게 된다

 

![img](https://blog.kakaocdn.net/dn/zcm6I/btrBNTRe5Nm/pwWLO77gXDrCjYNnTnnKa1/img.png)


 


여기까지 공부하고나니

특정 Label text의 영역을 알기 위해선

text container를 활용해야겠다는 생각이 들었다.

 

text container를 활용하기 위해선

layoutManager, textStorage도 필요하겠지?



 

------



 

## 1. 특정 text의 CGRect 구하기

```
extension UILabel {
    
    func calRectForSpecificRange(subString: String) -> CGRect? {
        
        // NSTextStorage >> NSLayoutManager >> NSTextContainer >> View
        
        // NSTextStorage는 텍스트와 속성 정보를 저장하므로 label.text의 attributedText로 생성
        guard let attributedText = self.attributedText else { return nil }
        let textStorage = NSTextStorage(attributedString: attributedText)
        
        // textStorage에게 layoutManager를 붙여줍니다
        let layoutManager = NSLayoutManager()
        textStorage.addLayoutManager(layoutManager)
        
        // NSTextContainer은 size로 생성할 수 있다. size는 Label의 bounds.size
        let textContainer = NSTextContainer(size: self.bounds.size)
        textContainer.lineFragmentPadding = 0.0 // default 5.0
        
        // layoutManager을 기반으로 생성되어야 하는 컨테이너를 추가해준다
        layoutManager.addTextContainer(textContainer)
        
        // container 내에서 특정 character범위의 영역을 구한다.
        guard let text = self.text,
              let subRange = text.range(of: subString) else { return nil }
        let range = NSRange(subRange, in: text)
        return layoutManager.boundingRect(forGlyphRange: range, in: textContainer)
    }
}
```
  


container 내에 영역을 구하는 메서드가 있을 줄 알았는데, layoutmanager에 있었다.



 



## 2. 클릭 이벤트 구현

------

### - 계획 -

1. Label에 GestureRecognizer 추가

2. 특정 text의 CGRect 구하기

3. 사용자에 의해 눌린 CGPoint가 2에 포함될 때 이벤트 발생

------

    

2는 앞서 구현했으니..

GestureRecognizer 부분 1,3이 남았다.

   

### Label에 Gesture Recognizer 추가

```
let recognizer = UITapGestureRecognizer(target: self, action: #selector(contentClicked(_:)))
        recognizer.delegate = self
        contentLabel.addGestureRecognizer(recognizer)
```


  


GestureRecognizer를 추가해준 Label이

TableViewCell 내에 위치했기 때문에

Selector 내에서 클로저 함수를 다시 한 번 호출하는 방식을 선택했다.


 


### contentClicked 

```
@objc func contentClicked(_ sender: UITapGestureRecognizer) {
        contentLabelAction?(sender)
    }
```



### contentLabelAction : ((UIGestureRecognizer) -> ())?

```
contentLabelAction = { [unowned self] sender in
            let point = sender.location(in: contentLabel)
 
            if let postUserNameRect = contentLabel.calRectForSpecificRange(subString: postData.name),
               postUserNameRect.contains(point) {

                print("유저 네임 누름")
            } else {
                print("그 외 영역 누름")
            }
        }
```

