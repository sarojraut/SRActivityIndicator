# SRActivityIndicator

[![CI Status](https://img.shields.io/travis/sarojraut/SRActivityIndicator.svg?style=flat)](https://travis-ci.org/sarojraut/SRActivityIndicator)
[![Version](https://img.shields.io/cocoapods/v/SRActivityIndicator.svg?style=flat)](https://cocoapods.org/pods/SRActivityIndicator)
[![License](https://img.shields.io/cocoapods/l/SRActivityIndicator.svg?style=flat)](https://cocoapods.org/pods/SRActivityIndicator)
[![Platform](https://img.shields.io/cocoapods/p/SRActivityIndicator.svg?style=flat)](https://cocoapods.org/pods/SRActivityIndicator)

## Example
![alt text](https://github.com/sarojraut/SRActivityIndicator/blob/master/ezgif.com-resize.gif)

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 10.0+
- Xcode 11

## Installation

SRActivityIndicator is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SRActivityIndicator'
```

#### Carthage
Create a `Cartfile` that lists the framework and run `carthage update`. Follow the [instructions](https://github.com/Carthage/Carthage#if-youre-building-for-ios) to add `$(SRCROOT)/Carthage/Build/iOS/SRActivityIndicator.framework` to an iOS project.

```
github "sarojraut/SRActivityIndicator"
```
#### Manually
1. Download and drop ```SRActivityIndicator.swift``` in your project.  
2. Congratulations!  

## Usage example

```swift
import UIKit
import SRActivityIndicator

class ClassThatUseThisLibrary: UIViewController {

@IBOutlet weak var activityIndicator: SRActivityIndicator!
          
          override func viewDidLoad() {
              super.viewDidLoad()
              activityIndicator.innerStrokeColor = UIColor.white
              activityIndicator.outerStrokeColor = UIColor.clear
              activityIndicator.centerImage = UIImage(named: "globe.jpg")!
              self.activityIndicator.hidesWhenStopped = true
              activityIndicator.startAnimating()
       }
}

```

## Contribute

We would love you for the contribution to **SRActivityIndicator**, check the ``LICENSE`` file for more info.
## Author

sarojraut09@gmail.com

## License

SRActivityIndicator is available under the MIT license. See the LICENSE file for more info.

Copyright (c) 2019 sarojraut09@gmail.com 

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
