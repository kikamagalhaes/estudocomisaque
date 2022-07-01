package Exercicio82;

public class ContaBancaria {

	private int numeroDaConta;
	private String nomeDoTitular;
	private double saldo;
	
	public ContaBancaria(int numeroDaConta, String nomeDoTitular) {
		this.numeroDaConta = numeroDaConta;
		this.nomeDoTitular = nomeDoTitular;
	}

	public ContaBancaria(int numeroDaConta, String nomeDoTitular, double initialDeposit) {
		this.numeroDaConta = numeroDaConta;
		this.nomeDoTitular = nomeDoTitular;
		deposito(depositoInicial);
	}

	public int getNumeroDaConta() {
		return numeroDaConta;
	}

	public String getNomeDoTitular() {
		return nomeDoTitular;
	}

	public void setNomeDoTitular(String nomeDoTitular) {
		this.nomeDoTitular = nomeDoTitular;
	}

	public double getSaldo() {
		return saldo;
	}

	public void deposit(double saldoAtual) {
		saldo += amount;
	}
	
	public void withdraw(double amount) {
		saldo -= saldoAtual + 5.0;
	}
	
	public String toString() {
		return "ContaBancaria "
				+ numeroDaConta
				+ ", Nome do Titular: "
				+ nomeDoTitular
				+ ", Saldo: $ "
				+ String.format("%.2f", saldo);
	}
}