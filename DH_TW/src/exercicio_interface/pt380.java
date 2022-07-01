package exercicio_interface;

public class pt380 implements arma {
	
	int municao = 23;
	int disparo = 5;
	double tempoRecarga = 0.5;
	
	@Override
	public void recarregar() {
		
		System.out.println("Recarregado: " +municao+ "você recarregou em: " +tempoRecarga);
		
	}
	
	@Overrride
	public void atirar() {
		
		System.out.println("");
	}

}
