//
//  VSMarvelAuthentification.h
//  MarvelBrowser
//
//  Created by Vasile Croitoru on 27/03/16.
//  Copyright © 2016 Vasile Croitoru. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VSMarvelAuthentification : NSObject

@property (nonatomic, strong, readonly) NSString *timeStamp;
@property (nonatomic, strong, readonly) NSString *publicKey;
@property (nonatomic, strong, readonly) NSString *privateKey;


-(NSString *) timeStampedKeys;
-(NSString *) MD5OfString:(NSString *)str;
-(NSString *) urlParameters;

@end
