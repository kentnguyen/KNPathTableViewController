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
    __tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 320) style:style];
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
  __infoPanelInitialFrame = CGRectMake(-__infoPanelSize.width, 0, __infoPanelSize.width, __infoPanelSize.height);
  __infoPanel = [[UIView alloc] initWithFrame:__infoPanelInitialFrame];

  // Initialize overlay panel with stretchable background
  UIImageView * bg = [[UIImageView alloc] initWithFrame:__infoPanel.bounds];
  UIImage * overlay = [UIImage imageNamed:@"KNTableOverlay"];
  bg.image = [overlay stretchableImageWithLeftCapWidth:overlay.size.width/2.0 topCapHeight:overlay.size.height/2.0];
  [__infoPanel setAlpha:0];
  [__infoPanel addSubview:bg];
}

#pragma mark - Scroll view delegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
  // Find the indicator and calculate correct position
  UIView * indicator = [[scrollView subviews] lastObject];
  __initalScrollIndicatorHeight = indicator.frame.size.height;
  CGRect f = __infoPanelInitialFrame;
  f.origin.y = __initalScrollIndicatorHeight/2 - f.size.height/2;

  // Starting from beginning
  if ([__infoPanel superview] == nil) {
    // Add it to indicator
    [indicator addSubview:__infoPanel];

		// Prepare to slide in
    CGRect f2 = f;
    f2.origin.x += KNPathTableSlideInOffset;
		[__infoPanel setFrame:f2];

    // Fade in and slide left
    [UIView animateWithDuration:KNPathTableFadeInDuration
                     animations:^{
      __infoPanel.alpha = 1;
      __infoPanel.frame = f;
    }];
	}
  
  // If it is waiting to fade out, then maintain position
  else if ([__infoPanel superview] == self.view) {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(slideOutInfoPanel) object:nil];
    [__infoPanel removeFromSuperview];
    [indicator addSubview:__infoPanel];
    __infoPanel.frame = f;
  }
}

- (void)scrollViewDidScroll:(UIScrollView *)aScrollView {
//  UIView * indicator = [[aScrollView subviews] lastObject];
//  CGRect indicatorFrame = [indicator frame];
//  CGFloat x = self.tableView.frame.size.width-__infoPanel.frame.size.width/2.0;
//  CGFloat y = indicatorFrame.origin.y - aScrollView.contentOffset.y + indicatorFrame.size.height/2.0;
//  __infoPanel.center = CGPointMake(x, y);
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
  // Remove it from indicator view but maintain position
  UIView * indicator = [[scrollView subviews] lastObject];
  CGRect f = [self.view convertRect:__infoPanel.frame fromView:indicator];
  [__infoPanel removeFromSuperview];
  __infoPanel.frame = f;
  [self.view addSubview:__infoPanel];
  [self performSelector:@selector(slideOutInfoPanel) withObject:nil afterDelay:KNPathTableFadeOutDelay];
}

-(void)slideOutInfoPanel {
  CGRect f = __infoPanel.frame;
  f.origin.x += KNPathTableSlideInOffset;
  [UIView animateWithDuration:KNPathTableFadeOutDuration
                   animations:^{
    __infoPanel.alpha = 0;
    __infoPanel.frame = f;
  } completion:^(BOOL finished) {
    [__infoPanel removeFromSuperview];
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
