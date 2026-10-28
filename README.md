# JLTMDbClient  
[![Version](https://img.shields.io/cocoapods/v/JLTMDbClient.svg?style=flat)](http://cocoadocs.org/docsets/JLTMDbClient) [![License](https://img.shields.io/cocoapods/l/JLTMDbClient.svg?style=flat)](http://cocoadocs.org/docsets/JLTMDbClient) [![Platform](https://img.shields.io/cocoapods/p/JLTMDbClient.svg?style=flat)](http://cocoadocs.org/docsets/JLTMDbClient) [![No Maintenance Intended](http://unmaintained.tech/badge.svg)](http://unmaintained.tech/)

> **This project is no longer maintained.** The repository is archived and no new versions will be released. The last version, 0.4.0, is still available on CocoaPods.

- JLTMDbClient is an iOS wrapper on top of AFNetworking to interact with [themoviedb.org](www.themoviedb.org) API.

## Installation: ##

- JLTMDbClient is available through [CocoaPods](http://cocoapods.org/):
```
pod 'JLTMDbClient', '~> 0.4.0'
```
- [How to install CocoaPods](https://speakerdeck.com/javilorbada/introduction-to-cocoapods?slide=13)

## Demo App:

1. Clone the repository:
```
$ git clone git@github.com:JaviLorbada/JLTMDbClient.git
```
2. Open the ```.xcworkspace``` file to see the example:
```
$ open JLTMDbClient.xcworkspace
```
3. Run JLTMDbClient target to see a simple visual example.
4. Run JLTMDbClientTests target to see different cases on how to use the API.

## Usage: ##

1. Get your API KEY from [themoviedb.org](http://www.themoviedb.org/documentation/api)

> "A TMDb user account is required to request an API key. Commercial users are approved on a per application basis. As always, you must attribute TMDb as the source of your data. Please be sure to read the [API FAQ](http://www.themoviedb.org/faq/api)"

2. Add JLTMDbClient to your application, and set up your API KEY.

```
#import <JLTMDbClient.h>
```

```
[[JLTMDbClient sharedAPIInstance] setAPIKey:@"API_KEY"];
```
3. Call a service to get the response from the server *, i.e:


```
[[JLTMDbClient sharedAPIInstance] GET:kJLTMDbMoviePopular withParameters:nil andResponseBlock:^(id response, NSError *error) {
    if(!error){
        fetchedData = response;
        NSLog(@"Popular Movies: %@",fetchedData);
    }
}];
```

* [Table of contents](https://github.com/JaviLorbada/JLTMDbClient/blob/master/JLTMDbClient/JLTMDbClientDefines.h)

## Unit Tests: ##

- JLTMDbClient includes unit tests. In order to run the unit tests, you need to add your API_KEY. Then you can execute the tests using JLTMDbClientTests scheme within Xcode.

### Using xctool

- Tests can also be run from the command line or within a continuous integration environment with [`xctool`](https://github.com/facebook/xctool), which can be installed with [Homebrew](http://brew.sh):

```
$ brew update
$ brew install xctool --HEAD
```

> "JLTMDBClientTests requires xctool [0.1.14](https://github.com/facebook/xctool/releases/tag/v0.1.14) or above"

- Once `xctool` is installed, you can execute the tests via `rake test`.

### Using XCPretty

- Tests can also be run from the command line or within a continuous integration environment with [`XCPretty`](https://github.com/mneorr/XCPretty), which can be installed:

```
$ gem install xcpretty
```

> "XCPretty requires Ruby 1.8.7 or above."

- Once `XCPretty` is installed, you can execute the tests via `make test` or `make ci`.

## Compatibility: ##

- Compatible with [iOS 7.0](https://developer.apple.com/library/ios/releasenotes/General/WhatsNewIniOS/Articles/iOS7.html).
- Does require ARC. 

## Dependencies: ##

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) 3.0.0 or superior.

## License: ##

- JLTMDbClient is released under a [MIT-License](http://opensource.org/licenses/MIT). See [License](https://github.com/JaviLorbada/JLTMDbClient/blob/master/LICENSE) file for more info.

## Contact: ##

- [Javi Lorbada](mailto:javugi@gmail.com) 
- Follow [@javi_lorbada](https://twitter.com/javi_lorbada) on twitter
- [http://javilorbada.me/](http://javilorbada.me/)


