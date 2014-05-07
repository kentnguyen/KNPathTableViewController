//
//  KNInfoLabel.h
//  KNPathTableViewControllerDemo
//
//  Created by Toan Nguyen Huy on 16/1/12.
//  Copyright (c) 2012 Anideo. All rights reserved.
//

#import <UIKit/UIKit.h>

#define KNPathTableFadeInDuration  0.3
#define KNPathTableFadeOutDuration  0.3
#define KNPathTableFadeOutDelay  0.5
#define KNPathTableResizeDuration  0.2
#define KNPathTableSlideInOffset  16.0

@interface KNInfoLabel : UIView{
    UIImageView * __bgView;
    UILabel * __titleLabel;
}

@property (nonatomic, retain) NSString *title;

@end
