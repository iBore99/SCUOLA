

public class BankAccount {
	
	private int balance;
	
	public BankAccount(int initialBalance){
		this.balance = initialBalance;
	}

	public void deposit(int value){
		balance += newBalance;
	}
	
	public int withdraw(int value){
		if(balance >= value){
			balance -= value;
			return value;
		}
		return -1;
	}
	
	
	
	public int getBalance(){
		return balance;
	}
	
	public static void main(String[] args){
		BankAccount account = new BankAccount(1000);
	
		Thread a = new Thread(account);
		Thread b = new Thread(account);
		a.start();
		b.start();
		
		try {
			a.join();
			b.join();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		System.out.println("Balance: " + account.getBalance());
	}

}
