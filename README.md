# crew-corner

Crew Corner API client

## Installation

Add to Gemfile:

```Ruby
gem 'crew-corner', git: 'git://github.com/dreamhackcrew/ruby-crew-corner.git'
```

Execute:

    $ bundle

## Usage

```ruby
require 'crew_corner'

active_events = CrewCorner::Event.active
all_events = CrewCorner::Event.all
specific_event = CrewCorner::Event.find(9)
```
