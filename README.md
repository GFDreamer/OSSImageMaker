# OSSImageMaker

[![CI Status](http://img.shields.io/travis/LDreame/OSSImageMaker.svg?style=flat)](https://travis-ci.org/LDreame/OSSImageMaker)
[![Version](https://img.shields.io/cocoapods/v/OSSImageMaker.svg?style=flat)](http://cocoapods.org/pods/OSSImageMaker)
[![License](https://img.shields.io/cocoapods/l/OSSImageMaker.svg?style=flat)](http://cocoapods.org/pods/OSSImageMaker)
[![Platform](https://img.shields.io/cocoapods/p/OSSImageMaker.svg?style=flat)](http://cocoapods.org/pods/OSSImageMaker)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

OSSImageMaker is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "OSSImageMaker"
```
## OSS阿里云属性比对
<table>
  <thead>
    <tr>
      <th>OSSImageMaker</th>
      <th>OSS阿里云</th>
      <th>描述</th>
      <th>取值范围</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>contentModel
      OSSImageResizeContentModelTypeLift,
    OSSImageResizeContentModelTypeMfit,
    OSSImageResizeContentModelTypePad,
    OSSImageResizeContentModelTypeFixed,
    OSSImageResizeContentModelTypeFill</td>
      <td>m</td>
      <td>指定缩略的模式：lfit：等比缩放，限制在设定在指定w与h的矩形内的最大图片。mfit：等比缩放，延伸出指定w与h的矩形框外的最小图片。fill：固定宽高，将延伸出指定w与h的矩形框外的最小图片进行居中裁剪。pad：固定宽高，缩略填充fixed：固定宽高，强制缩略</td>
      <td>[lfit,mfit,fill,pad,fixed]，默认为lfit</td>
    </tr>
    <tr>
      <td>width</td>
      <td>w</td>
      <td>指定目标缩略图的宽度。</td>
      <td>1-4096</td>
    </tr>
    <tr>
      <td>height</td>
      <td>h</td>
      <td>指定目标缩略图的高度。</td>
      <td>1-4096</td>
    </tr>
    <tr>
      <td>limit</td>
      <td>limit</td>
      <td>指定当目标缩略图大于原图时是否处理。值是 1 表示不处理；值是 0 表示处理。</td>
      <td>0/1, 默认是 1</td>
    </tr>
    <tr>
      <td>equalRatioScale</td>
      <td>p</td>
      <td>倍数百分比。 小于100，即是缩小，大于100即是放大。</td>
      <td>1-1000</td>
    </tr>
    <tr>
      <td>screenWidthToHeightScale(自定义属性)</td>
      <td>无</td>
      <td>宽高比 屏幕宽 根据传入的比例依据屏幕宽计算高度  高度 screenWidthToHeightScale  = ScreenWidth * 1.0 / ScreenHeight</td>
      <td>宽高比的值</td>
    </tr>
    <tr>
      <td>widthToHeightScale(自定义属性)</td>
      <td>无</td>
      <td>普通宽高比  根据指定宽和指定比例计算设置高度 比例 =  width / height 限制条件 必须 先配置 width的大小</td>
      <td>宽高比的值</td>
    </tr>
    <tr>
      <td>heightToWidthScale(自定义属性)</td>
      <td>无</td>
      <td>普通宽高比  根据指定高和指定比例计算设置宽度 width / height限制条件 必须先 配置 height的大小;</td>
      <td>宽高比的值</td>
    </tr>
    <tr>
      <td>resultString(自定义属性)</td>
      <td>无</td>
      <td>最终结果值, 调用完OSSImageMaker, 需要调用resultString, 取出已经修改过的图片URL</td>
      <td>返回一个e.g http://jyjf-test.oss-cn-hangzhou.aliyuncs.com/cms/201706/1a63a8cf9a5043999b53df72fdafc124.png?x-oss-process=image/resize,w_200,h_400,m_pad,limit_0</td>
    </tr>
  </tbody>
</table>

## Resize(图片缩放使用范例)
- 一下示例使用的图片是张图片宽度 1125 高度 375 的 @3x 的png 图片放在 OSS上面
- URL: http://jyjf-test.oss-cn-hangzhou.aliyuncs.com/cms/201706/1a63a8cf9a5043999b53df72fdafc124.png

### 单边缩放
<img src="Example/OSSImageMaker/截图/Resize/1.png" width="200">
  ```
    //将图缩略成高度为100，宽度按比例处理。
    //因为OSSImageMaker 内置转换了 2x 和3x 所以图片的质量转换后 2x 高度200px 2x 高度 300px
    NSString *str = @"http://jyjf-test.oss-cn-hangzhou.aliyuncs.com/cms/201706/1a63a8cf9a5043999b53df72fdafc124.png";
    NSString *oss_url = str.maker.resize.width(@100).resultString;
    
  ```
 ### 强制宽高缩略
 <img src="Example/OSSImageMaker/截图/Resize/2.png" width="200">
 ```
 //强制缩略宽高 contentModel 为 fiexd
    // frame 宽高 100 则 2x和3x 分别为 200 和 300px
    NSString *str = @"http://jyjf-test.oss-cn-hangzhou.aliyuncs.com/cms/201706/1a63a8cf9a5043999b53df72fdafc124.png";
    NSString *oss_url = str.maker.resize.width(@100).height(@100)
 ```
 ### 等比缩放, 限定在矩形框内
 <img src="Example/OSSImageMaker/截图/Resize/3.png" width="200">
 ```
 //将图缩略成宽度为100，高度为100，按长边优先 contentModel 为lift
    // frame 宽高 100 则 2x和3x 分别为 200 和 300px
    NSString *str = @"http://jyjf-test.oss-cn-hangzhou.aliyuncs.com/cms/201706/1a63a8cf9a5043999b53df72fdafc124.png";
    NSString *oss_url = str.maker.resize.width(@100).height(@100).contentModel(@(OSSImageResizeContentModelTypeLfit)).resultString;
 ```
### 等比缩放, 限定在矩形框内 短边优先
<img src="Example/OSSImageMaker/截图/Resize/4.png" width="200">
```
//将图缩略成宽度为100，高度为100，短边优先 contentModel 为mfit
    // frame 宽高 100 则 2x和3x 分别为 200 和 300px
    NSString *str = @"http://jyjf-test.oss-cn-hangzhou.aliyuncs.com/cms/201706/1a63a8cf9a5043999b53df72fdafc124.png";
    NSString *oss_url = str.maker.resize.width(@100).height(@100).contentModel(@(OSSImageResizeContentModelTypeMfit)).resultString;
```
### 固定宽高，自动裁剪
<img src="Example/OSSImageMaker/截图/Resize/5.png" width="200">

```
//将图缩略成宽度为100，高度为100，contentModel 为fill
    // frame 宽高 100 则 2x和3x 分别为 200 和 300px
    NSString *str = @"http://jyjf-test.oss-cn-hangzhou.aliyuncs.com/cms/201706/1a63a8cf9a5043999b53df72fdafc124.png";
    NSString *oss_url = str.maker.resize.width(@100).height(@100).contentModel(@(OSSImageResizeContentModelTypeFill)).resultString;
```
### 缩略填充
<img src="Example/OSSImageMaker/截图/Resize/6.png" width="200">
```
//将图按短边缩略到100x100, 然后按红色填充 contentModel pad 模式
    // frame 宽高 100 则 2x和3x 分别为 200 和 300px
    NSString *str = @"http://jyjf-test.oss-cn-hangzhou.aliyuncs.com/cms/201706/1a63a8cf9a5043999b53df72fdafc124.png";
    NSString *oss_url = str.maker.resize.width(@100).height(@100).contentModel(@(OSSImageResizeContentModelTypePad)).color(@"ff0000").resultString;
```
### 按比例缩略
<img src="Example/OSSImageMaker/截图/Resize/7.png" width="200">
```
NSString *str = @"http://jyjf-test.oss-cn-hangzhou.aliyuncs.com/cms/201706/1a63a8cf9a5043999b53df72fdafc124.png";
    NSString *oss_url = str.maker.resize.equalRatioScale(@10).resultString;
```


## Author

LDreame, lvguifeng_hsd@126.com

## License

OSSImageMaker is available under the MIT license. See the LICENSE file for more info.
