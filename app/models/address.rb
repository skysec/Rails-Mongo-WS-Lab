class Address
  attr_accessor :city, :state, :location

  def initialize(city=nil, state=nil, location=nil)
    @city =  city
    @state = state
    if location.nil?
      @location = Point.new(0.0, 0.0)
    else
      @location = location
    end
  end

  def mongoize
    {:city => @city, :state => @state, :loc => @location.mongoize}
  end

  def self.demongoize(object)
  	case object
	when Hash then 
		Address.new(object[:city],object[:state],Point.demongoize(object[:loc]))
	when nil then nil
	else object
	end	
  end

  #takes in all forms of the object and produces a DB-friendly form
  def self.mongoize(object) 
    case object
    when nil then nil
    when Address then object.mongoize
    when Hash then 
      Address.new(object[:city],object[:state],Point.mongoize(object[:loc])).mongoize
    else object
    end
  end

  def self.evolve(object)
    case object
    when nil then nil
    when Address then object.mongoize
    when Hash then 
      Address.new(object[:city],object[:state],Point.mongoize(object[:loc])).mongoize
    else object
    end
  end
end