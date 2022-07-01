package exercicio_interface;

public class M4 implements Armas{

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	
	@Override
	public void atirar() {
		
		System.out.println("Consumiu 25 munições");
	}

	@Override
	public void recarregar() {
		
		System.out.println("Você vai levar 3 segundos para recarregar");
	}
}
