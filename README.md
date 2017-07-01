# validatorpizza-ios
🍕 iOS wrapper for the simple disposable email hunter

# setup
* Download project and drop in the contents of `ValidatorPizza` to your project.
* `#import "ValidatorPizza.h"`

# example
```
[ValidatorPizza sharedInstance] check:domain type:VPCheckTypeDomain block:^(BOOL isValid, NSDictionary *results, NSError *error) {
    //
}];
    
[[ValidatorPizza sharedInstance] check:email type:VPCheckTypeEmail delegate:self];
```
