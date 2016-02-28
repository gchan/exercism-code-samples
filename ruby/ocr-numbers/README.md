# Ocr Numbers

Write a program that, given a 3 x 4 grid of pipes, underscores, and spaces, can determine which number is represented, or whether it is garbled.

## Step 1

A simple binary font has been constructed using only pipes and
underscores.

The number is four rows high, three columns wide:

     _   #
    | |  # zero.
    |_|  #
         # the fourth row is always blank

         #
      |  # one.
      |  #
         # (blank fourth row)

Write a program that, given a 3 x 4 grid of pipes, underscores, and
spaces, can determine whether the the grid represents a zero, a one, or
garble.

Anything else is considered garble, and can be represented with a '?'

## Step 2

A simple numeric font has been constructed using only pipes and
underscores.

The number consists of four rows high, three columns wide:

      _  _     _  _  _  _  _  _  #
    | _| _||_||_ |_   ||_||_|| | # decimal numbers.
    ||_  _|  | _||_|  ||_| _||_| #
                                 # fourth line is always blank

There may be several numbers in the input text, one per line.

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

Inspired by the Bank OCR kata [view source](http://codingdojo.org/cgi-bin/wiki.pl?KataBankOCR)
