//
//  KNPathTableViewController.h
//  
//
//  Created by Kent Nguyen 12/1/12.
//  Copyright (c) 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

#define KNPathTableFadeInDuration         0.3
#define KNPathTableFadeOutDuration        0.3
#define KNPathTableFadeOutDelay           0.5
#define KNPathTableSlideInOffset         16.0

@interface KNPathTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
  UIView * __infoPanel;
  CGSize   __infoPanelSize;
  CGRect   __infoPanelInitialFrame;
  CGFloat  __initalScrollIndicatorHeight;
  UITableView * __tableView;
}

@property (nonatomic,readonly) UIView * infoPanel;
@property (nonatomic,readonly) UITableView * tableView;

-(id)initWithStyle:(UITableViewStyle)style;
-(id)initWithStyle:(UITableViewStyle)style infoPanelSize:(CGSize)size;

@end
