//
//    JLMovieDetailViewController.m
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

#import <UIImageView+AFNetworking.h>
#import <JLTMDbClient.h>
#import "JLMovieDetailViewController.h"

@interface JLMovieDetailViewController ()

@end

@implementation JLMovieDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationItem.title = self.movieTitle;
    __block NSString *imageBackdrop;
    __block UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", @"") message:NSLocalizedString(@"Please try again later", @"") delegate:self cancelButtonTitle:nil otherButtonTitles:NSLocalizedString(@"Ok", @""), nil];
    [[JLTMDbClient sharedAPIInstance] GET:kJLTMDbMovie withParameters:@{@"id":self.movieId} andResponseBlock:^(id response, NSError *error) {
        if (!error) {
            self.movieDict = response;
            if (self.movieDict[@"backdrop_path"] != [NSNull null]){
                imageBackdrop = [self.imagesBaseUrlString stringByReplacingOccurrencesOfString:@"w92" withString:@"w780"];
                [self.movieCoverImageView setImageWithURL:[NSURL URLWithString:[imageBackdrop stringByAppendingString:self.movieDict[@"backdrop_path"]]]];
            } else {
                imageBackdrop = [self.imagesBaseUrlString stringByReplacingOccurrencesOfString:@"w92" withString:@"w500"];
                [self.movieCoverImageView setImageWithURL:[NSURL URLWithString:[imageBackdrop stringByAppendingString:self.movieDict[@"poster_path"]]]];
            }
        }else
            [errorAlertView show];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.movieDescriptionTextView.text = self.movieDict[@"overview"];
    self.movieDescriptionTextView.font = [UIFont systemFontOfSize:17];
    self.movieDescriptionTextView.textColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0];
}

@end
