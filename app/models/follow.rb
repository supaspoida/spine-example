class Follow
  include Informal::Model

  attr_accessor :id

  def self.people
    all.map { |f| Person.new(name: f.name) }
  end

  def self.all
    Persistence::Redis::Follow.all.map do |name|
      new(name: name)
    end
  end

  def destroy
    Persistence::Redis::Follow.destroy(id)
  end

  def to_param
    id
  end

  def save
    Persistence::Redis::Follow.create(id)
    valid?
  end

  def persisted?
    id.present? && Persistence::Redis::Follow.exists?(id)
  end

end
