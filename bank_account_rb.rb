class BankAccount
  @@minimum_balance = 100
  attr_reader :balance
  # attr_accessor :deposit

  def initialize(openning_balance, name)
    @name = name
    if openning_balance < 200
      raise ArgumentError
    else
    @balance = openning_balance
    end
  end

  def self.minimum_balance=(min_bal)
    @@minimum_balance = min_bal
  end

  def self.minimum_balance
    @@minimum_balance
  end

  def balance
    @balance
  end


  def deposit(d_amount)
    @balance += d_amount
  end

  def withdrawal(w_amount)
    @balance -= w_amount
  end

  def transfer(t_amount, other_account)
    @balance -= t_amount
    other_account.deposit(t_amount)
    # self.withdrawal(amount)
    # other.deposit(amount)
  end
end

account =  BankAccount.new(200, "Sarah")
puts account.balance
account.deposit(500)
puts account.balance
account.withdrawal(200)
puts account.balance
other_account = BankAccount.new(1000, "Todd")
puts other_account.balance
account.transfer(450, other_account)
puts account.balance