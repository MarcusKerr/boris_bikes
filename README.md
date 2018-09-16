# Boris Bikes

## Week 1 pairing assignment

My first pairing assignment at makers! - Build a clone of the Boris Bike system!

## Goals

* I write code that is easy to change
* I know how my language works
* I can build with objects
* I can test-drive my code

During this project I learnt about TDD, OOD and pair programming.
I completed the first 7 user stories during the pairing sessions and compeleted the remainder in my free time.

## User Stories

```console
As a person
So that I can use a bike
I'd like a docking station to release a bike

As a person
So that I can use a good bike
I'd like to see if a bike is working

As a member of the public
So I can return bikes I've hired
I want to dock my bike at the docking station

As a member of the public
So I can decide whether to use the docking station
I want to see a bike that has been docked

As a member of the public
So that I am not confused and charged unnecessarily
I'd like docking stations not to release bikes when there are none available

As a system maintainer
So that I can plan the distribution of bikes
I want a docking station to have a default capacity of 20 bikes

As a system maintainer
So that busy areas can be served more effectively
I want to be able to specify a larger capacity when necessary

As a member of the public
So that I reduce the chance of getting a broken bike in future
I'd like to report a bike as broken when I return it

As a maintainer of the system
So that I can manage broken bikes and not disappoint users
I'd like docking stations not to release broken bikes

As a maintainer of the system
So that I can manage broken bikes and not disappoint users
I'd like docking stations to accept returning bikes (broken or not)

As a maintainer of the system
So that I can manage broken bikes and not disappoint users
I'd like vans to take broken bikes from docking stations and deliver them to garages to be fixed

As a maintainer of the system
So that I can manage broken bikes and not disappoint users
I'd like vans to collect working bikes from garages and distribute them to docking stations
```

## Objects and messages diagram

Objects  | Messages
------------- | -------------
Person  |
Bike  | working?, report_broken
DockingStation | release(bike), dock(bike), bikes
Van | collect(docking_station/garage), deliver(garage/docking_station)
Garage | fix_bikes

## Communication diagram

```console
DockingStation <-- release(bike) --> Bike
DockingStation <-- dock(bike)
DockingStation <-- bikes --> [Bike]

Bike <-- working? --> true/false
Bike <-- report_broken --> true

Van <-- collect(docking_station/garage) --> [Bike]
Van <-- deliver(docking_station/garage) --> []

Garage <-- fix_bikes --> [bike]
```

## Getting started

`git clone path-to-your-repo`

## Usage

After cloning, fire up the terminal and enter IRB, then require the docking station file.

``` console
$ irb
> require './lib/DockingStation.rb'
```

First, you will need a Docking Station. Docking stations have a default capcity of 20, however this can be overridden by passing an integer as an argument upon instantiation.

``` console
> docking_station = DockingStation.new
```

After you have you Docking Station, you will need a Bike!

``` conosle
> bmx = Bike.new
```

This bike can now be docked...

``` console
> docking_station.dock(unicorn_bmx)
```

And released.

``` console
> docking_station.release(unicorn_bmx)
```

To see which bikes are available for release use the `bikes` method on a Docking Station.

``` console
> docking_station.bikes
```

If you happen to break your bike, please report it as broken.

``` console
> bmx.report_broken
```

Broken bikes can be docked but they are not available for release.

If you would like to fix the broken bikes, you will need a Van and a Garage.

``` console
> transit = Van.new
> halfords = Garage.new
```

Vans have a capacity of 5 bikes and you can see which bikes are being held by a Van using the bikes method.

``` console
> transit.bikes
```

Collect the bikes form the Docking Station and deliver them to a Garage.

``` console
> transit.collect(docking_station)
> transit.deliver(halfords)
```

Once the bikes are at the garage, they can the be fixed.

``` console
> halfords.fix_bikes
```

You can check the broken bikes and fixed bikes that are being held in a garage by calling the `broken_bikes` and `fixed_bikes` methods.

```  console
> halfords.broken_bikes
> halfords.fixed_bikes
```

And once the bikes are fixed, you will want to tell the Van to collect them from the Garage and deliver them to a Docking Station.

``` console
> transit.collect(halfords)
> transit.deliver(docking_station)
```

## Running tests

To run the entire test suite simply type `rspec` into the terminal.

``` console
$ rspec
```

And to run a specific test file, type rspec followed by said file's path.

``` console
$ rspec spec/docking_station_spec.rb
```