require 'pry'
class Transfer
  attr_accessor :status, :sender, :receiver, :amount, :all
  @@all = []

  def initialize(sender,receiver,amount)
    @@all << @amount
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
    if status == "pending" && valid?
      @sender.balance = @sender.deposit(-amount)
      @receiver.balance = @receiver.deposit(amount)
      @status = "complete"
    elsif !valid?
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    end

  def reverse_transfer
    @sender.balance += @@all.last
    @receiver.balance -= @@all.last
  end
end
