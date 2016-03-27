//
//  VSMarvelAuthentification.m
//  MarvelBrowser
//
//  Created by Vasile Croitoru on 27/03/16.
//  Copyright © 2016 Vasile Croitoru. All rights reserved.
//

#import "VSMarvelAuthentification.h"

@implementation VSMarvelAuthentification

+(NSString *)timeStamp{
    return @([NSDate date].timeIntervalSinceReferenceDate).stringValue;
}

@end
