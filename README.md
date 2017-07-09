# validatorpizza-ios
🍕 iOS wrapper for the simple disposable email hunter and validator

# Setup
* Download project and drop in the contents of `ValidatorPizza` to your project.
* `#import "ValidatorPizza.h"`

# Usage
Result dictionaries contain a structure such as:
```
{
   "status": 200,
   "email": "notryancohen@gmail.com",
   "domain": "gmail.com",
   "mx": true,
   "disposable": false,
   "alias": false,
   "did_you_mean": null,
   "remaining_requests": 115
}
```
Or for an invald email:
```
{
   "status": 400,
   "error": "The email address is invalid."
}
```

Library usage:
```
// Block usage
[ValidatorPizza sharedInstance] check:@"example.com" type:VPCheckTypeDomain block:^(BOOL isValid, NSDictionary *results, NSError *error) {
    if (!error) ...
}];

// Delegate usage
[[ValidatorPizza sharedInstance] check:@"example@example.com" type:VPCheckTypeEmail delegate:self];
```
