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
import static java.lang.System.out;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author caiqu
 */
public class EditarClienteServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int id = Integer.parseInt(request.getParameter("ID"));
        List<Cliente> clientes = ClienteDao.BuscarClientes(id);
        request.setAttribute("clientes", clientes);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/atualizarCliente.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        int sid = Integer.parseInt(request.getParameter("ID"));
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        int cpf = Integer.parseInt(request.getParameter("cpf"));
        String endereco = request.getParameter("endereco");
        int telefone = Integer.parseInt(request.getParameter("telefone"));
        String genero = request.getParameter("genero");
        String estadoCivil = request.getParameter("estadoCivil");

        Cliente cliente = new Cliente(nome, email, cpf, endereco, telefone, genero, estadoCivil, sid);
        boolean ok = ClienteDao.update(cliente);
        
        if (ok = !false) {
            request.setAttribute("/sucesso.jsp", true);

        } else {
            out.println("Erro");
        }

        out.close();
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("ListarClientes");
        dispatcher.forward(request, response);

    }
}
