//
//  KNPathTableViewController.m
//  
//
//  Created by Kent Nguyen 12/1/12.
//  Copyright (c) 2012. All rights reserved.
//

#import "KNPathTableViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation KNPathTableViewController

#pragma mark - The properties

@synthesize infoPanel = __infoPanel;
@synthesize tableView = __tableView;

#pragma mark - Custom init

-(id)initWithStyle:(UITableViewStyle)style {
  if ((self = [self initWithStyle:style infoPanelSize:CGSizeMake(150, 32)])) {
  }
  return self;
}

-(id)initWithStyle:(UITableViewStyle)style infoPanelSize:(CGSize)size {
  if ((self = [super init])) {
    __infoPanelSize = size;
    __tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:style];
    __tableView.delegate = self;
    __tableView.dataSource = self;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:__tableView];
  }
  return self;
}

#pragma mark - View lifecycle

-(void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  // The panel
  __infoPanel = [[UIView alloc] initWithFrame:CGRectMake(0, 0, __infoPanelSize.width, __infoPanelSize.height)];

  // Initialize overlay panel with stretchable background
  UIImageView * bg = [[UIImageView alloc] initWithFrame:__infoPanel.bounds];
  UIImage * overlay = [UIImage imageNamed:@"KNTableOverlay"];
  bg.image = [overlay stretchableImageWithLeftCapWidth:overlay.size.width/2.0 topCapHeight:overlay.size.height/2.0];
  [__infoPanel setAlpha:0];
  [__infoPanel addSubview:bg];
  [self.view addSubview:__infoPanel];
}

#pragma mark - Scroll view delegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)aScrollView {
  [UIView animateWithDuration:0.5 animations:^{
    __infoPanel.alpha = 1;
  }];
}

- (void)scrollViewDidScroll:(UIScrollView *)aScrollView {
  UIView * indicator = [[aScrollView subviews] lastObject];
  CGRect indicatorFrame = [indicator frame];
  CGFloat x = self.tableView.frame.size.width-__infoPanel.frame.size.width/2.0;
  CGFloat y = indicatorFrame.origin.y - aScrollView.contentOffset.y + indicatorFrame.size.height/2.0;
  __infoPanel.center = CGPointMake(x, y);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
  [UIView animateWithDuration:0.5 animations:^{
    __infoPanel.alpha = 0;
  }];
}

#pragma mark - Blank implementations

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"Cell";

  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
      cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
  }

  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

#pragma mark - Used to be dealloc here

@end
