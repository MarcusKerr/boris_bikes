# Boris Bikes
### Week 1, 10/07/18
Pairing with Jack

Boris Bikes pair programming challeng

# Boris Bikes
### Week 1, 10/07/18

Brief description of what the project is

# user stories

```
As a person,
So that I can use a bike,
I'd like a docking station to release a bike.
```
```
As a person,
So that I can use a good bike,
I'd like to see if a bike is working
```

Functional representation of user stories

Objects  | Messages
------------- | -------------
Person  |
Bike  | working?
DockingStation | release_bike


Diagram of how the Objects will use Messages to comminicate with one another

```
DockingStation <-- release_bike --> Bike
Bike <-- working? --> true/false
```


## Getting started

`git clone path-to-your-repo`
`command_to_install_dependencies` (e.g. `bundle`)

## Usage

`command_to_start` (e.g. `rackup` or `rails s`)
Navigate to `http://localhost:4567/`


## Running tests

`test_command` (e.g. `rspec`)
