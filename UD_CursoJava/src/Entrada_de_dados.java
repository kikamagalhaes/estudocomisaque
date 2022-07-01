import java.util.Scanner;
public class Entrada_de_dados {

	public static void main(String[] args) {
		Scanner sc_variavel = new Scanner(System.in);
		String x;
		int y;
		x = sc_variavel.next();
		y = sc_variavel.nextInt();
		System.out.println("Você digitou: "+ x);
		System.out.println("Você digitou: "+ y);
		sc_variavel.close();
	}

}
