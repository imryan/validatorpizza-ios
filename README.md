# Validator.pizza iOS
🍕 Bite-sized iOS wrapper for the simple disposable email hunter and validator.

[![CI Status](http://img.shields.io/travis/imryan/ValidatorPizza.svg?style=flat)](https://travis-ci.org/imryan/validatorpizza-ios)
[![Version](https://img.shields.io/cocoapods/v/ValidatorPizza.svg?style=flat)](http://cocoapods.org/pods/ValidatorPizza)
[![License](https://img.shields.io/cocoapods/l/ValidatorPizza.svg?style=flat)](http://cocoapods.org/pods/ValidatorPizza)
[![Platform](https://img.shields.io/cocoapods/p/ValidatorPizza.svg?style=flat)](http://cocoapods.org/pods/ValidatorPizza)

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
```

```
// Invalid email
{
  "status": 400,
  "error": "The email address is invalid."
}
```

```
// Requests limit reached
{
  "status": 429,
  "error": "Rate limit exceeded."
}
```

## Author

Ryan Cohen, notryancohen@gmail.com

## License

ValidatorPizza is available under the MIT license. See the LICENSE file for more info.
