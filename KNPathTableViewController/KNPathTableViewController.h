//
//  KNPathTableViewController.h
//  
//
//  Created by Kent Nguyen 12/1/12.
//  Copyright (c) 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KNPathTableViewController : UITableViewController {
  UIView * __infoPanel;
  CGSize   __infoPanelSize;
  CGFloat  initalScrollIndicatorHeight;
}

@property (nonatomic,readonly) UIView * infoPanel;

-(id)initWithStyle:(UITableViewStyle)style infoPanelSize:(CGSize)size;

@end
