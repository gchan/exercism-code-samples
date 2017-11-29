class TwoBucket
  attr_reader :goal_bucket, :other_bucket

  def initialize(size_one, size_two, goal, first_bucket)
    @size_one     = size_one
    @size_two     = size_two
    @goal         = goal
    @first_bucket = first_bucket
  end

  def moves
    empty_one
    empty_two

    moves_count = 0

    until solved?
      move
      moves_count +=1
    end

    set_solution
    moves_count
  end

  private

  def set_solution
    if @bucket_one == @goal
      @goal_bucket = 'one'
      @other_bucket = @bucket_two
    else
      @goal_bucket = 'two'
      @other_bucket = @bucket_one
    end
  end

  def move
    if @first_bucket == 'one'
      start_from_one
    else
      start_from_two
    end
  end

  def start_from_one
    if one_empty?
      fill_one
    elsif two_full?
      empty_two
    else
      fill_two_from_one
    end
  end

  def start_from_two
    if two_empty?
      fill_two
    elsif one_full?
      empty_one
    else
      fill_one_from_two
    end
  end

  def solved?
    @bucket_one == @goal || @bucket_two == @goal
  end

  def one_empty?
    @bucket_one == 0
  end

  def two_empty?
    @bucket_two == 0
  end

  def one_full?
    @bucket_one == @size_one
  end

  def two_full?
    @bucket_two == @size_two
  end

  def fill_one
    @bucket_one = @size_one
  end

  def fill_two
    @bucket_two = @size_two
  end

  def empty_one
    @bucket_one = 0
  end

  def empty_two
    @bucket_two = 0
  end

  def fill_two_from_one
    if @bucket_two + @bucket_one > @size_two
      @bucket_one = @bucket_one + @bucket_two - @size_two
      fill_two
    else
      @bucket_two += @bucket_one
      empty_one
    end
  end

  def fill_one_from_two
    if @bucket_two + @bucket_one > @size_one
      @bucket_two = @bucket_one + @bucket_two - @size_one
      fill_one
    else
      @bucket_one += @bucket_two
      empty_two
    end
  end
end

module BookKeeping
  VERSION = 2
end