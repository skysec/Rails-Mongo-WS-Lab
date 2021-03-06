class Placing
	attr_accessor :name, :place

	def initialize(name, place)
    @name = name
    @place = place
  end

    #creates a DB-form of the instance
  def mongoize
    {:name => @name, :place => @place}
  end

  def self.demongoize(object)
  	case object
	when Hash then 
		Placing.new(object[:name], object[:place])
	when nil then nil
	else object
	end	
  end

  #takes in all forms of the object and produces a DB-friendly form
  def self.mongoize(object) 
    case object
    when nil then nil
    when Placing then object.mongoize
    when Hash then 
      Placing.new(object[:name], object[:place]).mongoize
    else object
    end
  end

  def self.evolve(object)
    case object
    when nil then nil
    when Placing then object.mongoize
    when Hash then 
      Placing.new(object[:name], object[:place]).mongoize
    else object
    end
  end
end