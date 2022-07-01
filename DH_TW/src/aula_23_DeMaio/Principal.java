package aula_23_DeMaio;

public class Principal {

	public static void main(String[] args) {

		Cachorro cachorro = new Cachorro();
		Gato gato = new Gato();
		
		boolean retornoCachorro = cachorro.animalSaudavel("Tudo bem");
		
		boolean retornoGato = gato.animalSaudavel("Patinha ferida");
		
		System.out.println(retornoCachorro);
		System.out.println(retornoGato);
	}

}
