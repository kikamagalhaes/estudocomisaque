

import java.util.Locale;

import java.util.Scanner;

public class programa {

	public static void main(String[] args) {
		Locale.setDefault(Locale.US);
		Scanner sc = new Scanner(System.in);
		
		Produtos produtos = new Produtos();
		System.out.println("Entre com a informação do produto: ");
		System.out.print("Nome: ");
		produtos.name = sc.nextLine();
		System.out.print("Preço: ");
		produtos.preco = sc.nextDouble();
		System.out.print("Quantidade no estoque: ");
		produtos.quantidade = sc.nextInt();
		sc.close();

	}

}
