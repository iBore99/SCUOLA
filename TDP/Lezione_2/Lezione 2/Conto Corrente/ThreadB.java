

public class ThreadB extends Thread {
private BankAccount sharedAccount;
	
	public ThreadB(BankAccount account){
		sharedAccount = account;
	}

	@Override
	public void run() {
		try {
			Thread.sleep(100);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		sharedAccount.deposit(50);
	}	
}
