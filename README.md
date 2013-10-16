JLTMDbClient
==============

- JLTMDbClient is an iOS wrapper on top of AFNetworking to interact with [themoviedb.org](www.themoviedb.org) API.

## Installation: ##

- The best way to get JLTMDbClient is by using [CocoaPods](http://cocoapods.org/). 
- [How to install CocoaPods](https://speakerdeck.com/javilorbada/introduction-to-cocoapods?slide=13)

## Demo App: ##

1. Clone the repository:
```
$ git clone git@github.com:JaviLorbada/JLTMDbClient.git
```
2. Installing Pods:
```
$ pod install --verbose
```
3. Open the ```.xcworkspace``` file to see the example:
```
$ open JLTMDbClient.xcworkspace
```

4. Run JLTMDbClient target to see a simple visual example.


 ![Screenshot](https://dl.dropboxusercontent.com/u/27371680/Images/Github/JLTMDbClient/MovieList_1.png) 
 ![Screenshot](https://dl.dropboxusercontent.com/u/27371680/Images/Github/JLTMDbClient/MovieDetail_1.png) 

5. Run JLTMDbClientTests target to see different cases on how to use the API.

## Usage: ##

- First, add JLTMDbClient to your application, and set up your API KEY.

```
#import <JLTMDbClient.h>
```

```
[[JLTMDbClient sharedAPIInstance] setAPIKey:@"API_KEY"];
```
- Second, call a service to get the response from the server, i.e:


```
[[JLTMDbClient sharedAPIInstance] GET:kJLTMDbMoviePopular withParameters:nil andResponseBlock:^(id response, NSError *error) {
    if(!error){
        fetchedData = response;
        NSLog(@"Popular Movies: %@",fetchedData);
    }
}];
```

## Unit Tests: ##

- JLTMDbClient includes unit tests. In order to run the unit tests, you must install the testing dependencies via CocoaPods:

```
$ pod install --verbose
```

- Once testing dependencies are installed, you can execute the tests using JLTMDbClientTests scheme within Xcode.

### Using xctool

- Tests can also be run from the command line or within a continuous integration environment with [`xctool`](https://github.com/facebook/xctool), which can be installed with [Homebrew](http://brew.sh):

```
$ brew update
$ brew install xctool --HEAD
```

- Once `xctool` is installed, you can execute the tests via `rake test`.

- Update: since `xctool` isn't working to me due to [this issue](https://github.com/facebook/xctool/issues/187) for the moment the `rake test` will execute [`xcodebuild`](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/xcodebuild.1.html) instead.

## Compatibility: ##

- Compatible with [iOS 7.0](https://developer.apple.com/library/ios/releasenotes/General/WhatsNewIniOS/Articles/iOS7.html).
- Does require ARC. 

## Dependencies: ##

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) 2.0.0 or superior.

## License: ##

- JLTMDbClient is released under a [MIT-License](http://opensource.org/licenses/MIT). See [LICENSE](https://github.com/JaviLorbada/JLTMDbClient/blob/master/LICENSE) file for more info.

## Contact: ##

- [Javi Lorbada](mailto:javugi@gmail.com) 
- Follow [@javi_lorbada](https://twitter.com/javi_lorbada) on twitter
- [http://javilorbada.me/](http://javilorbada.me/)
.
