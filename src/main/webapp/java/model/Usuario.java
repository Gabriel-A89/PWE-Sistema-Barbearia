package model;


import java.sql.ResultSet;

import java.sql.SQLException;
import java.util.ArrayList;

import database.DBQuery;

public class Usuario {
	
	private int idUsuario;
	private String email;
	private String senha;
	private int idNivelUsuario;
	private String nome;
	private String cpf;
	private String telefone;
	private String foto;
    private String usuarioDAO;
    
	
	private String tableName = "usuarios";
	private String fieldsName = "idUsuario, email, senha, idNivelUsuario, nome, cpf, telefone, foto, usuarioDAO"; 
	private String fieldKey = "idUsuario";
	private DBQuery dbQuery = new DBQuery(tableName, fieldsName, fieldKey);
			
	public Usuario() {
		
	}
	
	public Usuario(int idUsuario, String email, String senha, int idNivelUsuario, String nome, String cpf, String telefone, String foto, String usuarioDAO){
		this.setIdUsuario(idUsuario);
		this.setEmail(email);
		this.setSenha(senha);
		this.setIdNivelUsuario(idNivelUsuario);
		this.setNome(nome);
		this.setCpf(cpf);
		this.setTelefone(telefone);
		this.setFoto(foto);
		this.setUsuarioDAO(usuarioDAO);
	}
	
	public String toString() {
		
		String outStr = 
				this.getIdUsuario() + " | " +
				this.getEmail() + " | " +
				this.getSenha() + " | " +
				this.getIdNivelUsuario() + " | " +
				this.getNome() + " | " +
				this.getCpf() + " | " +
				this.getTelefone() + " | " +
				this.getFoto() + " | " +
				this.getUsuarioDAO();
				
		return outStr;
	}
	

	private ArrayList<Usuario> listAll() {
		ArrayList<Usuario> usuarios = new ArrayList<Usuario>();
		ResultSet linhas = this.dbQuery.select("");
		try {
			while (linhas.next()) {
				usuarios.add(
						new Usuario(
								linhas.getInt("idUsuario"),
								linhas.getString("email"),
								linhas.getString("senha"),
								linhas.getInt("idNivelUsuario"),
								linhas.getString("nome"),
								linhas.getString("cpf"),
								linhas.getString("telefone"),
								linhas.getString("foto"),
								linhas.getString("usuarioDAO")
						)
				);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return(usuarios);
	}
	
	public void showConsole(){
		ArrayList<Usuario> usuarios = this.listAll();
		System.out.println( "");
		for (int i = 0; i < usuarios.size(); i++) {
			System.out.println( usuarios.get(i).toString() );
		}
	}
	
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public int getIdNivelUsuario() {
		return idNivelUsuario;
	}
	public void setIdNivelUsuario(int idNivelUsuario) {
		this.idNivelUsuario = idNivelUsuario;
	}
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
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getFoto() {
		return foto;
	}
	public void setFoto(String foto) {
		this.foto = foto;
	}
	public String getUsuarioDAO() {
		return usuarioDAO;
	}
	public void setUsuarioDAO(String UsuarioDAO) {
		this.usuarioDAO = UsuarioDAO;
	}


}
