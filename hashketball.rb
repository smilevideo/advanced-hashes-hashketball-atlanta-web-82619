require 'pry'

def game_hash
  hash = {
    :home => {
        :team_name => 'Brooklyn Nets',
        :colors => ['Black', 'White'],
        :players => [
          {
            :name => 'Alan Anderson',
            :number => 0,
            :shoe => 16,
            :points => 22,
            :rebounds => 12,
            :assists => 12,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 1
          },
          {
            :name => 'Reggie Evans',
            :number => 30,
            :shoe => 14,
            :points => 12,
            :rebounds => 12,
            :assists => 12,
            :steals => 12,
            :blocks => 12,
            :slam_dunks => 7
          },
          {
            :name => 'Brook Lopez',
            :number => 11,
            :shoe => 17,
            :points => 17,
            :rebounds => 19,
            :assists => 10,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 15
          },
          {
            :name => 'Mason Plumlee',
            :number => 1,
            :shoe => 19,
            :points => 26,
            :rebounds => 11,
            :assists => 6,
            :steals => 3,
            :blocks => 8,
            :slam_dunks => 5
          },
          {
            :name => 'Jason Terry',
            :number => 31,
            :shoe => 15,
            :points => 19,
            :rebounds => 2,
            :assists => 2,
            :steals => 4,
            :blocks => 11,
            :slam_dunks => 1
          }]
    },
    :away => {
        :team_name => 'Charlotte Hornets',
        :colors => ['Turquoise','Purple'],
        :players => [
          {
            :name => 'Jeff Adrien',
            :number => 4,
            :shoe => 18,
            :points => 10,
            :rebounds => 1,
            :assists => 1,
            :steals => 2,
            :blocks => 7,
            :slam_dunks => 2
          },
          {
            :name => 'Bismack Biyombo',
            :number => 0,
            :shoe => 16,
            :points => 12,
            :rebounds => 4,
            :assists => 7,
            :steals => 22,
            :blocks => 15,
            :slam_dunks => 10
          },
          {
            :name => 'DeSagna Diop',
            :number => 2,
            :shoe => 14,
            :points => 24,
            :rebounds => 12,
            :assists => 12,
            :steals => 4,
            :blocks => 5,
            :slam_dunks => 5
          },
          {
            :name => 'Ben Gordon',
            :number => 8,
            :shoe => 15,
            :points => 33,
            :rebounds => 3,
            :assists => 2,
            :steals => 1,
            :blocks => 1,
            :slam_dunks => 0
          },
          {
            :name => 'Kemba Walker',
            :number => 33,
            :shoe => 15,
            :points => 6,
            :rebounds => 12,
            :assists => 12,
            :steals => 7,
            :blocks => 5,
            :slam_dunks => 12
          }]
    }
  }
end

def num_points_scored(name)
  game_hash.each_value do |team|
    team[:players].each do |player|
      if player[:name] == name
        return player[:points]
      end
    end
  end
  
  return 'not found'
end

def shoe_size(name)
  game_hash.each_value do |team|
    team[:players].each do |player|
      if player[:name] == name
        return player[:shoe]
      end
    end
  end
  
  return 'not found'
end

def team_colors(team_name)
  game_hash.each_value do |team|
    if team[:team_name] == team_name
      return team[:colors]
    end
  end
  
  return 'not found'
end

def team_names
  arr = []
  game_hash.each_value do |team|
    arr.push(team[:team_name])
  end
  
  return arr
end

def player_numbers(team_name)
  jersey_numbers = []
  game_hash.each_value do |team|
    if team[:team_name] == team_name
      team[:players].each do |player|
        jersey_numbers.push(player[:number])
      end
    end
  end
  
  return jersey_numbers
end

def player_stats(player_name)
  game_hash.each_value do |team|
    team[:players].each do |player|
      if player[:name] == player_name
        player.delete(:name)
        return player
      end
    end
  end
  
  return 'not found'
end

def big_shoe_rebounds
  max = 0
  team = nil
  i = nil
  game_hash.each_pair do |location, data|
    data[:players].each_with_index do |player, index|
      if player[:shoe] > max
        max = player[:shoe]
        team = location
        i = index
      end
    end
  end
  
  return game_hash[team][:players][i][:rebounds]
end

def most_points_scored
  max = 0
  team = nil
  i = nil
  game_hash.each_pair do |location, data|
    data[:players].each_with_index do |player, index|
      if player[:points] > max
        max = player[:points]
        team = location
        i = index
      end
    end
  end
  
  return game_hash[team][:players][i][:name]
end
  
def winning_team
  max = 0
  team_name = ''
  
  game_hash.each_pair do |location, data|
    team_points = 0
    data[:players].each do |player|
      team_points += player[:points]
    end
    
    if team_points > max
      max = team_points
      team_name = data[:team_name]
    end
  end
  
  return team_name
end

def player_with_longest_name
  max = 0
  team = nil
  i = nil
  game_hash.each_pair do |location, data|
    data[:players].each_with_index do |player, index|
      if player[:name].length > max
        max = player[:name].length
        team = location
        i = index
      end
    end
  end
  
  return game_hash[team][:players][i][:name]
end

def long_name_steals_a_ton?
  max = 0
  team = nil
  i = nil
  game_hash.each_pair do |location, data|
    data[:players].each_with_index do |player, index|
      if player[:steals] > max
        max = player[:steals]
        team = location
        i = index
      end
    end
  end
  
  if game_hash[team][:players][i][:name] == player_with_longest_name
    return true
  else
    return false
  end
end