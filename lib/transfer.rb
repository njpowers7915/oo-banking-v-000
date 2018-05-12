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
  
  def sender_not_valid?
    if @sender.valid? != true
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def execute_transaction
    if sender_valid? == false
      @status = "rejected"
    elsif self.valid? && @status == "pending"
      sender_amount = @amount * -1
      receiver_amount = @amount
      @sender.deposit(sender_amount)
      @receiver.deposit(receiver_amount)
      @status = "complete"
    elsif self.vaild? == false
      if @sender.valid? == false
    end
  end
  
end
