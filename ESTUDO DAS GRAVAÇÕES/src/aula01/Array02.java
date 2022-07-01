package aula01;

public class Array02 {

	public static void main(String[] args) {
		
		String[] frutas = new String[] { "mamão","pera","maça","laranja","jabuticaba" };
		
		System.out.print ("As frutas são: ");
		
		for(int i = 0; i < frutas.length; i++) {
			
			System.out.print(" - ");
			System.out.print (frutas[i]);
			
		}

	}

}
