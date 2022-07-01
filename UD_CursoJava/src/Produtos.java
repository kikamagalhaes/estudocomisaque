

public class Produtos {

	public String name;
	public double preco;
	public int quantidade;
	
	public double valorTotalEmEstoque() {
	return preco * quantidade;

	}
	
	public void addProduto (int quantidade) {
		this.quantidade += quantidade;
	}
	
	public void removeProduto (int quantidade) {
		this.quantidade -= quantidade;
	}


}
