require 'pry'
class Transfer
  attr_accessor :status, :sender, :receiver, :amount, :all
  @@all = []

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @@all << @amount
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
    end

  def reverse_transfer
    @sender.balance += @@all.last
    @receiver.balance -= @@all.last
  end
end
