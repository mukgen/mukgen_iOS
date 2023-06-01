# mukgen
![graph](https://github.com/mukgen/mukgen_iOS_V1/assets/102890390/6077ef25-03ed-4c7a-aab5-c5eb183f1f5a)


## 🍴 프로젝트 시작

- 🍔 tuist가 없다면?

```swift
curl -Ls https://install.tuist.io|bash
```

- 🥝 프로젝트를 시작하고 싶다면?

```swift
make generate
```

- 🍱 프로젝트 구조를 수정하고 싶다면?

```swift
tuist edit
```

- 🧃 그 밖에

```swift
// xcodeproj를 제거해줍니다.
make clean

// clean하고 xcodeproj를 제거해줍니다.
make reset

//xcodeproj 제거 후 generate합니다
make regenerate

//라이브러리 다시 받기
tuist fetch
```

## 프로젝트 구조 파악하기

### 🟩 Core

- 프로젝트의 핵심 기능을 나타내는 모듈
- ex) **Base, DesignSystem, +extension**

### 🟥 MukgenKit

- 사진과 color를 모아둡니다.

### 🟦 ThirdPartyLib

- 라이브러리를 모아둡니다.
- snpkit과 then 가지고 있음

### 🟨 Presentation

- 화면에 view를 구성합니다.
- 모든 view들이 모여있는 곳
- view들만 모아져 있습니다.

### 🟧 Mukgen-iOS

- 프로젝트의 iOS 앱 타겟 파일
- 앱의 중심
- 앱의 이동흐름 제어
- 런치스크림, 앱델리,씬델리 포함

### ⬜️ Service

- **`AuthService`**: 인증 서비스를 나타내는 모듈입니다.
- **`BoardService`**: 게시판 서비스를 나타내는 모듈입니다
- **`DeliveryService`**: 배송 서비스를 나타내는 모듈입니다.
- **`MealSuggestionService`**: 식사 제안 서비스를 나타내는 모듈입니다.
- **`MealService`**: 식사 서비스를 나타내는 모듈입니다.
- **`ReViewService`**: 리뷰 서비스를 나타내는 모듈입니다.
- **`UserService`**: 사용자 서비스를 나타내는 모듈입니다.

## 전체적인 모듈 구조

<pre>
├── Makefile<br>
├── Mukgen<br>
│   ├── Modules<br>
│   │   ├── 🟩Core<br>
│   │   │   ├── Core.xcodeproj<br>
│   │   │   ├── Project.swift<br>
│   │   │   ├── Sources<br>
│   │   │   │   ├── Base<br>
│   │   │   │   ├── DesignSystem<br>
│   │   │   │   ├── Foundation+extension<br>
│   │   │   │   ├── Protocols<br>
│   │   │   └── Tests<br>
│   │   ├── 🟥MukgenKit<br>
│   │   │   ├── MukgenKit.xcodeproj<br>
│   │   │   ├── Project.swift<br>
│   │   │   ├── Sources<br>
│   │   │   └── Tests<br>
│   │   ├── 🟨Presentation<br>
│   │   │   ├── Derived<br>
│   │   │   │   └── Sources<br>
│   │   │   │       ├── TuistAssets+Presentation.swift<br>
│   │   │   │       └── TuistBundle+Presentation.swift<br>
│   │   │   ├── Presentation.xcodeproj<br>
│   │   │   ├── Project.swift<br>
│   │   │   ├── Resources<br>
│   │   │   ├── Sources<br>
│   │   │   └── Tests<br>
│   │   └── 🟦ThirdPartyLib<br>
│   │       ├── Project.swift<br>
│   │       ├── Sources<br>
│   │       ├── Tests<br>
│   │       └── ThirdPartyLib.xcodeproj<br>
│   ├── 🟧Mukgen-iOS<br>
│   │   ├── Derived<br>
│   │   │   └── Sources<br>
│   │   │       ├── TuistAssets+MukgenIOS.swift<br>
│   │   │       └── TuistBundle+MukgenIOS.swift<br>
│   │   ├── Project.swift<br>
│   │   ├── Resources<br>
│   │   │   ├── Assets.xcassets<br>
│   │   │   └── LaunchScreen.storyboard<br>
│   │   ├── Sources<br>
│   │   │   ├── Application<br>
│   │   │   │   ├── AppDelegate.swift<br>
│   │   │   │   └── SceneDelegate.swift<br>
│   │   │   └── ModuleFactory<br>
│   │   └── Tests<br>
│   └── Service<br>
│       ├── ⬜️AuthService<br>
│       │   ├── Project.swift<br>
│       │   ├── Sources<br>
│       │   └── Tests<br>
│       ├── ⬜️BoardService<br>
│       │   ├── Project.swift<br>
│       │   ├── Sources<br>
│       │   └── Tests<br>
│       ├── ⬜️DeliveryService<br>
│       │   ├── Project.swift<br>
│       │   ├── Sources<br>
│       │   └── Tests<br>
│       ├── ⬜️MealSaggestionService<br>
│       │   ├── Project.swift<br>
│       │   ├── Sources<br>
│       │   └── Tests<br>
│       ├── ⬜️MealService<br>
│       │   ├── MealService.xcodeproj<br>
│       │   ├── Project.swift<br>
│       │   ├── Sources<br>
│       │   └── Tests<br>
│       ├── ⬜️ReViewService<br>
│       │   ├── Project.swift<br>
│       │   ├── Sources<br>
│       │   └── Tests<br>
│       └── ⬜️UserService<br>
│           ├── Project.swift<br>
│           ├── Sources<br>
│           ├── Tests<br>
├── Plugins<br>
│   └── UtilityPlugin<br>
│       ├── Plugin.swift<br>
│       └── ProjectDescriptionHelpers<br>
│           ├── Dependencies+Module.swift<br>
│           ├── Dependencies+SPM.swift<br>
│           ├── DeploymentTarget+.swift<br>
│           ├── InfoPlist+.swift<br>
│           └── Resources+.swift<br>
├── README.md<br>
└── graph.png
<pre>
