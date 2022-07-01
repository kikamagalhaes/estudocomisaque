package aula02_POO;

import java.util.Scanner;

public class Exercicio {

	
	public static void main(String[] args) {
        Scanner Ler = new Scanner(System.in);
        int idade = 0;
        int qtde = 0;
        int i = 1;
        System.out.println("Programa que determina quantas pessoas possuem 18 anos ou mais");
        while(i <= 10){
            System.out.print("Informe a idade da "+i+" pessoa: ");
            idade = Integer.parseInt(Ler.nextLine());
            if(idade >= 18){
                qtde++;
            }
            i = i +1;
        }
        System.out.println("Existem "+qtde+" pessoas que possuem 18 anos ou mais");

		
	

	}
}
