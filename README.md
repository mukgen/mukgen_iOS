# mukgen
![graph](https://github.com/mukgen/mukgen_iOS_V1/assets/102890390/6077ef25-03ed-4c7a-aab5-c5eb183f1f5a)


## 프로젝트 시작

- tuist가 없다면?

```swift
curl -Ls https://install.tuist.io|bash
```

- 프로젝트를 시작하고 싶다면?

```swift
make generate
```

- 프로젝트 구조를 수정하고 싶다면?

```swift
tuist edit
```

- 그 밖에

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

### Core

- 프로젝트의 핵심 기능을 나타내는 모듈
- ex) **Base, DesignSystem, +extension**

### MukgenKit

- 사진과 color를 모아둡니다.

### ThirdPartyLib

- 라이브러리를 모아둡니다.
- snpkit과 then 가지고 있음

### Mukgen-iOS

- 프로젝트의 iOS 앱 타겟 파일
- 앱의 중심
- 앱의 이동흐름 제어
- 런치스크림, 앱델리,씬델리 포함

### Service

- **`AuthService`**: 인증 서비스를 나타내는 모듈입니다.
- **`BoardService`**: 게시판 서비스를 나타내는 모듈입니다
- **`DeliveryService`**: 배송 서비스를 나타내는 모듈입니다.
- **`MealSuggestionService`**: 식사 제안 서비스를 나타내는 모듈입니다.
- **`MealService`**: 식사 서비스를 나타내는 모듈입니다.
- **`ReViewService`**: 리뷰 서비스를 나타내는 모듈입니다.
- **`UserService`**: 사용자 서비스를 나타내는 모듈입니다.

## 전체적인 구조

├── Makefile
├── Mukgen
│   ├── Modules
│   │   ├── `Core`
│   │   │   ├── Core.xcodeproj
│   │   │   ├── Project.swift
│   │   │   ├── Sources
│   │   │   │   ├── Base
│   │   │   │   ├── DesignSystem
│   │   │   │   ├── Foundation+extension
│   │   │   │   ├── Protocols
│   │   │   └── Tests
│   │   ├── `MukgenKit`
│   │   │   ├── MukgenKit.xcodeproj
│   │   │   ├── Project.swift
│   │   │   ├── Sources
│   │   │   └── Tests
│   │   ├── Presentation
│   │   │   ├── Derived
│   │   │   │   └── Sources
│   │   │   │       ├── TuistAssets+Presentation.swift
│   │   │   │       └── TuistBundle+Presentation.swift
│   │   │   ├── Presentation.xcodeproj
│   │   │   ├── Project.swift
│   │   │   ├── Resources
│   │   │   ├── Sources
│   │   │   └── Tests
│   │   └── `ThirdPartyLib`
│   │       ├── Project.swift
│   │       ├── Sources
│   │       ├── Tests
│   │       └── ThirdPartyLib.xcodeproj
│   ├── `Mukgen-iOS`
│   │   ├── Derived
│   │   │   └── Sources
│   │   │       ├── TuistAssets+MukgenIOS.swift
│   │   │       └── TuistBundle+MukgenIOS.swift
│   │   ├── Project.swift
│   │   ├── Resources
│   │   │   ├── Assets.xcassets
│   │   │   └── LaunchScreen.storyboard
│   │   ├── Sources
│   │   │   ├── Application
│   │   │   │   ├── AppDelegate.swift
│   │   │   │   └── SceneDelegate.swift
│   │   │   └── ModuleFactory
│   │   └── Tests
│   └── Service
│       ├── `AuthService`
│       │   ├── Project.swift
│       │   ├── Sources
│       │   └── Tests
│       ├── `BoardService`
│       │   ├── Project.swift
│       │   ├── Sources
│       │   └── Tests
│       ├── `DeliveryService`
│       │   ├── Project.swift
│       │   ├── Sources
│       │   └── Tests
│       ├── `MealSaggestionService`
│       │   ├── Project.swift
│       │   ├── Sources
│       │   └── Tests
│       ├── `MealService`
│       │   ├── MealService.xcodeproj
│       │   ├── Project.swift
│       │   ├── Sources
│       │   └── Tests
│       ├── `ReViewService`
│       │   ├── Project.swift
│       │   ├── Sources
│       │   └── Tests
│       └── `UserService`
│           ├── Project.swift
│           ├── Sources
│           ├── Tests
├── `Plugins`
│   └── UtilityPlugin
│       ├── Plugin.swift
│       └── ProjectDescriptionHelpers
│           ├── Dependencies+Module.swift
│           ├── Dependencies+SPM.swift
│           ├── DeploymentTarget+.swift
│           ├── InfoPlist+.swift
│           └── Resources+.swift
├── [`README.md`](http://readme.md/)
└── graph.png
