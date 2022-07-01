import java.util.Scanner;

public class Product {
	public String name;
	public double price;
	public int quantity;

	public Product() {
	}

	public Product(String name, double price, int quantity) {
		this.name = name;
		this.price = price;
		this.quantity = quantity;
	}

	public static void main(String[] args) {
		Scanner entrada = new Scanner(System.in);
		System.out.println("Enter product data: ");
		System.out.print("Name: ");
		String name = entrada.nextLine();
		System.out.print("Price: ");
		double price = entrada.nextDouble();
		System.out.print("Quantity in stock: ");
		int quantity = entrada.nextInt();
		Product product = new Product(name, price, quantity);

		System.out.println("");

		System.out.printf("os produtos são: %s, %.2f e %d", name, price, quantity);
	}

}