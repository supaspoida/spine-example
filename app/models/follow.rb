class Follow
  include Informal::Model

  attr_accessor :id, :name

  def self.people
    all.map { |f| Person.new(name: f.name) }
  end

  def self.all
    Persistence::Redis::Follow.all.map do |name|
      new(name: name)
    end
  end

  def as_json(*args)
    { id: name, name: name }
  end

  def destroy
    Persistence::Redis::Follow.destroy(name)
  end

  def name
    @name || id
  end

  def to_param
    name
  end

  def save
    Persistence::Redis::Follow.create(name)
    valid?
  end

  def persisted?
    name.present? && Persistence::Redis::Follow.exists?(name)
  end

end
