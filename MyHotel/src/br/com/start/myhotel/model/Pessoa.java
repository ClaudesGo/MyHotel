package br.com.start.myhotel.model;

public abstract class Pessoa {
	
	private int status;
	private String nome;
	private String cpf;
	private String senha;
	private String email;
	private String tipoConta;
	
	
	
	public Pessoa() {
		
	}
	//CONSTRUTOR QUE COMPLETO

	public Pessoa(String nome, String cpf, String senha, String email ,String tipoConta) {
		this.nome = nome;
		this.cpf = cpf;
		this.email = email;
		this.tipoConta = tipoConta;
		this.senha = senha;
	}
	


	public Pessoa(String nome, String cpf, String senha, String email) {
		this.nome = nome;
		this.cpf = cpf;
		this.senha = senha;
		this.email = email;
	}
	
	//CONSTRUTOR SEM O ATRIBUTO ID
	public Pessoa(String nome, String cpf) {
			this.nome = nome;
			this.cpf = cpf;
	}
	
	// GET E SETERS DA CLASSE
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getTipoConta() {
		return tipoConta;
	}
	public void setTipoConta(String tipoConta) {
		this.tipoConta = tipoConta;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
}
