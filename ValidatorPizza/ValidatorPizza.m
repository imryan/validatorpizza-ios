//
//  ValidatorPizza.m
//  ValidatorPizza
//
//  Created by Ryan Cohen on 6/30/17.
//  Copyright © 2017 Ryan Cohen. All rights reserved.
//

#import "ValidatorPizza.h"

NSString * const kValidatorPizzaCheckURL  = @"https://www.validator.pizza/%@/%@";

@implementation ValidatorPizza

# pragma mark - Init

+ (instancetype)sharedInstance {
    static ValidatorPizza *validator = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        validator = [self new];
    });
    
    return validator;
}

# pragma mark - Email Check

- (void)check:(NSString *)email type:(VPCheckType)type block:(VPEmailResultBlock)block {
    NSString *urlString = [NSString stringWithFormat:kValidatorPizzaCheckURL, (type == VPCheckTypeEmail ? @"email" : @"domain"), email];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    NSURLSession *s = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionDataTask *t = [s dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *responseObject = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        BOOL isValid = ([responseObject[@"status"] intValue] == 200);
        
        block(isValid, responseObject, nil);
    }];
    
    [t resume];
}

- (void)check:(NSString *)email type:(VPCheckType)type delegate:(id<ValidatorPizzaProtocol>)delegate {
    if ([delegate respondsToSelector:@selector(validatorPizza:checkedWithResult:)]) {
        [self check:email type:type block:^(BOOL isValid, NSDictionary *result, NSError *error) {
            [delegate validatorPizza:self checkedWithResult:result];
        }];
    }
}

@end
