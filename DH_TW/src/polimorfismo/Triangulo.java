package polimorfismo;

public class Triangulo extends Figura {
	
	@Override
	public void calcularArea() {
		
		double area = (this.base * this.altura) / 2;
		
		System.out.println("A área do triângulo é de: " + area);
	}

}
