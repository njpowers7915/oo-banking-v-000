class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    @sender.valid? && @receiver.valid?
  end
  
  def bad_transfer?
    if @sender.balance <= 0 || @sender.status != "open"
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
    
  
  def execute_transaction
    self.bad_transfer?
    if self.valid? && @status == "pending"
      sender_amount = @amount * -1
      receiver_amount = @amount
      @sender.deposit(sender_amount)
      @receiver.deposit(receiver_amount)
      @status = "complete"
    end
  end
  
end
