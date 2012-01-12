//
//  KNAppDelegate.m
//  KNPathTableViewControllerDemo
//
//  Created by Kent Nguyen on 12/1/12.
//  Copyright (c) 2012. All rights reserved.
//

#import "KNAppDelegate.h"
#import "KNFirstViewController.h"
#import "KNSecondViewController.h"

@implementation KNAppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

  KNFirstViewController *viewController1 = [[KNFirstViewController alloc] initWithStyle:UITableViewStylePlain];
  UIViewController *viewController2 = [[KNSecondViewController alloc] initWithNibName:@"KNSecondViewController" bundle:nil];
  self.tabBarController = [[UITabBarController alloc] init];
  self.tabBarController.viewControllers = [NSArray arrayWithObjects:viewController1, viewController2, nil];
  self.window.rootViewController = self.tabBarController;
  [self.window makeKeyAndVisible];
  return YES;
}

@end
