require './lib/DockingStation'
ds = DockingStation.new
b1 = Bike.new
b2 = Bike.new
b2.report_broken
ds.dock(b1)
ds.dock(b2)
van = Van.new
van.collect_bikes(ds)
g = Garage.new
van.deliver_bikes(g)
g.fix_bikes
van.collect_bikes(g)
van.deliver_bikes(ds)
ds.bikes