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

end
