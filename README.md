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
      <td>contentModel</td>
      <td>m</td>
      <td>指定缩略的模式：lfit：等比缩放，限制在设定在指定w与h的矩形内的最大图片。mfit：等比缩放，延伸出指定w与h的矩形框外的最小图片。fill：固定宽高，将延伸出指定w与h的矩形框外的最小图片进行居中裁剪。pad：固定宽高，缩略填充fixed：固定宽高，强制缩略</td>
      <td></td>
    </tr>
    
  </tbody>
</table>
```

## Author

LDreame, lvguifeng_hsd@126.com

## License

OSSImageMaker is available under the MIT license. See the LICENSE file for more info.
