package gestoreRisorse;

public class mainProgram {

	public static void main(String[] args) {
		Buffer buffer = new Buffer();
		mioThread A = new mioThread(buffer);
		mioThread B = new mioThread(buffer);
		mioThread C = new mioThread(buffer);
	
	A.start();
	B.start();
	C.start();
	A.richiestaRisorsa();
	
	
	
	}

}
