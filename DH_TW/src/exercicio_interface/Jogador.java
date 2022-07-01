package exercicio_interface;

public class Jogador {

	public static void main(String[] args) {
		
		// instanciando a classe Ak
		Ak aK = new Ak();
		
		// instanciando a classe m4
		M4 m4 = new M4();
		
		System.out.println("ak : ");
		aK.atirar();
		aK.recarregar();
		
		System.out.println("m4 : ");
		m4.atirar();
		m4.recarregar();

	}

}
