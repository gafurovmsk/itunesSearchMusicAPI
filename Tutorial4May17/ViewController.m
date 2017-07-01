//
//  ViewController.m
//  Tutorial4May17
//
//  Created by iOS-School-1 on 04.05.17.
//  Copyright © 2017 iOS-School-1. All rights reserved.
//

#import "ViewController.h"
#import "ItunesRecordCell.h"
#import "Track.h"
@import Masonry;

static NSString *const cellId = @"cellId";

@interface ViewController ()  <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UISearchBar *searchBar;
@property (strong, nonatomic) NSMutableArray <Track *> *resultList;
@property (strong, nonatomic) NSString *searchText;

@end

@implementation ViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = UIColor.whiteColor;
  self.tableView = [UITableView new];
  [self.view addSubview:self.tableView];
  
  [self.tableView registerClass: ItunesRecordCell.class forCellReuseIdentifier:cellId];
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  
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

#pragma mark - SearchBarDelegate
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
  
  [self.searchBar resignFirstResponder];

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
      
      NSMutableArray *mutableListForCollecting = [NSMutableArray new];
      
      for (id item in jsonDictionary) {
        NSString *artist = [item objectForKey:@"artistName"];
        NSString *track = [item objectForKey:@"trackName"];
        NSString *album = [item objectForKey:@"collectionName"];
        NSString *price = [item objectForKey:@"trackPrice"];
        NSURL *albumURL = [NSURL URLWithString:[item objectForKey:@"artworkUrl100"]];
        NSData *albumData = [NSData dataWithContentsOfURL:albumURL];
        
        Track *anotherTrackFromResponse = [[Track alloc]initWithName:track artist:artist album:album price:price andImage:albumData];
        [mutableListForCollecting addObject:anotherTrackFromResponse];
      }
      self.resultList = mutableListForCollecting;
      [self.tableView reloadData];
      
    }else {
      NSLog(@"%@", error.description);
    }

  }] resume];
  
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
  self.searchBar.showsCancelButton = YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
  self.searchBar.showsCancelButton = NO;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
  [self.searchBar resignFirstResponder];
}

#pragma mark - DataSource,TableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  ItunesRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
  
  cell.albumView.image = [UIImage imageWithData:self.resultList[indexPath.row].albumImage];
  cell.trackPrice.text = [NSString stringWithFormat:@"$%@",self.resultList[indexPath.row].trackPrice];
  cell.trackName.text = self.resultList[indexPath.row].trackName;
  cell.albumName.text = self.resultList[indexPath.row].albumName;
  cell.artistName.text = self.resultList[indexPath.row].artistName;
  
  return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.resultList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return [ItunesRecordCell heightForCell];
}
@end
