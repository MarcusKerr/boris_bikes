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

Additional user stories

```
As a member of the public
So I can return bikes I've hired
I want to dock my bike at the docking station
```
```
As a member of the public
So I can decide whether to use the docking station
I want to see a bike that has been docked
```

Again an objects and messages diagram

Objects  | Messages
------------- | -------------
Person  |
Bike  |
DockingStation | dock(bike), bike

Communication diagram

```
DockingStation <-- dock(bike) --> bikes[].pop(bikr)
DockingStaion <-- bike --> bike
```

More user stories ....

```
As a member of the public,
So that I am not confused and charged unnecessarily,
I'd like docking stations not to release bikes when there are none available.

As a system maintainer,
So that I can plan the distribution of bikes,
I want a docking station to have a default capacity of 20 bikes.

As a system maintainer,
So that busy areas can be served more effectively,
I want to be able to specify a larger capacity when necessary.
```


## Getting started

`git clone path-to-your-repo`
`command_to_install_dependencies` (e.g. `bundle`)

## Usage

`command_to_start` (e.g. `rackup` or `rails s`)
Navigate to `http://localhost:4567/`


## Running tests

`test_command` (e.g. `rspec`)
