
# Type there commands into irb
require './lib/DockingStation'
ds = DockingStation.new
b1 = Bike.new
b2 = Bike.new
b2.report_broken
ds.dock(b1)
ds.dock(b2)
van = Van.new
van.collect(ds)
g = Garage.new
van.deliver(g)
g.fix_bikes
van.collect(g)
van.deliver(ds)
ds.bikes
