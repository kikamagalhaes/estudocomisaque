package service;

import model.Cliente;
import notificacao.NotificadorSMS;

public class AtivacaoClienteService {

	public void ativar (Cliente cliente) {
		
		cliente.ativar();
		
		NotificadorSMS notificadorSMS = new NotificadorSMS();
		notificadorSMS.notificar(cliente);
	}
}
