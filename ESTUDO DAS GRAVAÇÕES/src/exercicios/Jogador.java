package exercicios;

/*     CRIANDO UM JOGO!!
 * 
 * - Crie uma classe Jogador.
 * - Um Jogador tem uma arma.
 * - Uma arma deverá ter métodos para "atirar" e "recarregar".
 * - Cada arma gasta uma quantidade diferente de munição por tiro.
 * - Cada arma demora uma quantidade diferente de tempo, em segundos, para recarregar.
 * - Implemente dois tipos de armas diferentes.
 */

public class Jogador {

	public static void main(String[] args) {

// Instanciando a Classe Arma01

		Arma01 PrimeiraArma = new Arma01();
		System.out.println("Utilizando a primeira arma: ");
		PrimeiraArma.recarregar();
		PrimeiraArma.atirar();
		PrimeiraArma.silenciar();

		System.out.println("");

// Instanciando a Classe Arma02

		Arma02 SegundaArma = new Arma02();
		System.out.println("Utilizando a segunda arma: ");
		SegundaArma.recarregar();
		SegundaArma.atirar();

	}

}
