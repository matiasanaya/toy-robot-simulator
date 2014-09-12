toy-robot
===================

A simulation of a toy robot moving on a square tabletop.


## Installation

via RubyGems:

    $ gem install toyrobot


## Usage

Start the simulator in interactive mode:

    $ toyrobot

Or pipe in a file with commands:

    $ toyrobot < path/to/file

An example file with commands:

    PLACE 1,2,EAST
    MOVE
    MOVE
    LEFT
    MOVE
    REPORT

To which the simulator will respond:

    3,3,NORTH

### Simulation Commands

Simulation commands are case-sensitive.

#### PLACE

Puts the robot on the table in position X,Y and facing `NORTH`, `SOUTH`, `EAST` or `WEST`. The origin (0,0) is considered to be the SOUTH WEST most corner. Usage: 

    PLACE 2,1,WEST

#### MOVE

Move the robot one unit forward in the direction it is currently facing. Usage:

    MOVE

#### LEFT

Rotate the robot 90 degrees counter-clockwise. It does not affect its position. Usage:

    LEFT

#### RIGHT

Rotates the robot 90 degrees clockwise. It does not affect its position. Usage:

    RIGHT

#### REPORT

Announce the X,Y and F of the robot. Usage:

    REPORT

Response:

    X,Y,FACING

### Simulation Constraints

* The toy robot is moving on a square tabletop of dimensions 5 units x 5 units.

* There are no other obstructions on the table surface.

* The robot is free to roam around the surface of the table, but is prevented from falling to destruction.

* Any movement that would result in the robot falling from the table is prevented, however further valid movement commands are still allowed.

* The first valid command to the robot is a PLACE command, after that, any sequence of commands may be issued, in any order, including another PLACE command. The application discards all commands in the sequence until a valid PLACE command has been executed.

* A robot that is not on the table ignores the MOVE, LEFT, RIGHT and REPORT commands.

* The application does not provide any graphical output showing the movement of the toy robot.


## Dependancies

    ruby version ~> 2.1.0p0

To check your version run:

    $ ruby -v

To learn how to install ruby visit [ruby-lang.org/en/installation/](https://www.ruby-lang.org/en/installation/)


## Troubleshooting

### Development environment

 * OSX 10.8.5, ruby 2.1.2p95

Development dependancies:

    rake ~> 10.3
    minitest ~> 4.7.5

To install them along the gem:

    $ gem install --dev toyrobot

### Compatible environments

* Ubuntu 14.04 x64, ruby 2.1.0p0

* Ubuntu 12.04 x32, ruby 2.1.0p0

### Incompatible environments

* ruby < 2.1.0

### Tests

To run unit tests:

    $ rake test

To run integration tests:

    $ rake test:integration

To run all tests:

    $ rake test:all

## Design

The application flows in the following way:

#### 1 Launch

    $ toyrobot < path/to/file

##### 1.1 bin/toyrobot

The `toyrobot` in the command is a ruby executable in your load path. This executable contains the following lines:

```ruby
require 'toy_robot'
ToyRobot::Application.new(ARGV).run
```

The first line requires the file `./lib/toy_robot.rb` which loads the library. The second line creates and instance of the application and passes the command-line arguments to it.

##### 1.2 lib/toy_robot/application.rb

The `app.run()` method reads in robot_commands from the input source (defaults to `$stdin`) and passes them to the parser. The parser returns (might) a command_like_object which is used to message the controller.

```ruby
def run(options = nil)
  loop do
    raw_input = input.gets
    break unless raw_input
    raw_input.chomp!
    command = parser.parse(raw_input)
    controller.send(command.msg, command.args) if command
  end
end
```

##### 1.2.1 lib/toy_robot/command/parser.rb

`parser.parse()` delegates the job of matching robot_commands and extracting arguments to the `Command::Parser::(Place/Move/Right/Left/Report)` objects. Each will receive the robot_command and try to match it. If it can, it will build a command_like_object and return it. The `parser.parse()` method will return the command_like_object as soon as a match is found.

```ruby
def self.parse(string)
  all.each do |parser|
    command = parser.build_with_match(string)
    return command if command
  end
  nil
end
```

##### 1.2.2 lib/toy_robot/controller.rb

The controller will receive a valid message (`place`,`move`,`left`,`right`,`report`) and delegate it to the correct object (`robot`/`view`)

```ruby
def place(*args)
  robot.place(*args)
end

def move(*_)
  robot.move
end

def left(*_)
  robot.left
end

def right(*_)
  robot.right
end

def report(*_)
  view.report
end
```

##### 1.2.2.1 lib/toy_robot/robot.rb

This is the entry point for all robot_commands in the system. Suffice it to say that from here on, every command will interact with a combination of the following objects:

```ruby
ToyRobot::Robot
```

```ruby
ToyRobot::Pose
```

```ruby
ToyRobot::Board
```

##### 1.2.2.2 lib/toy_robot/view.rb

This is the output point of all robot_commands. The application only displays feedback for the report command, so the code in here is very basic, and by default writes to `$stdout`.

```ruby
def report
  output.puts format_report(robot.report)
end
```

```ruby
def format_report(report)
  "#{report[:x]},#{report[:y]},#{report[:orientation].upcase}" if report
end
```

#### 2 Exit

After all the commands are read, parsed and executed, the application exits.

## Discussion

This piece of software is over-engineered.

On the one hand it attempts to solve a static, straight-forward problem. On the other hand it tries to demonstrate coding and object-oriented design skills. OOD is aimed at problems that need to change. By definition, this exercise will not need to change. This generates tensions which I feel are incompatible and creep into the code base.

The results is that most of the files/classes/modules/methods/lines in the source code are sensible to the argument that they are overkill for the problem in question.

In the end I tried my best to keep it simple while applying some OOD, but couldn't help feeling like the person to whom 'every problem seems like a nail'.

## Contributing

View [CONTRIBUTING.md](https://github.com/matiasanaya/toy-robot-simulator/blob/master/CONTRIBUTING.md)
