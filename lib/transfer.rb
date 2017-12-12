class Transfer
  attr_accessor :status

  def initialize(sender,receiver,amount)
    @sender = sender
    @status = "pending"
  end

end
