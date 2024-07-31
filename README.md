## FocusCollectionView

![Swift](https://img.shields.io/badge/Swift-5.4+-blue.svg) ![Xcode](https://img.shields.io/badge/Xcode-12.0+-green)
[![Swift Package Manager compatible](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](https://github.com/apple/swift-package-manager)


## Usage

You just need to make it FocusCollectionView instead of CollectionView.
```swift
let focusCollectionView = FocusCollectionView(frame: .zero, collectionViewLayout: flowLayout)
```
<img src="https://github.com/user-attachments/assets/f68ff28a-cd74-4ded-b01d-a94c04658d13" width="200" />

## Configure
You can set up shadows, magnifications, etc.
```swift
focusCollectionView.isShadowEnabled = true
focusCollectionView.focusScale = 1.1 
// When using the focusScale function, be careful that the cell size does not exceed the CollectionView size.
```

## Delegate Method
Since FocusCollectionView encapsulates the UICollectionViewDelegate, delegate methods should be accessed and utilized using the focusDelegate instance.
```swift
focusCollectionView.focusDelegate = self

extension: FocusCollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}
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
