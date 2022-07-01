package exercicios;

public class Arma01 implements Arma{
	
		int numeroDeTiros = 7;
		int tempoDeCarga = 5;
		
		public void silenciar() {
			System.out.println("Com silenciador ativado!");}
		
		@Override
		public void atirar() {
			    for(int i = 1; i < 8; i++)
				System.out.printf("Tiro %d, ", i);
			    }
	
		@Override
		public void recarregar() {
                System.out.println("Recarregando com 7 munições!! Aguarde 5 segundos!");
		}
		}

