package exercicios;

public class Arma02 implements Arma {

		int numeroDeTiros = 12;
		int tempoDeCarga = 8;
		
		
		@Override
		public void atirar() {
			    for(int i = 1; i < 13; i++)
				System.out.printf("Tiro %d, ", i);
			    }
	
		@Override
		public void recarregar() {
                System.out.println("Recarregando com 12 munições!! Aguarde 8 segundos!");
		}
		}


