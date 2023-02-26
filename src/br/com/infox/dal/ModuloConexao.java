package br.com.infox.dal;

import java.sql.*;

public class ModuloConexao {

    //método responsável por estabelecer a conexão com o BD
    public static Connection conector() { //método se chama conector
        java.sql.Connection conexao = null; // variável se chama conexão
        // a linha abaixo chama o driver
        String driver = "com.mysql.cj.jdbc.Driver";
        // armazenando informações referentes ao BD
        String url = "jdbc:mysql://localhost:3306/dbinfox";
        String user = "root";
        String password = "root";
        // estabelecendo a conexão com o BD
        try {
            Class.forName(driver);
            conexao = DriverManager.getConnection(url, user, password);
            return conexao;
        } catch (Exception e) {
            //a linha abaixo, serve de apoio para esclarecer possiveis errros
            //System.out.println(e);
            return null;
        }
    }
}
