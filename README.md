toy-robot
===================

A simulation of a toy robot moving on a square tabletop.


## Installation

via RubyGems:

    $ gem install toy_robot --pre


## Usage

Start the simulator in interactive mode:

    $ toy_robot

Or pipe it a file with commands:

    $ toy_robot < path/to/file

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

    $ gem install --dev toy_robot --pre

### Compatible environments

* Ubuntu 14.04 x64, ruby 2.1.0p0

* Ubuntu 12.04 x32, ruby 2.1.0p0

### Incompatible enviroments

* ruby < 2.1.0

### Tests

To run unit tests:

    $ rake test

To run integration tests:

    $ rake test:integration

To run all tests:

    $ rake test:all

## Discussion

This piece of software is over-engineered. Over engineering does not feel good.

## Contributing

View [CONTRIBUTING.md](https://github.com/matiasanaya/toy-robot-simulator/blob/master/CONTRIBUTING.md).