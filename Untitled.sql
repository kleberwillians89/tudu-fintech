CREATE TABLE `Usuario` (
  `id_usuario` int PRIMARY KEY,
  `nome` varchar(255),
  `cpf` varchar(255),
  `data_nascimento` date,
  `email` varchar(255),
  `telefone` varchar(255),
  `endereco` text,
  `data_cadastro` date
);

CREATE TABLE `Login` (
  `id_conta` int PRIMARY KEY,
  `id_usuario` int,
  `numero_conta` varchar(255),
  `agencia` varchar(255),
  `saldo` decimal,
  `tipo_conta` varchar(255),
  `status` varchar(255)
);

CREATE TABLE `Faturas` (
  `id_fatura` int PRIMARY KEY,
  `id_usuario` int,
  `mes_referencia` varchar(255),
  `valor_total` decimal,
  `status` varchar(255),
  `data_nascimento` date
);

CREATE TABLE `Cartao` (
  `id_cartao` int PRIMARY KEY,
  `id_conta` int,
  `numero_conta` varchar(255),
  `validade` date,
  `cvv` varchar(255),
  `tipo` varchar(255),
  `limite` decimal
);

CREATE TABLE `Transacoes` (
  `id_transacao` int PRIMARY KEY,
  `id_conta_regime` int,
  `id_conta_destino` int,
  `atributo_4` varchar(255),
  `valor` decimal,
  `data_hora` datetime,
  `tipo_transacao` varchar(255),
  `descricao` text
);

CREATE TABLE `BemEstar` (
  `id_registro_bemestar` int PRIMARY KEY,
  `id_usuario` int,
  `tipo_registro` varchar(255),
  `tipo_registro_1` varchar(255),
  `valor` decimal,
  `data_registro` date,
  `observacoes` text
);

CREATE TABLE `SegurosConvenios` (
  `id_beneficio` int PRIMARY KEY,
  `id_usuario` int,
  `tipo` varchar(255),
  `nome_beneficio` varchar(255),
  `status` varchar(255),
  `data_inicio` date,
  `data_fim` date
);

ALTER TABLE `Login` ADD FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`);

ALTER TABLE `Faturas` ADD FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`);

ALTER TABLE `Cartao` ADD FOREIGN KEY (`id_conta`) REFERENCES `Login` (`id_conta`);

ALTER TABLE `Transacoes` ADD FOREIGN KEY (`id_conta_regime`) REFERENCES `Login` (`id_conta`);

ALTER TABLE `Transacoes` ADD FOREIGN KEY (`id_conta_destino`) REFERENCES `Login` (`id_conta`);

ALTER TABLE `BemEstar` ADD FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`);

ALTER TABLE `SegurosConvenios` ADD FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`);
