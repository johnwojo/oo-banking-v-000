class Transfer
  attr_accessor :status, :sender, :receiver, :amount
  @@all = []

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def self.all
    @@all
  end


  def valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    if self.sender.status == "open" && @sender.balance > 0
      @sender.balance = @sender.balance - @amount
      @receiver.balance = @receiver.balance + @amount
      @status = "complete"
    else
      return "Transaction rejected. Please check your account balance."
      end
    end

  def reverse_transfer
    @sender.balance += @@all.last
    @receiver.balance -= @@all.last
  end

end
