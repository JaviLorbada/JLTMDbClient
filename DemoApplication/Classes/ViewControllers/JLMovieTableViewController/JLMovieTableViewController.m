//
//    JLMovieTableViewController.m
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
#import "JLMovieTableViewController.h"
#import "JLMovieDetailViewController.h"

@interface JLMovieTableViewController ()

@end

@implementation JLMovieTableViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadConfiguration];
    self.tableView.rowHeight = 60.0f;
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    [self refresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.moviesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"MovieCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    NSDictionary *movieDict = self.moviesArray[indexPath.row];
    cell.textLabel.text = movieDict[@"original_title"];
    cell.textLabel.textColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
    if (movieDict[@"poster_path"] != [NSNull null]) {
        NSString *imageUrl = [self.imagesBaseUrlString stringByAppendingString:movieDict[@"poster_path"]];
        [cell.imageView setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"TMDB"]];
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    JLMovieDetailViewController *movieDetailViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"JLMovieDetailViewController"];
    movieDetailViewController.movieId = self.moviesArray[indexPath.row][@"id"];
    movieDetailViewController.movieTitle = self.moviesArray[indexPath.row][@"title"];
    movieDetailViewController.imagesBaseUrlString = self.imagesBaseUrlString;
    [self.navigationController pushViewController:movieDetailViewController animated:YES];
}

#pragma mark - Private Methods

- (void) loadConfiguration {
    __block UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", @"") message:NSLocalizedString(@"Please try again later", @"") delegate:self cancelButtonTitle:nil otherButtonTitles:NSLocalizedString(@"Ok", @""), nil];
    [[JLTMDbClient sharedAPIInstance] GET:kJLTMDbConfiguration withParameters:nil andResponseBlock:^(id response, NSError *error) {
        if (!error)
            self.imagesBaseUrlString = [response[@"images"][@"base_url"] stringByAppendingString:@"w92"];
        else
            [errorAlertView show];
    }];
}

- (void) refresh {
    NSArray *optionsArray = @[kJLTMDbMoviePopular, kJLTMDbMovieUpcoming, kJLTMDbMovieTopRated];
    __block UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", @"") message:NSLocalizedString(@"Please try again later", @"") delegate:self cancelButtonTitle:nil otherButtonTitles:NSLocalizedString(@"Ok", @""), nil];
    [[JLTMDbClient sharedAPIInstance] GET:optionsArray[arc4random() % [optionsArray count]] withParameters:nil andResponseBlock:^(id response, NSError *error) {
        if (!error) {
            self.moviesArray = response[@"results"];
            [self.tableView reloadData];
        }else
            [errorAlertView show];
        [self.refreshControl endRefreshing];
    }];
}

@end
