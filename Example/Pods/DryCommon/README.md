# DryCommon
iOS: 常用方法、常用扩展


## Prerequisites
* Xcode 10.2.1
* iOS 9.0 or later
* ObjC、Swift 5 or later


## Installation
* pod 'DryCommon'


## Features - 常用方法
### 屏幕
```
判断iPhone屏幕类型 - 3.5寸、4.0寸、4.7寸、5.5寸、5.8寸、6.1寸、6.5寸
let isInch35: Bool = DryScreenMode.is35.value 
```

```
判断屏幕尺寸
let isInch35: Bool = DryFunc.isScreen(withWidth: 640, height: 960)
```

```
获取屏幕宽度
let screenWidth: CGFloat = DryFunc.screenWidth()
```

```
获取屏幕高度
let screenHeight: CGFloat = DryFunc.screenHeight()
```

```
获取状态栏高度
let statusBarHeight: CGFloat = DryFunc.statusBarHeight()
```

```
获取底部安全区域高度
let bottomSafeHeight: CGFloat = DryFunc.bottomSafeHeight()
```

```
获取导航栏高度
let navBarHeight: CGFloat = DryFunc.navBarHeight(at: vc)
```

### 系统
```
获取应用程序唯一标识
let bundleIdentifier: String = DryFunc.bundleIdentifier()
```

```
获取系统版本 - 如: 10.0、11.0
let systemVersion: String = DryFunc.systemVersion()
```

```
获取应用程序版本 - 如: 1.0.0、1.0.1
let applicationVersion: String = DryFunc.applicationVersion()
```

```
获取设备型号 - 如: iPhone X
let devicePlatform: String = DryFunc.devicePlatform()
```

### 沙盒
```
获取沙盒Doucument路径
let bundleIdentifier: String = DryFunc.documentPath()
```

```
获取沙盒Cache路径
let systemVersion: String = DryFunc.cachePath()
```

### 日期
```
获取日期格式 - 12小时制、yyyy MM dd hh:mm:ss
let formartter: DateFormatter = DryFunc.formatter12()
```

```
获取日期格式 - 24小时制、yyyy MM dd hh:mm:ss
let formartter: DateFormatter = DryFunc.formatter24()
```

```
获取UTC时间戳 - 单位: s
let utcTimestamp: Int64 = DryFunc.utcTimestamp(withDate: Date())
```

```
获取UTC日期
let utcDate: Date = DryFunc.utcDate(withUtcTimestamp: 1100000)
```

```
获取本地日期 - 12小时制、yyyy MM dd hh:mm:ss
let localDate12: Date = DryFunc.localDate12(withUtcDate: Date())
```

```
获取本地日期 - 24小时制、yyyy MM dd hh:mm:ss
let localDate24: Date = DryFunc.localDate24(withUtcDate: Date())
```

```
获取日期中的"年"
let year: Int = DryFunc.year(withDate: Date())
```
  
```
获取日期中的"月"
let month: Int = DryFunc.month(withDate: Date())
```
 
```
获取日期中的"日"
let day: Int = DryFunc.day(withDate: Date())
```
 
```
获取日期中的"时"
let hour: Int = DryFunc.hour(withDate: Date())
```

```
获取日期中的"分"
let minute: Int = DryFunc.minute(withDate: Date())
```

```
获取日期中的"秒"
let second: Int = DryFunc.second(withDate: Date())
```

### 颜色
```
16进制字符串字转换为UIColor
let color: UIColor = DryFunc.color(withHex: "FFFFFF", alpha: 1.0)
```

### 图片
```
绘制指定圆角背景色的UIImage
let img: UIImage? = DryFunc.cornerImage(withRect: CGRect.zero, radius: 5, corner: [.topRight, .bottomRight], bgColor: UIColor.red)
```

```
根据颜色值生成UIImage
let img: UIImage? = DryFunc.image(withColor: UIColor.red)
```

### SSL
```
获取cer证书
let sec: SecCertificate? = DryFunc.cerCertificate(from: "")
```

```
获取cer证书公钥
DryFunc.cerPublicKey(from: "") { (key) in
    let key: SecKey? = key
}
```

### 视图控制器
```
获取根视图控制器
let root: UIViewController? = DryFunc.rootViewController()
```

```
获取当前的视图控制器
let currentViewController: UIViewController? = DryFunc.currentViewController()
```

## Features - 常用扩展
### Data
```
将系统下发的推送Data转换为String
dry_deviceTokenToString
```

### String
```
计算字符串尺寸
dry_size
```

```
剪裁字符串两边的空格
dry_trimSide
```

```
剪裁字符串所有的空格
dry_trimAll
```

### UIImage
```
压缩图片
dry_compres
```

### Dictionary
```
将[String: Any]转换为[String: String]
dry_convertAnyValueToString
```

### UIView
```
添加一像素高度的水平子视图
dry_addHorLine
```

```
添加一像素高度的水平子视图
dry_addVerLine
```

### UITextField
```
设置placeholder
dry_setPlaceholder
```

```
设置placeholder的颜色
dry_setPlaceholderColor
```
 
```
设置placeholder的Font
dry_setPlaceholderFont
```
