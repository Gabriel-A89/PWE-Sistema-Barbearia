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
	private int idTipoUsuario;
	
    private UsuarioDAO usuarioDAO;
	
	private String tableName = "usuario";
	private String fieldsName = "idUsuario, nome, email, senha, telefone, cpf, foto, idTipoUsuario";
	private String fieldsCadastro = "nome, email, senha, telefone, cpf";
	private String fieldKey = "idUsuario";
	private DBQuery dbQuery = new DBQuery(tableName, fieldsName, fieldKey);
	private DBQuery dbQueryCadastro = new DBQuery(tableName, fieldsCadastro, fieldKey);
	
	public Usuario() {
		
	}
	
	public Usuario(int idUsuario, String nome, String email, String senha, String telefone, String cpf, String foto, int idTipoUsuario){
		this.setIdUsuario(idUsuario);
		this.setEmail(email);
		this.setSenha(senha);
		this.setIdNivelUsuario(idNivelUsuario);
		this.setNome(nome);
		this.setCpf(cpf);
		this.setTelefone(telefone);
		this.setFoto(foto);
	}
	
	public Usuario(String nome, String email, String senha, String telefone, String cpf){
		this.setNome(nome);
		this.setEmail(email);
		this.setSenha(senha);
		this.setTelefone(telefone);
		this.setCpf(cpf);
	}
	
	public Usuario(String nome, String email, String telefone, String cpf){
		this.setNome(nome);
		this.setEmail(email);
		this.setSenha(senha);
		this.setTelefone(telefone);
		this.setCpf(cpf);
	}
	
	public Usuario(String email, String senha) {
		this.setEmail(email);
		this.setSenha(senha);
	}
	
	public Usuario(String email) {
		this.setEmail(email);
	}
	
	public String toString() {
		
		String outStr = 
				this.getIdUsuario() + ", " +
				this.getEmail() + ", " +
				this.getSenha() + ", " +
				this.getIdNivelUsuario() + ", " +
				this.getNome() + ", " +
				this.getCpf() + ", " +
				this.getTelefone() + ", " +
				this.getFoto() + ", " +
				this.getUsuarioDAO();
				
		return outStr;
	}
	
	public String[] toArray(){
		return (
			new String[] {
					""+this.getIdUsuario(),
					""+this.getEmail(),
					""+this.getSenha(),
					""+this.getNome(),
					""+this.getCpf(),
					""+this.getTelefone(),
					""+this.getFoto(),
					""+this.getIdTipoUsuario()
			}
		);
	}
	
	public String[] toArrayCadastro(){
		return (
			new String[] {
					""+this.getNome(),
					""+this.getEmail(),
					""+this.getSenha(),
					""+this.getTelefone(),
					""+this.getCpf(),
			}
		);
	}
	
	public String[] toArrayAlteracao(){
		return (
			new String[] {
					""+this.getNome(),
					""+this.getEmail(),
					""+this.getTelefone(),
					""+this.getCpf(),
			}
		);
	}

	private ArrayList<Usuario> listAll() {
		ArrayList<Usuario> usuarios = new ArrayList<Usuario>();
		ResultSet linhas = this.dbQuery.select("", "");
		try {
			while (linhas.next()) {
				usuarios.add(
						new Usuario(
								linhas.getInt("idUsuario"),
								linhas.getString("nome"),
								linhas.getString("email"),
								linhas.getString("senha"),
								linhas.getString("telefone"),
								linhas.getString("cpf"),
								linhas.getString("foto"),
								linhas.getInt("idTipoUsuario")
						)
				);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return(usuarios);
	}
	
	public ArrayList<Usuario> listEmailCadastro(String value) {
		ArrayList<Usuario> usuarios = new ArrayList<Usuario>();
		ResultSet linhas = this.dbQuery.select("", "");
		try {
			while (linhas.next()) {
				usuarios.add(
						new Usuario(
								linhas.getString(value)
						)
				);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return(usuarios);
	}
	
    public boolean checkLogin(){
        dbQuery = new DBQuery("", "", "");
        
        this.email = dbQuery.clearSQLInjection(this.email);
        this.senha = dbQuery.clearSQLInjection(this.senha);
        
        //ResultSet lines =  mysqli_fetch_assoc(resultSet);
        //idUsuario = lines["idUsuario"];
        return (true);
    }
	
	public void showConsole(){
		ArrayList<Usuario> usuarios = this.listAll();
		System.out.println( "");
		for (int i = 0; i < usuarios.size(); i++) {
			System.out.println( usuarios.get(i).toString() );
		}
	}
	
	public void save() {
		this.dbQuery.insert(this.toArray());
	}
	
	public void saveCadastro() {
		this.dbQueryCadastro.insert(this.toArrayCadastro());
	}
	
	public void delete() {
		this.dbQuery.delete(this.toArray());
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
	public UsuarioDAO getUsuarioDAO() {
		return usuarioDAO;
	}
	public void setUsuarioDAO(UsuarioDAO usuarioDAO) {
		this.usuarioDAO = usuarioDAO;
	}
	
	public int getIdTipoUsuario() {
		return idTipoUsuario;
	}
	public void setIdTipoUsuari(int idTipoUsuario) {
		this.idTipoUsuario = idTipoUsuario;
	}
	
	public String cadFields() {
		return fieldsName;
	}
	public void setIdTipoUsuari(String fieldsName) {
		this.fieldsName = fieldsName;
	}
}