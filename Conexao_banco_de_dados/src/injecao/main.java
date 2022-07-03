package injecao;

import model.Cliente;
import service.AtivacaoClienteService;

public class main {

	public static void main(String[] args) {
		System.out.println("injeção");
		
		Cliente cliente = new Cliente("Rafael",false);		
		AtivacaoClienteService ativacaoClienteService = new AtivacaoClienteService();
		
		ativacaoClienteService.ativar(cliente);
		
	}

}
