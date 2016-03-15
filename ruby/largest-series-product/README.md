# Largest Series Product

Write a program that, when given a string of digits, can calculate the largest product for a series of consecutive digits of length n.

For example, for the input `'0123456789'`, the largest product for a
series of 3 digits is 504 (7 * 8 * 9), and the largest product for a
series of 5 digits is 15120 (5 * 6 * 7 * 8 * 9).

For the input `'73167176531330624919225119674426574742355349194934'`,
the largest product for a series of 6 digits is 23520.

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

A variation on Problem 8 at Project Euler [view source](http://projecteuler.net/problem=8)
