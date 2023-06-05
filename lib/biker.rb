require './lib/ride'

class Biker
  attr_reader :name,
              :max_distance,
              :rides,
              :acceptable_terrain

  def initialize(name, max_distance)
    @name = name
    @max_distance = max_distance
    @rides = {}
    @acceptable_terrain = []
  end

  def learn_terrain!(terrain)
    @acceptable_terrain << terrain
  end

  def log_ride(ride, time)
    if !acceptable_terrain?(ride) || !distance_in_range?(ride)
      false
    elsif @rides[ride].nil?
      @rides[ride] = [time]
    else
      @rides[ride] << time
    end
  end

  def personal_record(ride)
    if @rides[ride].nil?
      false
    else
      @rides[ride].min()
    end
  end

  def acceptable_terrain?(ride)
    @acceptable_terrain.include?(ride.terrain)
  end

  def distance_in_range?(ride)
    @max_distance >= ride.total_distance
  end



end