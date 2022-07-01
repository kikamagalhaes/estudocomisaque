package aula01;

public class Array01 {

	public static void main(String[] args) {

		String frutas[] = new String [5];
		frutas[0] = "maça";
		frutas[1] = "pera";
		frutas[2] = "mamão";
		frutas[3] = "laranja";
		frutas[4] = "abacaxi";
	

	for (int i = 0; i < frutas.length ; i++) {
		
		System.out.println("fruta: " + frutas[i] + " posição: " +i);
		
	}
		System.out.println ();
		
		System.out.print("Nossas frutas são:");

		
		for (int i = 0; i < frutas.length ; i++) {
			
			System.out.printf(" - %s", frutas[i]);
		}
		
	
	}

}
