//
//  KNFirstViewController.m
//  KNPathTableViewControllerDemo
//
//  Created by Kent Nguyen on 12/1/12.
//  Copyright (c) 2012. All rights reserved.
//

#import "KNFirstViewController.h"

@implementation KNFirstViewController

-(id)initWithStyle:(UITableViewStyle)style {
  self = [super initWithStyle:style];
  if (self) {
    self.title = @"Demo";
    self.tabBarItem.image = [UIImage imageNamed:@"first"];

    // Add a series of number
    array = [[NSMutableArray alloc] init];
    for (int k=0;k<100;k++) {
      [array addObject:[NSString stringWithFormat:@"Test row number %d", k]];
    }
  }
  return self;
}

#pragma mark - Basic use for the info panel

-(void)viewDidLoad {
  [super viewDidLoad];
  infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 4, 140, 20)];
  infoLabel.font = [UIFont boldSystemFontOfSize:12];
  infoLabel.textAlignment = UITextAlignmentLeft;
  infoLabel.textColor = [UIColor whiteColor];
  infoLabel.shadowColor = [UIColor blackColor];
  infoLabel.backgroundColor = [UIColor clearColor];
  infoLabel.shadowOffset = CGSizeMake(0, 1);
  // [self.infoPanel addSubview:infoLabel] // this will not work, too early to add
}

-(void)infoPanelWillAppear:(UIScrollView *)scrollView {
  if (![infoLabel superview]) [self.infoPanel addSubview:infoLabel];
}

-(void)infoPanelDidScroll:(UIScrollView *)scrollView atPoint:(CGPoint)point {
  NSIndexPath * indexPath = [self.tableView indexPathForRowAtPoint:point];
  infoLabel.text = [NSString stringWithFormat:@"Something about %d", indexPath.row];
}

#pragma mark - Give table some content

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"DemoCell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
  }

  cell.textLabel.text = [array objectAtIndex:indexPath.row];
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}


@end
