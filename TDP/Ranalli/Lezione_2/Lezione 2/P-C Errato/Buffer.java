public class Buffer 
{
	private int valore;
	private boolean disponibile = false;

	public int get() {
		while (disponibile == false) ;
		disponibile = false;
		return valore;
	}
	public void put(int value) {
		while (disponibile == true);
		valore = value;
		disponibile = true;
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