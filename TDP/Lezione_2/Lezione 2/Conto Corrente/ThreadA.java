

public class Thread extends Thread {

	private BankAccount sharedAccount;
	
	public Thread(BankAccount account){
		sharedAccount = account;
	}

	@Override
	public void run() {
		try {
			Thread.sleep(100);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		sharedAccount.withdraw(100);
	}	
}
