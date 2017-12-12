class Transfer
  attr_accessor :status, :sender, :receiver, :amount
  @@all = []

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @@all << @amount
  end

  def valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    if @sender.status == "closed" || @sender.balance < 0
      return "Transaction rejected. Please check your account balance."
    else
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
