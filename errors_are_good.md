##Errors are Good


###Type of error:

```NameError```

###Filepath of error:

```/Users/roystonHenson/.rvm/rubies/ruby-2.3.0/bin/irb```

###Number line of error:

```Line 11```

###Ruby docs explanation of error:

```Raised when a given name is invalid or undefined```

###A solution to the error:

Code before 

```docking_station = DockingStation.new
NameError: uninitialized constant DockingStation
	from (irb):1
	from /Users/roystonHenson/.rvm/rubies/ruby-2.3.0/bin/irb:11:in `<main>'```

Code after

```class DockingStation
2.3.0 :003?>   end
 => nil 
2.3.0 :004 > docking_station = DockingStation.new
 => #<DockingStation:0x007f888b887730> ```
