package model;

import database.DBQuery;

import java.sql.ResultSet;

public class UsuarioDAO {
	DBQuery dbQuery;
	
	public UsuarioDAO() {
        String tableName  = "bomcorte.usuario";
        String fields     = "idUsuario,nome,email,senha,telefone,cpf,foto,idTipoUsuario";
        String FieldKey   = "idUsuario";
        
        this.dbQuery = new DBQuery(tableName, fields, FieldKey);
	}
	
    public boolean create( Usuario usuario ){
        return (this.dbQuery.insert( usuario.toArray() ) > 0);
    }
    
    public ResultSet select(String where ){
        return (this.dbQuery.select(where));
    }
    
    public boolean update( Usuario usuario ){
        return (this.dbQuery.update(usuario.toArray()) > 0);
    }
    
    public void delete( Usuario usuario ){
        return (this.dbQuery.delete(usuario.getIdUsuario()) > 0);
    }
    
    public ResultSet listAll() {
        return (this.dbQuery.select("") );
    }
}
