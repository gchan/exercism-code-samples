# Triangle

Write a program that can tell you if a triangle is equilateral, isosceles, or scalene.

The program should raise an error if the triangle cannot exist.

Tests are provided, delete one `skip` at a time.

## Hint

The sum of the lengths of any two sides of a triangle always exceeds the
length of the third side, a principle known as the _triangle
inequality_.

* * * *

For installation and learning resources, refer to the
[exercism help page](http://exercism.io/languages/ruby).

For running the tests provided, you will need the Minitest gem. Open a
terminal window and run the following command to install minitest:

    gem install minitest

If you would like color output, you can `require 'minitest/pride'` in
the test file, or note the alternative instruction, below, for running
the test file.

In order to run the test, you can run the test file from the exercise
directory. For example, if the test suite is called
`hello_world_test.rb`, you can run the following command:

    ruby hello_world_test.rb

To include color from the command line:

    ruby -rminitest/pride hello_world_test.rb

The test files may have the execution bit set so you may also be able to
run it like this:

    ./hello_world_test.rb


## Source

The Ruby Koans triangle project, parts 1 & 2 [view source](http://rubykoans.com)
