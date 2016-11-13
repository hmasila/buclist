# Buclist 🏄

Buclist is a simple bucketlist API allows consumers to perform CRUD operations on bucketlists.
On those bucketlists, a user can further add items and perform CRUD operations on them too.
[This](https://bucketlist.org/featured/) site has sample bucketlist and ideas you could borrow from.

Documentation - bucki-t.herokuapp.com.

Source code - github.com/andela-hmasila/buclist.

## API Features

  1. User authentication with [JWT](http://jwt.io).
  2. User can perform CRUD operations on Buckelist and Item resources
  3. API accepts paginated requests with page and limit e.g. `/bucketlists?limit=10&page=1`
  4. API accepts queried requests on bucketlists eg
  `/bucketlists?q=sky`
  5. API  uses Accept header to version api calls e.g. `Accept:application/vnd.buclist.v1+json`.
  6. API Blueprint documentation

### Dependencies

  1. [Ruby](https://github.com/rbenv/rbenv)
  2. [PostgreSQL](http://www.postgresql.org/download/macosx/)
  3. [Bundler](http://bundler.io/)
  4. [Ruby on Rails](http://guides.rubyonrails.org/getting_started.html#installing-rails)
  5. [RSpec](http://rspec.info/)


## Getting Started

     1. `git clone https://github.com/andela-hmasila/buclist.git`

    2. `cd buclist`

    3. `bundle install`

    4. `rails db:setup`

    5. `rails server`


## Tests
    1. cd buclist
    2. rspec

## API Endpoints

All endpoints except `/signup` and `/auth/login` require a token for authentication. The API call should have the token in Authorization header.

    http http://bucki-t.herokuapp.com/bucketlists \
    Authorization: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE0Njc2MTkxNDV9.R6VLZD4qtsdVHXZwU8bEo6S16cbNQfo7lICsNdAq00I"

| EndPoint                                |   Functionality                      |
| --------------------------------------- | ------------------------------------:|
| POST /signup                            | Signup a user                        |
| POST /auth/login                        | Login user                           |
| GET /auth/logout                        | Logout user                          |
| POST /bucketlists/                      | Create a new bucket list             |
| GET /bucketlists/                       | List all the created bucket lists    |
| GET /bucketlists?page=1&limit=5         | List five bucketlists from page 1    |
| GET /bucketlists?q=bucket               | Search for bucketlist                |
| GET /bucketlists/:id                    | Get single bucket list               |
| PUT /bucketlists/:id                    | Update this bucketlist               |
| DELETE /bucketlists/:id                 | Delete this single bucketlist        |
| POST /bucketlists/:id/items/            | Create a new item in bucketlist      |
| PUT /bucketlists/:id/items/:item_id     | Update a bucketlist item             |
| DELETE /bucketlists/:id/items/:item_id  | Delete an item in a bucket lists     |



## Versions

The API uses Accept header to version api calls e.g. `Accept:application/vnd.buclist.v1+json`.

## Request & Response examples

Request GET /bucketlists?page=1&limit=2

     http https://bucki-t.herokuapp.com/bucketlists?page=2&limit=2 \
     Authorization: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE0Njc2MTkxNDV9.R6VLZD4qtsdVHXZwU8bEo6S16cbNQfo7lICsNdAq00I'

Response (application/json)

    [
      {
          "id": 1,
          "name": "Resurrect from The Empire Strikes",
          "items": [
              {
                "id": 9,
                "name": "shoot Greedo",
                "date_created": "2016-11-13  3:15:16",
                "date_modified": "2016-11-13  3:15:16",
                "done": false
              }
          ],
          "date_created": "2016-11-13  3:13:50",
          "date_modified": "2016-11-13  3:13:50",
          "created_by": "Han Solo"
        },
        {
            "id": 2,
            "name": "Find R2-D2",
            "items": [
                {
                  "id": 9,
                  "name": "Talk to C3PO",
                  "date_created": "2016-11-13  3:15:16",
                  "date_modified": "2016-11-13  3:15:16",
                  "done": false
                }
            ],
            "date_created": "2016-11-13  3:13:50",
            "date_modified": "2016-11-13  3:13:50",
            "created_by": "Luke Skywalker"
        }
    ]

## Application Limitations

  1. The API only responds with JSON

## Contributing

1. Fork it! :fork_and_knife:
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git add -A && git commit -m 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request

## License

This project is licensed under the MIT License - see the [LICENSE.md](https://opensource.org/licenses/MIT) file for details
