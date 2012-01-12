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
