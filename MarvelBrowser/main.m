//
//  main.m
//  MarvelBrowser
//
//  Created by Vasile Croitoru on 26/03/16.
//  Copyright © 2016 Vasile Croitoru. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "TestingAppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        BOOL isTesting = NSClassFromString(@"XCTestCase") != Nil;
        NSLog(@"isTesting : %d",isTesting);
        Class appDelegateClass = isTesting ? [TestingAppDelegate class] : [AppDelegate class];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass(appDelegateClass));
    }
}
