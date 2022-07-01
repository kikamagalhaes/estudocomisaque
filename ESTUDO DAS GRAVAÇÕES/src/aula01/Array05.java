package aula01;

public class Array05 {

	public static void main(String[] args) {

		int[] vetor = new int[3];
		String[] frutas = {"mamão", "maçã", "banana"};
		
	
	
	// outra forma seria:
	/*  
	 * String[] frutas = new String {"mamão", "maçã", "banana"};
	 */
	
	for (String variavel : frutas) {
		System.out.println(variavel);
	}
	}
}
