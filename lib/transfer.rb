class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    self.is_sender_valid? && @receiver.valid?
  end
  
  def is_sender_valid?
    (@sender.balance - @amount) > 0 && @sender.valid?
  end
  
  def execute_transaction
    if self.valid? && @status == "pending"
      sender_amount = @amount * -1
      receiver_amount = @amount
      @sender.deposit(sender_amount)
      @receiver.deposit(receiver_amount)
      @status = "complete"
    elsif is_sender_valid? == false
      @status = "rejected"
      "Transaction rejected. Please check youraccount balance."
    end
  end
  
end
