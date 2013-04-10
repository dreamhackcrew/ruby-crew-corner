# crew-corner

Crew Corner API client

## Installation

### With bundler

Add to Gemfile:

```Ruby
gem 'crew-corner'
```

Execute:

    $ bundle

### Without bundler

    $ gem install crew-corner

## Usage

```ruby
require 'crew_corner'

active_events = CrewCorner::Event.active
all_events = CrewCorner::Event.all
specific_event = CrewCorner::Event.find(9)
```
