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
  }
  return self;
}

@end
