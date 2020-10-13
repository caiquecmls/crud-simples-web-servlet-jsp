<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

        <title>ListaCliente</title>
        <style>
            a{
                font-family: verdana;
                font-size:15px;
                color:#5298C7;
                text-decoration: none;	
            }
        </style> 
    </head>
    

    <body>
        <h4 style="text-align: center;"> </h4>

        <div class="jumbotron jumbotron-fluid p-1">
            <div class="container-fluid mr-5"> 
                <h1 class="display-5">Lista de clientes</h1>

                <div align="center">
                    <table class="table" width="10%" >
                        <thead class="table-dark" >
                            <tr>
                                <th scope="col">Nome</th>
                                <th scope="col">Email</th>
                                <th scope="col">CPF</th>
                                <th scope="col">Endereço</th>
                                <th scope="col">Telefone</th>
                                <th scope="col">Gênero</th>
                                <th scope="col">Estado Civil</th>
                                <th scope="col" ></th>
                                <th scope="col"></th>

                            </tr>
                        </thead>


                        <c:forEach var="c" items="${clientes}">
                            <tr>

                                <td>${c.nome}</td>
                                <td>${c.email}</td>
                                <td>${c.cpf}</td>
                                <td>${c.endereco}</td>
                                <td>${c.telefone}</td>
                                <td>${c.genero}</td>
                                <td>${c.estadoCivil}</td>

                                <td>    
                                    <form action="DeleteClienteServlet">
                                        <input name="ID" type="hidden" onclick="funcao1()" size=1 value="${c.id}">                              
                                        <button class="badge badge-danger" type="submit">deletar</button>  
                                    </form> 
                                </td>   
                                <td> 
                                    <form action="EditarClienteServlet">
                                        <input name="ID"  type="hidden"  value="${c.id}">                              
                                        <button class="badge badge-warning" type="submit">Editar</button>  
                                    </form>   

                                </td>  

                            </tr>
                        </c:forEach>

                        <tr></tr>
                    </table>

                    <param name="ID" value="${c.id}">
                    <a href="cadastroCliente.jsp">Cadastro Cliente</a><p>
                    <a href="ListarClientesServlet">Lista de Cliente</a>   
                    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
                    </body>
                    </html>