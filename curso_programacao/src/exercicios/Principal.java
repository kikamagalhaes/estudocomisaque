package exercicios;

import java.util.Locale;
import java.util.Scanner;

public class Principal {

	public static void main(String[] args) {

		Locale.setDefault(Locale.US);
		Scanner sc = new Scanner(System.in);
		
		NumeroDaConta numeroDaConta;
		
		System.out.println("Digite o número da conta: ");
		numeroDaConta = sc.nextInt();
		
		System.out.println("Digite o nome do titular da conta: ");
		sc.nextLine();
		String titularDaConta = sc.nextLine();
		System.out.println("Você fará um depósito inicial (s/n)? ");
		char respostaDepositoInicial = sc.next().charAt(0);
		if (respostaDepositoInicial == 's') {
			
			
			
		System.out.println("Digite o valor do depósito inicial: ");
		depositoInicial = sc.nextDouble();

		double saldoParcial = (depositoInicial + depositoPosterior);

		System.out.println(numeroDaConta);
		System.out.println(nomeDoTitular);
		System.out.println(depositoInicial);
		System.out.println(saldoParcial);

	}

}

public static void main(String[] args) {

		System.out.print("Enter initial deposit value: ");
		double initialDeposit = sc.nextDouble();
		account = new Account(number, holder, initialDeposit);
	}
	else {
		account = new Account(number, holder);
	}
	
	System.out.println();
	System.out.println("Account data:");
	System.out.println(account);
	
	System.out.println();
	System.out.print("Enter a deposit value: ");
	double depositValue = sc.nextDouble();
	account.deposit(depositValue);
	System.out.println("Updated account data:");
	System.out.println(account);
	
	System.out.println();
	System.out.print("Enter a withdraw value: ");
	double withdrawValue = sc.nextDouble();
	account.withdraw(withdrawValue);
	System.out.println("Updated account data:");
	System.out.println(account);
	
	sc.close();
}
}
