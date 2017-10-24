package Somma_parallela;


import java.util.List;

public class mioThread extends Thread{

	private List<Integer> arrayInternoThread;
	private int sommaTOT = 0;
	
	public mioThread(List<Integer> subList) {
		this.arrayInternoThread = subList;
	}

	public void run() {
		for(int elem : this.arrayInternoThread) {
			this.sommaTOT += elem;
		}
	}

	public int getSommaTOT() {
		return sommaTOT;
	}

}
