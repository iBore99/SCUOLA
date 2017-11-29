package gestoreRisorse;

import java.util.ArrayList;

public class Buffer {
	private final int N = 2;
	private ArrayList<String> buffer = new ArrayList<>(N);
	private int elemDisponibili = N;
	
	
	public Buffer(){
		inizializzazioneBuffer();
	}
	
	private void inizializzazioneBuffer(){
		for(int i = 0; i < N; i++){
			buffer.add( "risorsa " + i);
		}
	}
	
	public synchronized String richiesta(){
		
		while(this.elemDisponibili == 0){
			try {
				wait();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		this.elemDisponibili--;
		int iElem = primoElementoDisponibile();
		String elem = this.buffer.get(iElem);
		this.buffer.set(iElem,null);
		
		return elem;
	}
	
	private int primoElementoDisponibile(){
		
		for(int i = 0; i < N; i++){
			if(buffer.get(i) != null){
				return i;
			}
		}
		return -1;
	}
	
	private int primoPostoDisponibile(){
		
		for(int i = 0; i < N; i++){
			if(buffer.get(i) == null){
				return i;
			}
		}
		return -1;
	}
	
	
	public synchronized void acquisizioneRisorsa(String risorsa){
		this.elemDisponibili++;
		this.buffer.set(primoPostoDisponibile(), risorsa);
		notify();
		
	}
}
