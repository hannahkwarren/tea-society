# README

Tea Society is a mini project provided during Mod 4 of the Turing School of Software and Design. It's framed as take-home challenge practice for our upcoming job interviews. 

This API (no front end is built out currently) supports creating a tea subscription for a customer, cancelling a customer's subscription by changing the status to inactive, and getting all of a specified customer's subscriptions (inactive and active).

It's a local application only, and is not deployed publicly.


## Setup

Ruby v 2.7.2
Rails v. 5.2.7

PostgreSQL DB

Uses these gems: 
* jsonapi-serializer
* pry
* shoulda-matchers v. 3.1
* rspec-rails

To work on this repo, clone a copy to your local machine.
Make sure to run a `bundle install` and set up your database with `rails db:create,migrate,seed` to get started!

## Supported Endpoints

### *POST 'api/v1/subscriptions'* 
to create a new subscription. Sample request body (JSON): 

```
{ "subscription": {
      "title": "Monthly Fix",
      "price": 25.99,
      "frequency": "monthly",
      "customer_id": 1,
      "tea_id": 1
    }
}
```
Returns the newly-created subscription details. 
<br/>
<br/>

### *PATCH 'api/v1/subscriptions'* 
to cancel an existing subscription. Sample request body (JSON):
```
{
    "subscription": {
        "id": 1,
        "customer_id": 1,
        "status": "inactive"
    }
}
```
Returns the full subscription details with changed status.
<br/>
<br/>

### *GET 'api/v1/customer/:customer_id/subscriptions'*
 to see all of a customer's subscriptions, regardless of status. No request body required.
