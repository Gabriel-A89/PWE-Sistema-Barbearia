package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import database.DBQuery;

public class Agendamento {
	
    private int idAgendamento;
    private String nome;
    private String cpf;
    private String data;
    private int idCorte;
    private String barbeiro;
    private String descricao;
    private String horario;
    private int idUsuario;
    private String agendamentoDAO;
    
	private String tableName = "agendamento";
	private String fieldsName = "idAgendamento, nome, cpf, idCorte, barbeiro, descricao, horario, idUsuario"; 
	private String fieldKey = "idAgendamento";
	private DBQuery dbQuery = new DBQuery(tableName, fieldsName, fieldKey);
    
	public Agendamento(int idAgendamento, String nome, String cpf, String data, int idCorte, String barbeiro, String descricao, String horario, int idUsuario) {
		this.setIdAgendamento(idAgendamento);
		this.setNome(nome);
		this.setData(cpf);
		this.setIdCorte(idCorte);
		this.setBarbeiro(barbeiro);
		this.setDescricao(descricao);
		this.setHorario(horario);
		this.setIdUsuario(idUsuario);
		
		//this.setAgendamentoDAO = AgendamentoDAO agendamentoDAO;
	}
	

	
	private ArrayList<Agendamento> listAll() {
		ArrayList<Agendamento> agendamento = new ArrayList<Agendamento>();
		ResultSet linhas = this.dbQuery.select("");
		try {
			while (linhas.next()) {
				agendamento.add(
						new Agendamento(
								linhas.getInt("idAgendamento"),
								linhas.getString("nome"),
								linhas.getString("cpf"),
								linhas.getString("data"),
								linhas.getInt("idCorte"),
								linhas.getString("barbeiro"),
								linhas.getString("descricao"),
								linhas.getString("horario"),
								linhas.getInt("idUsuario")
						)
				);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return(agendamento);
	}

	
	
	public int getIdAgendamento() {
		return idAgendamento;
	}

	public void setIdAgendamento(int idAgendamento) {
		this.idAgendamento = idAgendamento;
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

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public int getIdCorte() {
		return idCorte;
	}

	public void setIdCorte(int idCorte) {
		this.idCorte = idCorte;
	}

	public String getBarbeiro() {
		return barbeiro;
	}

	public void setBarbeiro(String barbeiro) {
		this.barbeiro = barbeiro;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getHorario() {
		return horario;
	}

	public void setHorario(String horario) {
		this.horario = horario;
	}

	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getAgendamentoDAO() {
		return agendamentoDAO;
	}

	public void setAgendamentoDAO(String agendamentoDAO) {
		this.agendamentoDAO = agendamentoDAO;
	}
}

