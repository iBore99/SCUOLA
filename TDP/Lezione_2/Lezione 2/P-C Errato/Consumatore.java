public class Consumatore extends Thread 
{
	private Buffer buffer;
	private int number;
	public Consumatore(Buffer b, int numero) {
	buffer = b;
	this.number = numero;
}

	public void run() {
		int valore = 0;
		for (int i = 0; i < 10; i++) 
		{
			valore = buffer.get();
			System.out.println("Consumatore #"+this.number+" get: "+ valore);
		}
	}
}