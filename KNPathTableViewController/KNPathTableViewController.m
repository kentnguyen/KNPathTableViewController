//
//  KNPathTableViewController.m
//  
//
//  Created by Kent Nguyen 12/1/12.
//  Copyright (c) 2012. All rights reserved.
//

#import "KNPathTableViewController.h"


@implementation KNPathTableViewController


- (void)viewDidLoad {
  [super viewDidLoad];
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
