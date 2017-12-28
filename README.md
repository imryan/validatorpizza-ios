# Validator.pizza iOS
🍕 Bite-sized iOS wrapper for the simple disposable email hunter and validator.

# Setup
* Download project and drop in the contents of `ValidatorPizza` to your project.
* `#import "ValidatorPizza.h"`

# Usage
```
// Validating a domain
[ValidatorPizza check:@"example.com" type:VPCheckTypeDomain block:^(BOOL isValid, NSDictionary *results, NSError *error) {
    if (!error) ...
}];

// Validating an email address
[ValidatorPizza check:@"me@example.com" type:VPCheckTypeEmail block:^(BOOL isValid, NSDictionary *results, NSError *error) {
    if (!error) ...
}];
```

## Response
Result dictionaries contain a structure such as:
```
// Valid email
{
    "status": 200,
    "email": "email@example.com",
    "domain": "example.com",
    "mx": false,
    "disposable": false,
    "alias": false,
    "did_you_mean": false,
    "remaining_requests": 119
}

// Invalid email
{
    "status": 400,
    "error": "The email address is invalid."
}

// Requests limit reached
{
    "status": 429,
    "error": "Rate limit exceeded."
}
```
