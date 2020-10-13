/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package caique.servlet;

import caique.dao.ClienteDao;
import caique.entidade.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author caiqu
 */
public class CadastroClienteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        int cpf = Integer.parseInt(request.getParameter("cpf"));    
        String endereco = request.getParameter("endereco");
//        String telefone = request.getParameter("telefone");
        int telefone = Integer.parseInt(request.getParameter("telefone"));
        String genero = request.getParameter("genero");
        String estadoCivil = request.getParameter("estadoCivil");

        Cliente cliente = new Cliente(nome, email, cpf, endereco, telefone, genero, estadoCivil);
        boolean ok = ClienteDao.cadastrarCliente(cliente);
       PrintWriter out = response.getWriter();        
        
        String url = "";
        if (ok) {
            request.setAttribute("cadastroOK", true);
            url = "/sucesso.jsp";
        } else {
            url = "/erro.jsp";
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request,response);
    }
}