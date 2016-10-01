#From book Beginning Ruby , 3rd edition, Apress
class Dungeon
  attr_accessor :player #attr_accessor allows var to be accessed                   #outside scope of the class.
  def initialize(player_name)
    @player = Player.new(player_name)
    @rooms = []
  end
  
  class Player
    attr_accessor :name, :location
    
    def initialize(player_name)
      @name = player_name
      @age = 23
    end
  end
  
  class Room
    attr_accessor :reference, :name, :description, :connections
    
    def initialize(reference, name, description, connections)
      @reference = reference
      @name = name
      @description = description
      @connections = connections
    end
  end
  
  def add_room(reference, name, description, connections)
    @rooms << Room.new(reference, name, description, connections)
  end
  
  def start(location)
    @player.location = location
    show_current_description
  end
  
  def show_current_description
    puts find_room_in_dungeon(@player.location).full_description
  end
  
  def find_room_in_dungeon(reference)
    @rooms.detect { |room| room.reference == reference }
  end
  
  def full_description
    @name + "\n\nYou are in " + @description
  end 
  
end

my_dungeon = Dungeon.new("Trevor")

my_dungeon.add_room(:largecave, "Large Cave", "a large cavernous cave", {:west => :smallcave })

my_dungeon.add_room(:smallcave, "Small Cave", "a small, claustrophobic cave", {:east => :largecave })