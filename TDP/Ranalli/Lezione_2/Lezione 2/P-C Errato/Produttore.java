public class Produttore extends Thread {
	private Buffer buffer;
	private int numero;
	public Produttore(Buffer b, int numero) 
	{
		buffer = b;
		this.numero = numero;
	}
	
	public void run() 
	{

		for (int i = 0; i < 10; i++) 
		{
			buffer.put(i);
			System.out.println("Produttore #"+this.numero+" put: "+i);
		}
		
	}
}