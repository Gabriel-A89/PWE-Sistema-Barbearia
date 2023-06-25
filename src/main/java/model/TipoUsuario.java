package model;


import java.sql.ResultSet;

import java.sql.SQLException;
import java.util.ArrayList;

import database.DBQuery;

public class TipoUsuario {
	
	private int idTipoUsuario;
	private String tipoUsuario;
	private String tipoUsuarioDAO;
    
	
	private String tableName = "tipoUsuario";
	private String fieldsName = "idTipoUsuario, tipoUsuario, tipoUsuarioDAO"; 
	private String fieldKey = "idTipoUsuario";
	private DBQuery dbQuery = new DBQuery(tableName, fieldsName, fieldKey);
			
	public TipoUsuario() {
		
	}
	
	public TipoUsuario(int idTipoUsuario, String tipoUsuario, String tipoUsuarioDAO){
		this.setIdTipoUsuario(idTipoUsuario);
		this.setTipoUsuario(tipoUsuario);
		this.setTipoUsuarioDAO(tipoUsuarioDAO);

	}
	
	public String toString() {
		
		String outStr = 
				this.getIdTipoUsuario() + " | " +
				this.getTipoUsuario() + " | " +
				this.getTipoUsuarioDAO();
				
		return outStr;
	}
	

	private ArrayList<TipoUsuario> listAll() {
		ArrayList<TipoUsuario> tipoUsuario = new ArrayList<TipoUsuario>();
		ResultSet linhas = this.dbQuery.select("", "");
		try {
			while (linhas.next()) {
				tipoUsuario.add(
						new TipoUsuario(
								linhas.getInt("idTipoUsuario"),
								linhas.getString("tipoUsuario"),
								linhas.getString("tipoUsuarioDAO")
						)
				);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return(tipoUsuario);
	}
	
	public void showConsole(){
		ArrayList<TipoUsuario> usuarios = this.listAll();
		System.out.println( "");
		for (int i = 0; i < usuarios.size(); i++) {
			System.out.println( usuarios.get(i).toString() );
		}
	}

	public int getIdTipoUsuario() {
		return idTipoUsuario;
	}

	public void setIdTipoUsuario(int idTipoUsuario) {
		this.idTipoUsuario = idTipoUsuario;
	}

	public String getTipoUsuario() {
		return tipoUsuario;
	}

	public void setTipoUsuario(String tipoUsuario) {
		this.tipoUsuario = tipoUsuario;
	}

	public String getTipoUsuarioDAO() {
		return tipoUsuarioDAO;
	}

	public void setTipoUsuarioDAO(String tipoUsuarioDAO) {
		this.tipoUsuarioDAO = tipoUsuarioDAO;
	}
	


}
