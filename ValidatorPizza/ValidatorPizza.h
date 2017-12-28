//
//  ValidatorPizza.h
//  ValidatorPizza
//
//  Created by Ryan Cohen on 6/30/17.
//  Copyright © 2017 Ryan Cohen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ValidatorPizza;

typedef NS_ENUM(NSUInteger, VPCheckType) {
    VPCheckTypeEmail,
    VPCheckTypeDomain
};

typedef void (^VPResultBlock)(BOOL isValid, NSDictionary * _Nullable results, NSError * _Nullable error);

@interface ValidatorPizza : NSObject

/**
 Validate email or domain with block
 
 Returns @c VPResultBlock containing a boolean value @c isValid
 for general validity, a dictionary containing a response, and
 an @c NSError object if an error occurs.
 
 @param value Email or domain name
 @param type  VPCheckTypeEmail or VPCheckTypeDomain
 @param block Returns validity, response, and error
 */
+ (void)validate:(NSString * _Nonnull)value type:(VPCheckType)type block:(nonnull VPResultBlock)block;

@end
