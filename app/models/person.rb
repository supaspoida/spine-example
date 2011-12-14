class Person
  include Informal::Model

  attr_accessor :name

  PEOPLE = [
    { name: 'Lar'    },
    { name: 'Dave'   },
    { name: 'Robert' },
  ]

  def self.all
    PEOPLE.map(&method(:new)).sort_by(&:name)
  end

  def as_json(*args)
    { id: name, name: name }
  end

  def follow
    Follow.new(id: name)
  end

  def follows
    Persistence::Redis::Follow
  end

  def followed?
    follows.exists?(name)
  end

end
