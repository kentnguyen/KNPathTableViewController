//
//  KNThirdViewController.m
//  KNPathTableViewControllerDemo
//
//  Created by My Accounts on 13/1/12.
//  Copyright (c) 2012 Anideo. All rights reserved.
//

#import "KNThirdViewController.h"

@implementation KNThirdViewController

-(id)initWithStyle:(UITableViewStyle)style {
  self = [super initWithStyle:style];
  if (self) {
    self.title = @"Section demo";
    self.tabBarItem.image = [UIImage imageNamed:@"first"];
    
    // Add a series of number
    array = [[NSMutableArray alloc] init];
    for (int k=0;k<100;k++) {
      [array addObject:[NSString stringWithFormat:@"More advance row %d", k]];
    }
  }
  return self;
}

#pragma mark - Showing section title

-(void)infoPanelDidScroll:(UIScrollView *)scrollView atPoint:(CGPoint)point {
  NSIndexPath * indexPath = [self.tableView indexPathForRowAtPoint:point];
  self.infoPanel.title = [NSString stringWithFormat:@"In section %d", indexPath.section+1];
}

#pragma mark - Give table some content

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [array count]/10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"DemoCell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
  }
  
  cell.textLabel.text = [array objectAtIndex:indexPath.row+(indexPath.section*[array count]/10)];
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

#pragma mark - Table header

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  return [NSString stringWithFormat:@"Section number %d", section+1];
}

@end
