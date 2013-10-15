//
//    JLTMDbClient.m
//    JLTMDbClient
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

#import "JLTMDbClient.h"

@implementation JLTMDbClient

#pragma mark - Singleton

static JLTMDbClient *_sharedAPIInstance = nil;
static dispatch_once_t onceToken;

+ (instancetype)sharedAPIInstance {
    dispatch_once(&onceToken, ^{
#if DEBUG
        NSURL *url = [NSURL URLWithString:[kJLTMDbAPINoSSL stringByAppendingString:[kJLTMDbAPIBaseURL stringByAppendingString:kJLTMDbAPIVersion]]];
#else
        NSURL *url = [NSURL URLWithString:[kJLTMDbAPISSL stringByAppendingString:[kJLTMDbAPIBaseURL stringByAppendingString:kJLTMDbAPIVersion]]];
#endif
        _sharedAPIInstance = [[self alloc] initWithBaseURL:url];
        _sharedAPIInstance.requestSerializer = [AFJSONRequestSerializer new];
    });
    return _sharedAPIInstance;
}

+ (void)setSharedInstance:(JLTMDbClient *)instance {
    onceToken = 0;
    _sharedAPIInstance = instance;
}

#pragma mark - Public Methods

- (void)GET:(NSString *)service withParameters:(NSDictionary *)parameters
                              andResponseBlock:(JLTMDbClientResponse)block
{
    NSAssert(self.APIKey != nil, @"Please, add your APIKey");
    NSMutableDictionary *keyParameters = parameters ? [parameters mutableCopy] : [@{} mutableCopy];
    keyParameters[@"api_key"] = self.APIKey;
    
    if ([service rangeOfString:@"{id}"].location != NSNotFound) {
        NSAssert(keyParameters[@"id"] != nil, @"Please, add the id");
        if (![keyParameters[@"id"] isKindOfClass:[NSString class]])
            keyParameters[@"id"] = [keyParameters[@"id"] stringValue];
        service = [service stringByReplacingOccurrencesOfString:@"{id}" withString:keyParameters[@"id"]];
    }
    
    [self GET:service parameters:keyParameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        block(responseObject, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        block(nil, error);
    }];
}

@end
