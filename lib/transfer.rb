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
    if @sender.status == "open" && @sender.balance > @amount && !@@all.include?(@amount)
      @sender.balance = @sender.balance - @amount
      @receiver.balance = @receiver.balance + @amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
      end
      @@all << @amount
    end

  def reverse_transfer
    @sender.balance += @@all.last
    @receiver.balance -= @@all.last
  end

end
