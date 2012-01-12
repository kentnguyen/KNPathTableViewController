//
//  KNPathTableViewController.h
//  
//
//  Created by Kent Nguyen 12/1/12.
//  Copyright (c) 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KNPathTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
  UIView * __infoPanel;
  CGSize   __infoPanelSize;
  CGFloat  __initalScrollIndicatorHeight;
  UITableView * __tableView;
}

@property (nonatomic,readonly) UIView * infoPanel;
@property (nonatomic,readonly) UITableView * tableView;

-(id)initWithStyle:(UITableViewStyle)style;
-(id)initWithStyle:(UITableViewStyle)style infoPanelSize:(CGSize)size;

@end
