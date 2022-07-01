package exercicio_interface;

public class Ak implements Armas{
	
	public static void main(String[] args) {
		
	}
	
	@Override
	public void atirar() {
		
		System.out.println("Consumiu 30 munições");
	}

	@Override
	public void recarregar() {
		
		System.out.println("Você vai levar 2 segundos para recarregar");
	}
}
