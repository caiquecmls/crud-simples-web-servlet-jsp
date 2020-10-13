/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package caique.dao;

import caique.db.ConexaoDB;
import caique.entidade.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author caiqu
 */
public class ClienteDao {

    public static boolean cadastrarCliente(Cliente cliente) {
        boolean ok = false;
        Connection con;
        try {
            con = ConexaoDB.getConexao();
            String sql = "insert into cliente values (default,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, cliente.getNome());
            ps.setString(2, cliente.getEmail());
            ps.setInt(3, cliente.getCpf());
            ps.setString(4, cliente.getEndereco());
            ps.setInt(5, cliente.getTelefone());
            ps.setString(6, cliente.getGenero());
            ps.setString(7, cliente.getEstadoCivil());
            ps.execute();
            ok = true;

        } catch (SQLException ex) {
            Logger.getLogger(ClienteDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ok;
    }

    public static boolean update(Cliente clienteUp) {
        boolean ok = false;
        Connection con;
        try {
            con = ConexaoDB.getConexao();

            String sql = "update cliente set nome=?,email=?,cpf=?,endereco=?,telefone=?,genero=?,estadoCivil=? where id=? ;";//+ID;
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, clienteUp.getNome());
            ps.setString(2, clienteUp.getEmail());
            ps.setInt(3, clienteUp.getCpf());
            ps.setString(4, clienteUp.getEndereco());
            ps.setInt(5, clienteUp.getTelefone());
            ps.setString(6, clienteUp.getGenero());
            ps.setString(7, clienteUp.getEstadoCivil());
            ps.setInt(8, clienteUp.getId());           
            ps.executeUpdate();
            ok = true;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return ok;
    }

    public static boolean excluir(String id) {
        boolean ok = false;
        Connection con;
        try {
            con = ConexaoDB.getConexao();

            String sql = "delete from cliente where id ='" + id + "';";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.executeUpdate();
            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(ClienteDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ok;
    }

    public static List<Cliente> BuscarClientes(int ID) {
        List<Cliente> cliente = new ArrayList<>();
        boolean ok = false;
        Connection con;
        try {

            con = ConexaoDB.getConexao();
            String sql = "select * from cliente where id= " + ID;//+ID;
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString("id"));
                String nome = rs.getString("nome");
                String email = rs.getString("email");
                int cpf = rs.getInt("cpf");
                String endereco = rs.getString("endereco");
                int telefone = rs.getInt("telefone");
                String genero = rs.getString("genero");
                String estadoCivil = rs.getString("estadoCivil");
                cliente.add(new Cliente(nome, email, cpf, endereco, telefone, genero, estadoCivil, id));
            }

        } catch (SQLException ex) {
            Logger.getLogger(ClienteDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cliente;
    }

    public static List<Cliente> listarClientes() {
        List<Cliente> clientes = new ArrayList<>();
        boolean ok = false;
        Connection con;
        try {
            con = ConexaoDB.getConexao();
            String sql = "select * from cliente ";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
//                int cpf = Integer.parseInt(rs.getString("cpf"));
                int id = Integer.parseInt(rs.getString("id"));
                String nome = rs.getString("nome");
                String email = rs.getString("email");
                int cpf = Integer.parseInt(rs.getString("cpf"));
                String endereco = rs.getString("endereco");
                int telefone = Integer.parseInt(rs.getString("telefone"));
                String genero = rs.getString("genero");
                String estadoCivil = rs.getString("estadoCivil");
                clientes.add(new Cliente(nome, email, cpf, endereco, telefone, genero, estadoCivil, id));

            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return clientes;
    }
}
