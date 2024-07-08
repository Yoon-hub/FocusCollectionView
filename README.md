## FocusCollectionView

![Swift](https://img.shields.io/badge/Swift-5.4+-blue.svg) ![Xcode](https://img.shields.io/badge/Xcode-12.0+-green)
[![Swift Package Manager compatible](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](https://github.com/apple/swift-package-manager)


## Usage

You just need to make it FocusCollectionView instead of CollectionView.
```swift
let focusCollectionView = FocusCollectionView(frame: .zero, collectionViewLayout: flowLayout)
```
<img src="https://github-production-user-asset-6210df.s3.amazonaws.com/92036498/346385648-f7e5cb0b-8397-4e6f-99b7-5d75ef13149f.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVCODYLSA53PQK4ZA%2F20240708%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240708T003831Z&X-Amz-Expires=300&X-Amz-Signature=c8e56e22332e590bf7fecae6fc94f25aadba0c75bc80366fcaa036a196fe18bf&X-Amz-SignedHeaders=host&actor_id=92036498&key_id=0&repo_id=824355192" width="200" />

## Configure
You can set up shadows, magnifications, etc.
```swift
focusCollectionView.isShadowEnabled = true
focusCollectionView.focusScale = 1.1 
// When using the focusScale function, be careful that the cell size does not exceed the CollectionView size.
```



## Installation

### [Swift Package Manager](https://swift.org/package-manager).

The preferred way of installing FocusCollectionView is via the Swift Package Manager

1. In Xcode, open your project and navigate to **File** → **Add Packages**
2. Paste the repository URL (`https://github.com/Yoon-hub/FocusCollectionView`) and click **Next**.
3. For **Rules**, select **Up to Next Major Version**.
4. Click **Add Package**.


### [CocoaPods](https://guides.cocoapods.org/using/using-cocoapods.html)

```ruby
# Podfile
use_frameworks!

target 'YOUR_TARGET_NAME' do
  pod 'FocusCollectionView'
end
```

Replace `YOUR_TARGET_NAME` and then, in the `Podfile` directory, type:

```bash
$ pod install
```

### License

FocusCollectionView is under MIT license. See the [LICENSE](https://github.com/Yoon-hub/FocusCollectionView/blob/main/LICENSE) for more info.
