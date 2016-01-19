class Acronym
  VERSION = 1

  def self.abbreviate(string)
    string.scan(/\b([A-z])|[a-z]([A-Z])/).join.upcase
  end
end
