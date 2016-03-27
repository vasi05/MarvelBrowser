//
//  TestingMarvelAuthentification.m
//  MarvelBrowser
//
//  Created by Vasile Croitoru on 27/03/16.
//  Copyright © 2016 Vasile Croitoru. All rights reserved.
//

#import "TestingMarvelAuthentification.h"

@implementation TestingMarvelAuthentification

-(NSString *)MD5OfString:(NSString *)str{
    return [NSString stringWithFormat:@"MD5%@MD5",str];
}

@end
