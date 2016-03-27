//
//  VSMarvelAuthentification.m
//  MarvelBrowser
//
//  Created by Vasile Croitoru on 27/03/16.
//  Copyright © 2016 Vasile Croitoru. All rights reserved.
//

#import "VSMarvelAuthentification.h"
#import "MarvelKeys.h"

@interface VSMarvelAuthentification()

@property (nonatomic, strong, readwrite) NSString *timeStamp;
@property (nonatomic, strong, readwrite) NSString *publicKey;
@property (nonatomic, strong, readwrite) NSString *privateKey;

@end

@implementation VSMarvelAuthentification



-(NSString *)timeStamp{
    if(!_timeStamp){
        _timeStamp = @([NSDate date].timeIntervalSinceReferenceDate).stringValue;
    }
    return _timeStamp;
    
}

-(NSString *)publicKey{
    if(!_publicKey){
        _publicKey = MarvelPublicKey;
    }
    return _publicKey;
}

-(NSString *)privateKey{
    if(!_privateKey){
        _privateKey = MarvelPrivateKey;
    }
    return _privateKey;
}

@end
