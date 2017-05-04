//
//  ViewController.m
//  Tutorial4May17
//
//  Created by iOS-School-1 on 04.05.17.
//  Copyright © 2017 iOS-School-1. All rights reserved.
//

#import "ViewController.h"
@import Masonry;

NSString const *cellId = @"cellId";

@interface ViewController ()  <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>
@property (nonatomic, strong) UITableView* tableView;
@property (strong, nonatomic) UISearchBar *searchBar;
@property (strong, nonatomic) NSMutableArray *resultList;
@property (strong, nonatomic) NSString *searchText;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.tableView = [UITableView new];
    [self.view addSubview:self.tableView];
    
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
    [self.searchBar sizeToFit];
    
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"Search music";
    self.tableView.tableHeaderView = self.searchBar;
    
    
    //    self.searchBar.showsScopeBar = YES;
    //    self.searchBar.scopeButtonTitles = [NSArray arrayWithObjects:@"Flags", @"Listeners", @"Stations", nil];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    
    
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    NSString *baseURL = @"https://itunes.apple.com/search?term=";
    self.searchText = [self.searchBar.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    NSString *forRequest = [baseURL stringByAppendingString:self.searchText];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration: [NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:forRequest]];
    
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (!error) {
            NSError *error;
            NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:nil error:&error];
            
            
            jsonDictionary = [jsonDictionary objectForKey:@"results"];
            
            
            
            
            
        }else {
            NSLog(@"%@", error.description);
        }
        
        
    }] resume];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    // Configure the cell...
    if (self.isSearching) {
        cell.textLabel.text = [self.filteredContentList objectAtIndex:indexPath.row];
    }
    else {
        cell.textLabel.text = [self.contentList objectAtIndex:indexPath.row];
    }
    return cell;}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.isSearching) {
        return [self.filteredContentList count];
    }
    else {
        return [self.contentList count];
    }
}
@end










//    NSURLSessionConfiguration *customConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:customConfig];
//
//
//    NSURL *url = [NSURL URLWithString:@"https://google.com"];
//
//    NSMutableURLRequest *request = [NSMutableURLRequest new];
//    [request setURL:url];
//    [request setHTTPMethod:@"GET"];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//
//    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSString *responseStr = [[NSString alloc] initWithData:data encoding:NSWindowsCP1251StringEncoding];
//        NSLog(@"JSON: %@", responseStr);
//    }];
//    [task resume];
//
//    url = [NSURL URLWithString:@"http://is3.mzstatic.com/image/thumb/Music/v4/9c/12/98/9c1298e9-cbd1-f32a-dab3-5145807c00d8/source/30x30bb.jpg"];
//
//    [[session downloadTaskWithURL:url] resume];
