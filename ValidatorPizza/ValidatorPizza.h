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

typedef void (^VPEmailResultBlock)(BOOL isValid, NSDictionary * _Nullable results, NSError * _Nullable error);

@protocol ValidatorPizzaProtocol <NSObject>

@required
- (void)validatorPizza:(nonnull ValidatorPizza *)validator checkedWithResult:(nonnull NSDictionary *)result;

@end

@interface ValidatorPizza : NSObject

/**
 Shared instance
 
 @return Singleton instance
 */
+ (nonnull instancetype)sharedInstance;

/**
 Check with block
 
 @param email Email or domain name
 @param type  VPCheckTypeEmail or VPCheckTypeDomain
 @param block Returns validity, response, and error
 */
- (void)check:(nonnull NSString *)email type:(VPCheckType)type block:(nonnull VPEmailResultBlock)block;

/**
 Check with delegate
 
 @param email    Email or domain name
 @param type     VPCheckTypeEmail or VPCheckTypeDomain
 @param delegate Class to receive callbacks
 */
- (void)check:(nonnull NSString *)email type:(VPCheckType)type delegate:(nonnull id<ValidatorPizzaProtocol>)delegate;

@end
