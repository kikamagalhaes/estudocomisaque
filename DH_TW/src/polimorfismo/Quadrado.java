package polimorfismo;

public class Quadrado extends Figura {
	
	@Override
	public void calcularArea(double altura, double base) {
		
		double area = (this.base * this.altura) / 2;
		
		System.out.println("A área do quadrado é de: " + area);
	}

}