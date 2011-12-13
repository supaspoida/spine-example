class Follow
  include Informal::Model

  attr_accessor :person

  def save
    valid?
  end

end
