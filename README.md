## Honest Renter API Wrapper

[![Build Status](https://travis-ci.org/yez/honest_renter.svg?branch=master)](https://travis-ci.org/yez/honest_renter)

## Basic Objects

All supported objects have their own class. Each of these classes inherits from the `BaseModel` class.

It is suggested that when using this gem, you create your own wrapper class which inherits from these classes.

For example:

```ruby
class Person < HonestRenter::Person
end
```

### `to_h`

All models in the `honest_renter` gem respond to the `to_h` method. This method iterates over a model's attributes and returns a Hash.

## Authentication

Two authentication methods exist. An authenticated `Session` object must be present for each remote HonestRenter API call.

For more information, check out the [official authentication documentation](https://honestrenter.com/api/docs/general-principles#authorization)

Each of the two authentication methods are initialized via the `HonestRenter::Authenticator` factory methods:

### Address and Password

To authenticate via an (email) address and password, use the `.from_address_and_password` class method.

```ruby
auth = HonestRenter::Authenticator.from_address_and_password(
                                    'me@example.com',
                                    'supersecretpassword')
# => AddressPasswordAuthenticator

auth.session
# => HonestRenter::Session
```

This `HonestRenter::Session` object is used when calling all class level query methods (`find` and  `find_all`, etc)

### Secret Key

To authenticate using a `SecretKey` and `MemberId`, the aptly named `.from_secret_key_member_id` class method can be used.

```ruby
auth = HonestRenter::Authenticator.from_secret_key_member_id(
                                    '5up3r53cr3t',
                                    'mymember_id')
# => AddressPasswordAuthenticator

auth.session
# => HonestRenter::Session
```

## Request Methods

The HonestRenter API supports querying for objects by their ID or by a set of filters. All querying operations require an authenticated `HonestRenter::Session`.

### `find`

To find a specific object by its identifier, simply call the `.find` class method on the object or your application's inherited version of that object:

```ruby
HonestRenter::Member.find('some_member_id', session)
```

The `session` variable can be a session created by either the `HonestRenter::AddressPasswordAuthenticator` or the `HonestRenter::SecretKeyMemberIdAuthenticator`.

The model will automatically return an instance of the class upon with the `.find` method was called with its attributes filled.

### `find_all`

To find a complete list of a certain model, the `.find_all` class method exists. This method has 1 required parameter and 2 optional parameters.

Like the `.find` method, a `session` is the required parameter.

```ruby
HonestRenter::Country.find_all(session)
```

Optionally, a `limit` and `offset` can be given to the `.find_all` method to create pagination.

```ruby
limit = 10
offset = 5
HonestRenter::Country.find_all(session, limit, offset)
```

## More Information

For more information, refer to the [Official Honest Renter API Docs](https://www.honestrenter.com/api/docs)
