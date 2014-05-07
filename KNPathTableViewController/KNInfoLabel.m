//
//  KN__titleLabel.m
//  KNPathTableViewControllerDemo
//
//  Created by Toan Nguyen Huy on 16/1/12.
//  Copyright (c) 2012 Anideo. All rights reserved.
//

#import "KNInfoLabel.h"


@implementation KNInfoLabel

@synthesize title;

- (id)init
{
    self = [super initWithFrame:CGRectMake(0, 0, 150, 32)];
    if (self) {
        __bgView = [[UIImageView alloc] initWithFrame:self.bounds];
        UIImage * overlay = [UIImage imageNamed:@"KNTableOverlay"];
        __bgView.image = [overlay stretchableImageWithLeftCapWidth:overlay.size.width/2.0 
                                                topCapHeight:overlay.size.height/2.0];
        
        [self addSubview:__bgView];
        
        __titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 4, 140, 20)];
        __titleLabel.font = [UIFont boldSystemFontOfSize:12];
        __titleLabel.textAlignment = UITextAlignmentLeft;
        __titleLabel.textColor = [UIColor whiteColor];
        __titleLabel.shadowColor = [UIColor blackColor];
        __titleLabel.backgroundColor = [UIColor clearColor];
        __titleLabel.shadowOffset = CGSizeMake(0, -1);
        [self addSubview:__titleLabel];
    }
    return self;
}

- (NSString *) getTitle{
    return __titleLabel.text;
}

- (void) setTitle:(NSString *)newTitle{
    if (newTitle) {
        __titleLabel.text = newTitle;
        
        CGSize textSize = [newTitle sizeWithFont:__titleLabel.font];
        CGSize newSize = CGSizeMake(textSize.width + 35, textSize.height);
        
        self.frame = CGRectMake(-newSize.width,
                                self.frame.origin.y,
                                newSize.width,
                                self.frame.size.height);
        __bgView.frame = self.bounds;
    }
}


@end
