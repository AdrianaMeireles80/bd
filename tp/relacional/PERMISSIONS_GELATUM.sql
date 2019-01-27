-- CRIACAO DE USER E ATRIBUICAO DE PERMISSOES

/*
Permissao de um funcionario, um funcionario podera utilizar todos os dados
para processar um pedido; pode consultar a informação disponível na base de dados
relativa ao cliente que faz o pedido, exceto a password, o nome de utilizador, o email 
e o número de telemóvel. Poderá ainda consultar os seus dados, mas apenas alterar a password.
*/
CREATE USER 'Funcionario'@'localhost'
	identified by 'funcpassword';

GRANT SELECT, UPDATE gelataria.Gelados To 'Funcionario'@'localhost';
GRANT SELECT, UPDATE ON gelataria.Extra To 'Funcionario'@'localhost';
GRANT SELECT ON gelataria.Funcionario To 'Funcionario'@'localhost';
GRANT SELECT, UPDATE ON gelataria.Funcionario[password_func] To 'Funcionario'@'localhost';
GRANT SELECT ON gelataria.Pedido To 'Funcionario'@'localhost';
GRANT SELECT ON gelataria.Cliente[nome_cliente, nif_cliente] To 'Funcionario'@'localhost';
   
REVOKE DROP, CREATE, DELETE 
ON *.*
FROM 'Funcionario'@'localhost';

/*
Este utilizador deverá poder fazer qualquer operação que diga respeito aos seus dados pessoais
(número de identificação fiscal, nome, password, nome de utilizador, data de nascimento, email e número de telemóvel),
com a exceção de que, para além da data de nascimento, não pode remover dados específicos; para isso precisa de eliminar
todos os seus dados da aplicação, isto é, eliminar a sua conta. Apenas poderá consultar todos os dados relativos ao seu pedido,
ao gelado e ao extra, caso exista, sendo que destes só pode alterar as quantidade
*/    
CREATE USER 'cliente'@'localhost'
	identified BY 'clientepassword';
    
GRANT SELECT ON gelataria.Gelados TO 'cliente'@'localhost';
GRANT SELECT ON gelataria.Extra To 'cliente'@'localhost';
GRANT SELECT, DELETE, UPDATE ON gelataria.Cliente[nif_cliente, nome_cliente, password_cliente, nome_utilizador_cliente, data_nascimeto_cliente, email_cliente, telemovel_cliente] TO 'cliente'@'localhost';
GRANT SELECT, INSERT, UPDATE ON gelataria.Cliente To 'cliente'@'localhost'; --sem certeza se este insert sera para meter "novo cliente" ou seja fazer uma inscricao

REVOKE DROP, CREATE, DELETE, UPDATE, INSERT 
ON *.Gelados
FROM 'cliente'@'localhost';

REVOKE DROP, CREATE, DELETE, UPDATE, INSERT 
ON *.Extra
FROM 'cliente'@'localhost';

REVOKE DROP, CREATE
ON *.Cliente
FROM 'cliente'@'localhost';
/*
O administrador,Senhor Oleb,deverá poder alterar, remover, inserir e consultar qualquer informação da base de dados acerca de outros utilizadores. 
A única operação que o administrador não pode fazer é a remoção de toda a informação de uma base de dados.
*/
CREATE USER 'Administrador'@'localhost'
	identified by 'adminpassword';

-- da todas as permissoes ao admin excepto criar e eleminar base dados
GRANT SELECT, INSERT, DELETE, UPDATE ON *.* TO 'Administrador'@'localhost';	

REVOKE DROP, CREATE 
ON *.*
FROM 'Administrador'@'localhost';
