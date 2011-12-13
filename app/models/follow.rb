class Follow
  include Informal::Model

  attr_accessor :person

  def self.people
    all.map { |f| Person.new(name: f.name) }
  end

  def self.all
    Persistence::Redis::Follow.all.map do |name|
      new(name: name)
    end
  end

  def save
    Persistence::Redis::Follow.create(person)
    valid?
  end

end
