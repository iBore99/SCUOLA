package Somma_parallela;

import java.util.ArrayList;

public class mainProgram {

	public static void main(String[] args) {
		ArrayList<Integer> array = new ArrayList<>();

		for(int i = 0; i < 50; i++) {
		     array.add(1);
		    // array.add( (int) ( Math.random() * 10));
		
		}
		
			
		mioThread t1 = new mioThread(array.subList(0, 10));
		mioThread t2 = new mioThread(array.subList(10, 20));
		mioThread t3 = new mioThread(array.subList(20, 30));
		mioThread t4 = new mioThread(array.subList(30, 40));
		mioThread t5 = new mioThread(array.subList(40, 50));
		
		t1.start();
		t2.start();
		t3.start();
		t4.start();
		t5.start();

		
		try {
			t1.join();
			t2.join();
			t3.join();
			t4.join();
			t5.join();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		int sommaTOTThread = t1.getSommaTOT() + t2.getSommaTOT() + t3.getSommaTOT() + t4.getSommaTOT() + t5.getSommaTOT();
		System.out.println("La somma totale è: " + sommaTOTThread);
		
		
	}

}
