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
  if ((self = [self initWithStyle:style infoPanelSize:CGSizeMake(150, 32)])) {
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
  // The panel
  __infoPanel = [[UIView alloc] initWithFrame:CGRectMake(-__infoPanelSize.width, 0, __infoPanelSize.width, __infoPanelSize.height)];

  // Determine the size of background image
  UIImageView * bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, __infoPanelSize.width, __infoPanelSize.height)];
  UIImage * overlay = [UIImage imageNamed:@"KNTableOverlay"];
  bg.image = [overlay stretchableImageWithLeftCapWidth:overlay.size.width/2 topCapHeight:overlay.size.height/2];
  [__infoPanel addSubview:bg];
}

#pragma mark - Scroll view delegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)aScrollView {
	if (![__infoPanel superview]) {
		UIView * indicator = [[aScrollView subviews] lastObject];
		CGRect indicatorFrame = [indicator frame];
		__initalScrollIndicatorHeight = indicatorFrame.size.height;

		[[__infoPanel layer] setBackgroundColor:[[indicator layer] backgroundColor]];
		[[indicator layer] addSublayer:[__infoPanel layer]];

		// Center the info panel
		CGRect infoPanelFrame = [__infoPanel frame];
		infoPanelFrame.size = __infoPanelSize;
		infoPanelFrame.origin.y = indicatorFrame.size.height / 2 - infoPanelFrame.size.height / 2;
		[__infoPanel setFrame:CGRectIntegral(infoPanelFrame)];
	}
}

- (void)scrollViewDidScroll:(UIScrollView *)aScrollView {
	UIView *indicator = [[aScrollView subviews] lastObject];
	CGRect indicatorFrame = [indicator frame];

	// We are somewhere at the edge (top or bottom)
	if (indicatorFrame.size.height < __initalScrollIndicatorHeight) {
		CGRect infoPanelFrame = [__infoPanel frame];

		// The indicator starts shrinking, so we need to adjust our info panel's y-origin to stays centered
		if (indicatorFrame.size.height > infoPanelFrame.size.height + 2) 
			infoPanelFrame.origin.y = (indicatorFrame.size.height / 2) - (infoPanelFrame.size.height / 2);
		// We are at the bottom of the screen and the indicator is now smaller than our info panel
		else if (indicatorFrame.origin.y > 0)
			infoPanelFrame.origin.y = (infoPanelFrame.size.height - indicatorFrame.size.height) * -1;

		[__infoPanel setFrame:infoPanelFrame];
	}
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
	[__infoPanel removeFromSuperview];
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
