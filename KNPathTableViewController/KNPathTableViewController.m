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

#pragma mark - Custom init

-(id)initWithStyle:(UITableViewStyle)style {
  if ((self = [self initWithStyle:style infoPanelSize:CGSizeMake(32, 150)])) {
  }
  return self;
}

-(id)initWithStyle:(UITableViewStyle)style infoPanelSize:(CGSize)size {
  if ((self = [super initWithStyle:style])) {
    __infoPanelSize = size;
  }
  return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
  // Determine the size of background image and make stretchable background
  CGSize s = [UIImage imageNamed:@"KNTableOverlay"].size;
	__infoPanel = [[UIView alloc] initWithFrame:CGRectMake(-__infoPanelSize.width, 0, __infoPanelSize.width, __infoPanelSize.height)];
  __infoPanel.backgroundColor = [UIColor colorWithPatternImage:[[UIImage imageNamed:@"KNTableOverlay"] stretchableImageWithLeftCapWidth:s.width/2 topCapHeight:s.height/2]];
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
