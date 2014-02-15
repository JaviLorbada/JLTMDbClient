//
//    JLTMDbClientTests.m
//    JLTMDbClientTests
//
//    Copyright (c) 2013 Javi Lorbada (http://javilorbada.me/)
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy of
//    this software and associated documentation files (the "Software"), to deal in
//    the Software without restriction, including without limitation the rights to
//    use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//    the Software, and to permit persons to whom the Software is furnished to do so,
//    subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//    FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//    COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//    IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//    CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import <XCTest/XCTest.h>
#import <Kiwi.h>
#import <JLTMDbClient.h>

SPEC_BEGIN(JLTMDbClientSpec)

describe(@"", ^{
    
    static int timeout = 5;
    
    context(@"JLTMDbClient", ^{
        beforeAll(^{
            // Reset the singleton
            [JLTMDbClient setSharedInstance:nil];
        });
        
        it(@"Should instantiate using init", ^ {
            [[[[JLTMDbClient alloc]init] should] beNonNil];
        });
        
        it(@"Should instantiate using sharedInstance", ^{
            [[[JLTMDbClient sharedAPIInstance] should] beNonNil];
        });
        
        it(@"Should return the same instance twice using sharedInstance", ^{
            JLTMDbClient *a = [JLTMDbClient sharedAPIInstance];
            JLTMDbClient *b = [JLTMDbClient sharedAPIInstance];
            [[a should] beIdenticalTo:b];
        });
        
        it(@"Should not return the same instance twice using init", ^{
            JLTMDbClient *a = [[JLTMDbClient alloc] init];
            JLTMDbClient *b = [[JLTMDbClient alloc] init];
            [[a shouldNot] beIdenticalTo:b];
        });
        
        it(@"APIKey should be filled up", ^{
            //Should introduce your API key in order to get test working
            [[JLTMDbClient sharedAPIInstance] setAPIKey:@"API_KEY"];
            [[[JLTMDbClient sharedAPIInstance].APIKey should] beNonNil];
            [[[JLTMDbClient sharedAPIInstance].APIKey shouldNot] equal:@""];
            [[[JLTMDbClient sharedAPIInstance].APIKey should] beKindOfClass:[NSString class]];
        });
        
    });
    
    context(@"Configuration", ^{
        
        beforeEach(^{
            [[[JLTMDbClient sharedAPIInstance].APIKey should]beNonNil];
            [[[JLTMDbClient sharedAPIInstance].APIKey shouldNot]equal:@""];
        });
        
        it(@"Should get the system wide configuration information", ^{
            __block id fetchedData = nil;
            
            [[JLTMDbClient sharedAPIInstance] GET:kJLTMDbConfiguration withParameters:nil andResponseBlock:^(id response, NSError *error) {
                if(!error){
                    fetchedData = response;
                    NSLog(@"Configuration: %@",fetchedData);
                }
            }];
            [[expectFutureValue(fetchedData) shouldEventuallyBeforeTimingOutAfter(timeout)] beNonNil];
            [[expectFutureValue(fetchedData) shouldEventuallyBeforeTimingOutAfter(timeout)] beKindOfClass:[NSDictionary class]];
            [[expectFutureValue(fetchedData[@"images"][@"base_url"]) shouldEventually] beKindOfClass:[NSString class]];
        });
        
    });
    
    context(@"Movies", ^{
        
        beforeEach(^{
            [[[JLTMDbClient sharedAPIInstance].APIKey should]beNonNil];
            [[[JLTMDbClient sharedAPIInstance].APIKey shouldNot]equal:@""];
        });
        
        it(@"Should receive Movie data within one second", ^{
            __block id fetchedData = nil;
            
            [[JLTMDbClient sharedAPIInstance] GET:kJLTMDbMovie withParameters:@{@"id": @"72190"} andResponseBlock:^(id response, NSError *error) {
                if(!error){
                    fetchedData = response;
                    NSLog(@"Movie: %@",fetchedData);
                }
            }];
            [[expectFutureValue(fetchedData) shouldEventuallyBeforeTimingOutAfter(timeout)] beNonNil];
            [[expectFutureValue(fetchedData) shouldEventuallyBeforeTimingOutAfter(timeout)] beKindOfClass:[NSDictionary class]];
        });
        
        it(@"Should receive Movie Images data within one second", ^{
            __block id fetchedData = nil;
            
            [[JLTMDbClient sharedAPIInstance] GET:kJLTMDbMovieImages withParameters:@{@"id": @"72190"} andResponseBlock:^(id response, NSError *error) {
                if(!error){
                    fetchedData = response;;
                    NSLog(@"Movie Images: %@",fetchedData);
                }
            }];
            [[expectFutureValue(fetchedData) shouldEventuallyBeforeTimingOutAfter(timeout)] beNonNil];
            [[expectFutureValue(fetchedData) shouldEventuallyBeforeTimingOutAfter(timeout)] beKindOfClass:[NSDictionary class]];
            [[expectFutureValue(fetchedData[@"backdrops"]) shouldEventuallyBeforeTimingOutAfter(timeout)] beKindOfClass:[NSArray class]];
            [[expectFutureValue(fetchedData[@"posters"]) shouldEventuallyBeforeTimingOutAfter(timeout)] beKindOfClass:[NSArray class]];
        });
        
        it(@"Should receive Popular Movies data within one second", ^{
            __block id fetchedData = nil;
            
            [[JLTMDbClient sharedAPIInstance] GET:kJLTMDbMoviePopular withParameters:nil andResponseBlock:^(id response, NSError *error) {
                if(!error){
                    fetchedData = response;
                    NSLog(@"Popular Movies: %@",fetchedData);
                }
            }];
            [[expectFutureValue(fetchedData) shouldEventuallyBeforeTimingOutAfter(timeout)] beNonNil];
            [[expectFutureValue(fetchedData) shouldEventuallyBeforeTimingOutAfter(timeout)] beKindOfClass:[NSDictionary class]];
        });
    });
    
    context(@"Error handling", ^{
        it(@"Should get an error", ^{
            __block NSError *requestError = nil;
            
            [[JLTMDbClient sharedAPIInstance] GET:@"error" withParameters:nil andResponseBlock:^(id response, NSError *error) {
                if(error){
                    requestError = error;
                    NSLog(@"Error: %@",requestError.description);
                }
            }];
            [[expectFutureValue(requestError) shouldEventuallyBeforeTimingOutAfter(timeout)] beNonNil];
            [[expectFutureValue(requestError) shouldEventuallyBeforeTimingOutAfter(timeout)] beKindOfClass:[NSError class]];
        });
    });
    
});

SPEC_END
