import java.util.Scanner;
public class ternario {

	public static void main(String[] args) {
		System.out.println("Digite o valor do produto: ");
		Scanner sc = new Scanner(System.in);
		double valorOriginal = sc.nextDouble();
		
		

double desconto = (valorOriginal < 20.0) ? valorOriginal * 0.1 : valorOriginal * 0.05;
double precoFinal = valorOriginal - desconto;

	System.out.printf("Seu desconto é de: R$%.1f%n", desconto);
	System.out.printf("Você deve pagar R$%.2f  %n", precoFinal);
	}
}
