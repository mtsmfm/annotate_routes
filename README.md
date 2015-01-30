# AnnotateRoutes

Annotate routes information to your controllers.

```ruby
class CommentsController < ApplicationController
  # == Route Info
  # comments GET /comments(.:format)
  def index
  end

  # == Route Info
  # POST /comments(.:format)
  def create
  end

  # == Route Info
  # PATCH /comments/:id(.:format)
  # PUT /comments/:id(.:format)
  def update
  end

  # == Route Info
  # DELETE /comments/:id(.:format)
  def destroy
  end
end
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'annotate_routes'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install annotate_routes

## Usage

    $ rake annotate_routes

## Contributing

1. Fork it ( https://github.com/[my-github-username]/annotate_routes/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
