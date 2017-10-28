package gestoreRisorse;

public class mioThread extends Thread{
	private Buffer bufferComune;
	private String risorsa;
	public mioThread(Buffer buffer)
	{
		this.bufferComune = buffer;
	}
	
	public void run(){
		
	}
	
	public void richiestaRisorsa(){
		this.risorsa = bufferComune.richiesta();
		try {
			sleep(2000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		rilascioRisorsa();
	}
	
	public void rilascioRisorsa(){
		bufferComune.acquisizioneRisorsa(risorsa);
		risorsa = null;
	}
}
