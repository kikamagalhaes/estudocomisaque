
public class Main {

	public static void main(String[] args) {
		double numero_decimal = 10.8475385;
		int idade = 15;
		String nome_da_pessoa = "Maria";
		String mensagem = "Tudo bem com vc?";
		System.out.print("Olá Mundo!");
		System.out.println("Bom dia!");
		System.out.println(mensagem);
		System.out.printf("%.2f%n", numero_decimal);
		System.out.printf("%.4f%n", numero_decimal);
		System.out.printf("%.3f%n", numero_decimal);
		System.out.printf("%f %s no mundo com %d de idade %n", numero_decimal, nome_da_pessoa, idade);
	}

}
