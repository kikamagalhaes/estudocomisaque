package Exercicio82;

import java.util.Locale;
import java.util.Scanner;
import Exercicio82.ContaBancaria;


public class Programa {

	public static void main(String[] args) {

		Locale.setDefault(Locale.US);
		Scanner sc = new Scanner(System.in);
		ContaBancaria contaBancaria;

		System.out.print("Digite o Número da Conta: ");
		int numeroDaConta = sc.nextInt();
		System.out.print("Digite o Nome do Titular da Conta: ");
		sc.nextLine();
		String nomeDoTitular = sc.nextLine();
		System.out.print("Haverá um depósito inicial (s/n)? ");
		char response = sc.next().charAt(0);
		if (response == 's') {
			System.out.print("Digite o valor do depósito inicial: ");
			double depositoInicial = sc.nextDouble();
			contaBancaria = new ContaBancaria(numeroDaConta, nomeDoTitular, depositoInicial);
		}
		else {
			contaBancaria = new ContaBancaria(numeroDaConta, nomeDoTitular);
		}
		
		System.out.println();
		System.out.println("Conta Bancária data:");
		System.out.println(contaBancaria);
		
		System.out.println();
		System.out.print("Digite o valor do depósito: ");
		double valorDoDeposito = sc.nextDouble();
		contaBancaria.deposito(valorDoDeposito);
		System.out.println("Conta bancária atualizada:");
		System.out.println(contaBancaria);
		
		System.out.println();
		System.out.print("Digite o valor do saque: ");
		double valorDoSaque = sc.nextDouble();
		contaBancaria.saque(valorDoSaque);
		System.out.println("Atualização da conta:");
		System.out.println(contaBancaria);
		
		sc.close();
	}
}