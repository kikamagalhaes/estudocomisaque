package aula01;

import java.util.Scanner;

public class EntradaDeDados_Scanner {

	public static void main(String[] args) {

		Scanner leia = new Scanner(System.in);
		System.out.println("Qual a sua idade?");
		int idade = leia.nextInt();
		System.out.println(idade);
		
	}


}
