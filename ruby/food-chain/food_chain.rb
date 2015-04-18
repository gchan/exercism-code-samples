class FoodChainSong
  ANIMALS = {
    fly: '',
    spider: "It wriggled and jiggled and tickled inside her.\n",
    bird: "How absurd to swallow a bird!\n",
    cat: "Imagine that, to swallow a cat!\n",
    dog: "What a hog, to swallow a dog!\n",
    goat: "Just opened her throat and swallowed a goat!\n",
    cow: "I don't know how she swallowed a cow!\n",
    horse: "She's dead, of course!\n"
  }.freeze

  def verse(verse_number)
    animal_index = verse_number - 1
    first_animal = ANIMALS.keys[animal_index]
    animal_chain = ANIMALS.keys[0..animal_index].reverse

    lyrics = "I know an old lady who swallowed a #{first_animal}.\n"
    lyrics << ANIMALS[first_animal]

    return lyrics if first_animal == :horse

    animal_chain.each_cons(2) do |a1, a2|
      if a2 == :spider
        a2 = 'spider that wriggled and jiggled and tickled inside her'
      end

      lyrics << "She swallowed the #{a1} to catch the #{a2}.\n"
    end

    lyrics << "I don't know why she swallowed the fly. Perhaps she'll die.\n"
  end

  def verses(from, to)
    (from..to).inject('') do |lyrics, verse|
      lyrics << verse(verse)
      lyrics << "\n"
    end
  end

  def sing
    verses(1, 8)
  end
end
