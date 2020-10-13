<%-- 
    Document   : atualizarCliente
    Created on : 13/10/2020, 08:15:33
    Author     : caiqu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

        <title>Atualizar Cliente</title>
        <style>
            a{
                font-family: verdana;
                font-size:15px;
                color:#5298C7;
                text-decoration: none;	
            }


        </style> 

        <script>
            function funcao1()
            {
                alert("atualizado com sucesso!");
            }
        </script>

        <script type="text/javascript"></script>
    </head>
    <body>
        <h4 style="text-align: center;"> </h4>

        <div class="jumbotron jumbotron-fluid p-1">
            <div class="container-fluid mr-5"> 
                <h1 class="display-5">Lista de clientes</h1>


                <form action="EditarClienteServlet"method="POST">

                    <c:forEach var="c" items="${clientes}">
                        <div class="form-group">    
                            <div class="form-row border">
                                <div class="form-group col-md-auto">
                                    <input name="ID" type="hidden" value="${c.id}"> 
                                </div>
                                <div class="form-group col-md-auto">
                                    <label> Nome </label>
                                    <input type="text" class="form-control" name="nome"value="${c.nome}">
                                </div>

                                <div class="form-group col-md-5px">
                                    <label>Email</label>
                                    <input  type="text" class="form-control" name="email"  value="${c.email}">
                                </div>

                                <div class="form-group col-md-auto">
                                    <label>CPF</label>
                                    <input type="text" class="form-control" name="cpf"  value="${c.cpf}">
                                </div>

                                <div class="form-group col-md-auto">
                                    <label> Endereço </label>
                                    <input type="text" class="form-control" name="endereco"  value="${c.endereco}">
                                </div>

                                <div class="form-group col-md-auto">
                                    <label> Telefone </label>
                                    <input type="text" class="form-control" name="telefone"  value="${c.telefone}">
                                </div>

                                <div class="form-group col-md-auto">
                                    <label> Gênero </label>
                                    <input type="text" class="form-control" name="genero"  value="${c.genero}">
                                </div>
                                <div class="form-group col-md-auto">
                                    &nbsp;&nbsp;
                                    <label> Estado Civil </label>                                
                                    <input type="text" class="form-control" name="estadoCivil"  value="${c.estadoCivil}">
                                </div>
                            </c:forEach>
                        </div>  

                        <div class="container m-3">
                            <button class="btn btn-outline-success" onclick="funcao1()" value="atualizado com sucesso" type="submit" >Atualizar</button>


                        </div>

                    </div>
                </form>

                <center>
                    <a href="cadastroCliente.jsp">Cadastro Cliente</a><p>
                    <a href="ListarClientesServlet">Lista de Cliente</a>   

                </center>      
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
                </body>
                </html>