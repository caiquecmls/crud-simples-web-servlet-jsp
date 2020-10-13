<%-- 
    Document   : cadastroCliente
    Created on : 13/10/2020, 00:29:24
    Author     : caiqu
--%>
<!DOCTYPE html>

<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <title>'crudSimples</title>
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
                <h1 class="display-5">Cadastro de clientes</h1>

        <div class="form-group">
            <form action="CadastroClienteServlet" method="POST">

                <div class="form-row border">
                    <div class="form-group col-md-auto">
                        <label> Nome </label>
                        <input type="text" class="form-control"  onkeypress='return letras();' name= "nome" required>
                    </div>

                    <div class="form-group col-md-5px">
                        <label>Email</label>
                        <input type="text" class="form-control" name= "email" placeholder="digite seu e-mail aqui" required/>
                    </div>

                    <div class="form-group col-md-auto">
                        <label>CPF</label>
                        <input type="text" class="form-control" placeholder="digite apenas números" name= "cpf" required/>
                    </div>

                    <div class="form-group col-md-auto">
                        <label> Endereço </label>
                        <input type="text" class="form-control" name= "endereco" required>
                    </div>

                    <div class="form-group col-md-auto">
                        <label> Telefone </label>
                        <input type="text" class="form-control" onkeypress='return numeros();'  placeholder="digite apenas números" name= "telefone" required>
                    </div>

                    <div class="form-group col-md-auto">
                        <label> Gênero </label>
                        <input type="text" class="form-control" onkeypress='return letras();' name= "genero" required>
                    </div>

                    <div class="form-group col-md-auto">
                        <label> Estado Civil </label>
                        <input type="text" class="form-control" onkeypress='return letras();' name= "estadoCivil" required>
                    </div>

                </div>  

                <div class="container m-3">
                    <button class="btn btn-outline-success" type="submit" >Criar</button>
                    <button class="btn btn-outline-secondary" type="reset" >limpar</button> 
                </div>
            </form>
        </div>
        <div align="center">                     
            <a href="ListarClientesServlet">Lista de Cliente</a>   
        </div>             
    </body>
</html>