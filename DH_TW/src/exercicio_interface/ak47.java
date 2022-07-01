package exercicio_interface;

public class ak47 implements arma{
	
	int municao = 40;
	int disparo = 5;
	double tempoRecarga = 0.5;
	
	@Override
	public void recarregar() {
		
		System.out.println("Recarregado: " +municao+ " você recarregou em: " +tempoRecarga);
		
	}
	
	@Override
	public void atirar() {
		
		System.out.println("");
	}
}}

}
