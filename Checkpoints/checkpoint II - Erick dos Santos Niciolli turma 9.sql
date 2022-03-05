-- Foi criado um banco de dados para utilização em uma loja de carros. Todas as chaves primárias deverão ter algum dado e, em algumas tabelas, a chave priméria recebe o AUTO_INCREMENT. Porém, para o cliente utilizamos o número do CPF e para carro utilizamos a placa. Finalmente, a tabela final consta o vendedor que participou da venda do veículo, cliente, carros, forma de pagamento, valor final e data de venda.


CREATE DATABASE loja_carros;
USE loja_carros;

CREATE TABLE `Cliente` (
`idcliente_cpf` CHAR(11) NOT NULL,
`nome` VARCHAR(30),
`sobrenome` VARCHAR(50),
`email` VARCHAR(50),
`endereço` VARCHAR(50),
CONSTRAINT `PK_cliente_idcliente_cpf` PRIMARY KEY (`idcliente_cpf`)
);

CREATE TABLE `Telefone` (
`idtelefone` INT NOT NULL AUTO_INCREMENT,
`numero_telefone` VARCHAR(20),
`id_cliente` CHAR(11),
CONSTRAINT `PK_telefone_idtelefone` PRIMARY KEY (idtelefone),
CONSTRAINT `FK_id_cliente_cliente` FOREIGN KEY (id_cliente) REFERENCES Cliente(idcliente_cpf)
);

CREATE TABLE `Marca` (
`idmarca` INT NOT NULL AUTO_INCREMENT,
`marca` VARCHAR(30),
CONSTRAINT `PK_marca_idmarca` PRIMARY KEY (idmarca)
);

CREATE TABLE `Modelo` (
`idmodelo` INT NOT NULL AUTO_INCREMENT,
`modelo` VARCHAR(30),
`idmarca` INT,
CONSTRAINT `PK_modelo_idmodelo` PRIMARY KEY (idmodelo),
CONSTRAINT `FK_idmarca_marca` FOREIGN KEY (idmarca) REFERENCES Marca(idmarca)
);

CREATE TABLE `Veiculo` (
`placa` CHAR(7) NOT NULL,
`modelo` INT,
`cor` VARCHAR(20),
`ano` CHAR(4),
`valor_sem_desconto` DECIMAL(8,2),
CONSTRAINT `PK_veiculo_placa` PRIMARY KEY (placa),
CONSTRAINT `FK_modelo_veiculo` FOREIGN KEY (modelo) REFERENCES Modelo(idmodelo)
);

CREATE TABLE `Vendedor` (
`idvendedor` INT NOT NULL AUTO_INCREMENT,
`nome_completo` VARCHAR(30),
`numero_whatsapp` VARCHAR(15),
CONSTRAINT `PK_Vendedor_idvendedor` PRIMARY KEY (idvendedor)
);

CREATE TABLE `Forma_pagamento` (
`idforma_pagamento` INT NOT NULL AUTO_INCREMENT,
`forma_pagamento` VARCHAR(20),
`parcelas` SMALLINT,
CONSTRAINT `PK_forma_pagamento_idforma_pagamento` PRIMARY KEY (idforma_pagamento)
);

CREATE TABLE `Venda_veiculo` (
`idvenda` INT NOT NULL AUTO_INCREMENT,
`idcarro` CHAR(7),
`idcliente` CHAR(11),
`idvendedor` INT,
`idforma_pagamento` INT,
`valor_final` DECIMAL(8,2),
`data` DATE,
CONSTRAINT `PK_venda_veiculo_idvenda` PRIMARY KEY (idvenda),
CONSTRAINT `FK_idcarro_venda` FOREIGN KEY (idcarro) REFERENCES Veiculo(placa),
CONSTRAINT `FK_idcliente_venda` FOREIGN KEY (idcliente) REFERENCES Cliente(idcliente_CPF),
CONSTRAINT `FK_idvendedor_venda` FOREIGN KEY (idvendedor) REFERENCES Vendedor(idvendedor),
CONSTRAINT `FK_idforma_pagamento_venda` FOREIGN KEY (idforma_pagamento) REFERENCES Forma_pagamento(idforma_pagamento)
);

INSERT INTO `cliente`
VALUES ('12312312312', 'Erick', 'Niciolli', 'erick.erick@erick.com', 'Rua Pau Brasil, 50, Ribeirão Preto'),
		('32132132132', 'Marcos', 'Ribeiro', 'ribeiromarcos@marquinhos.com', 'Rua dos Marcos, 33, São Paulo'),
        ('44455566677', 'Jose', 'Alessandro', 'alejose@joses.com', 'Avenida Josenilo, 30, São José dos Pinhais'),
        ('99988877755', 'Paulo', 'Ventura', 'paulinho@ventura.com', 'Rua 24 de julho, 115, Paulínea'),
        ('55566644432', 'Sandra', 'Albuquerque', 'sandrinha@albuquerque.com', 'Avenida Paulista, 100, São Paulo');
        
        
UPDATE `cliente` SET `sobrenome`='dos Santos' WHERE `idcliente_cpf`='12312312312';
UPDATE `cliente` SET `email`='sandra@sandra.com' WHERE `idcliente_cpf`='55566644432';

DELETE FROM `cliente` WHERE `idcliente_cpf`='44455566677' ;

SELECT * FROM cliente
ORDER BY `nome`;

SELECT * FROM cliente
WHERE `endereço` like '%São Paulo%'
ORDER BY `endereço`;

SELECT 
CONCAT(nome, ' ', sobrenome) AS `nome completo`, 
`email`, 
REPLACE(`endereço`, 'Avenida', 'Av.') AS `Endereço`
FROM cliente
WHERE email IS NOT NULL
ORDER BY `nome`;
