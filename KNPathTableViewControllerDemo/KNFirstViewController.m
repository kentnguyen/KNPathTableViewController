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
    self.title = @"Basic demo";
    self.tabBarItem.image = [UIImage imageNamed:@"first"];

    // Add a series of number
    array = [[NSMutableArray alloc] init];
    for (int k=0;k<100;k++) {
      if(k < 30){
        [array addObject:[NSString stringWithFormat:@"Row %d", k]];
      }
      else if(k < 60) {
        [array addObject:[NSString stringWithFormat:@"Longer row %d", k]];
      }
      else {
       [array addObject:[NSString stringWithFormat:@"Even longer row %d", k]]; 
      }
    }
  }
  return self;
}

#pragma mark - Basic use for the info panel

-(void)viewDidLoad {
  [super viewDidLoad];
  
  // [self.infoPanel addSubview:infoLabel] // this will not work, too early to add
}

-(void)infoPanelWillAppear:(UIScrollView *)scrollView {
}

-(void)infoPanelDidScroll:(UIScrollView *)scrollView atPoint:(CGPoint)point {
  NSIndexPath * indexPath = [self.tableView indexPathForRowAtPoint:point];
  self.infoPanel.title = [__tableView cellForRowAtIndexPath:indexPath].textLabel.text;
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
