public class Buffer 
{
	private int valore;
	private boolean disponibile = false;

	public synchronized int get() {
		while (disponibile == false)
		{
			try{wait();} catch(InterruptedException e){}
		}
		disponibile = false;
		notifyAll();
		return valore;
	}
	public synchronized void put(int value) {
		while (disponibile == true){
			try{wait();} catch(InterruptedException e){}
		}
		valore = value;
		disponibile = true;
		notifyAll();
	}
	
	public static void main(String[] a)
	{
			Buffer b=new Buffer();
			Produttore p=new Produttore(b,1);
			Consumatore c=new Consumatore(b,1);
			p.start();
			c.start();
	}
}