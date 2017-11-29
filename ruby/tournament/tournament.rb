class Tournament
  def self.tally(games)
    teams = Hash.new do |h, k|
      h[k] = Hash.new { |h1, k1| h1[k1] = 0 }
    end

    games.split("\n").each do |match|
      team_one, team_two, result = match.split(';')

      case result
      when 'win'
        teams[team_one][:win] += 1
        teams[team_two][:loss] += 1
      when 'draw'
        teams[team_one][:draw] += 1
        teams[team_two][:draw] += 1
      else
        teams[team_one][:loss] += 1
        teams[team_two][:win] += 1
      end
    end

    teams.each do |_team, results|
      results[:points] = results[:win] * 3 + results[:draw]
      results[:matches] = results[:win] + results[:loss] + results[:draw]
    end

    teams_ordered = teams.to_a.sort_by do |team, results|
      [-results[:points], team]
    end

    output = "Team                           | MP |  W |  D |  L |  P\n"

    teams_ordered.each do |team, results|
      output += [
        team.ljust(30),
        results[:win] + results[:loss] + results[:draw],
        results[:win],
        results[:draw],
        results[:loss],
        results[:points]
      ].join(' |  ') + "\n"
    end

    output
  end
end

module BookKeeping
  VERSION = 3
end
