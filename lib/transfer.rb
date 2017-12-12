class Transfer
  attr_accessor :status

  def initialize(sender,receiver,amount)
    @status = "pending"

  end

end
