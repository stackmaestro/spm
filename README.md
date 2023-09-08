# Poject Name
Project-Management


# Problem Statement
Create a Ruby on Rails app to keep track of members of different teams and their projects.

### Model Specs
* Member fields
  * first_name (required)
  * last_name (required)
  * city
  * state
  * country
* Team fields
  * name (required)
* Project fields
  * name (required)
* A member **must** belong to a team.
* A member can be **optionally** assigned to **multiple** projects.

### Exit Criteria
* Endpoints to: Create/Update/Delete/Index/Show teams
* Endpoints to: Create/Update/Delete/Index/Show members
* Endpoints to: Create/Update/Delete/Index/Show projects
* Endpoint to: Update the team of a member
* Endpoint to: Get the members of a specific team
* Endpoint to: Add a member to a project
* Endpoint to: Get the members of a specific project

### Bonus
* Add tests
* Basic UI for the exit criteria above with Rails views

------------



### Built With

* [Ruby](https://www.ruby-lang.org/en/)
* [Ruby on Rails](https://rubyonrails.org/)
* [PostgreSQL](https://www.postgresql.org/)
* [RSpec](https://github.com/rspec/rspec-rails)

------------

## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

* `ruby 2.6.5`
* `rails 6.1.5`

### Installation

1. Clone the repo and cd into it
```sh
```
2. Install the gems
`bundle install`
3. Setup Database
`rails db:create`
`rails db:migrate`
3. Start the server
`rails s`
4. Run test suits
`rspec`