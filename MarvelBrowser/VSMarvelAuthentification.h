//
//  VSMarvelAuthentification.h
//  MarvelBrowser
//
//  Created by Vasile Croitoru on 27/03/16.
//  Copyright © 2016 Vasile Croitoru. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VSMarvelAuthentification : NSObject

+(NSString *)timeStamp;
+(NSString *)publicKey;
+(NSString *)privateKey;

@end
