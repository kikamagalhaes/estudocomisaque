-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Tempo de geração: 09-Jun-2022 às 20:18
-- Versão do servidor: 8.0.19
-- versão do PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `curso`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cnpj_cpf` varchar(16) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `tipo_cliente` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome`, `cnpj_cpf`, `endereco`, `tipo_cliente`) VALUES
(1, 'Larissa', '1111111', 'Rua Primavera', 'PF'),
(2, 'Oziel', '2222222', 'Rua Três', 'PJ'),
(3, 'Fernanda', '333333', 'Rua B', 'PF'),
(4, 'Larissa', '1111111', 'Rua Primavera', 'PF'),
(5, 'Oziel', '2222222', 'Rua Três', 'PJ'),
(6, 'Fernanda', '333333', 'Rua B', 'PF');

-- --------------------------------------------------------

--
-- Estrutura da tabela `distribuidor`
--

CREATE TABLE `distribuidor` (
  `id_distribuidor` int NOT NULL,
  `telefone` varchar(11) NOT NULL,
  `razao_social` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `distribuidor`
--

INSERT INTO `distribuidor` (`id_distribuidor`, `telefone`, `razao_social`) VALUES
(1, '777777', 'Distribuidora A'),
(2, '777777', 'Distribuidora A'),
(3, '88888', 'Distribuidora B'),
(4, '999999', 'Distribuidora C'),
(5, '999999', 'Distribuidora C');

-- --------------------------------------------------------

--
-- Estrutura da tabela `forma_pagamento`
--

CREATE TABLE `forma_pagamento` (
  `id_forma_pagamento` int NOT NULL,
  `descricao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `forma_pagamento`
--

INSERT INTO `forma_pagamento` (`id_forma_pagamento`, `descricao`) VALUES
(1, 'PIX'),
(2, 'BOLETO'),
(3, 'DEBITO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_venda`
--

CREATE TABLE `item_venda` (
  `quantidade` int NOT NULL,
  `numero_nf` int NOT NULL,
  `venda_id` int NOT NULL,
  `produto_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `item_venda`
--

INSERT INTO `item_venda` (`quantidade`, `numero_nf`, `venda_id`, `produto_id`) VALUES
(896, 111111, 1, 1),
(1526, 22222, 2, 2),
(89689, 333333, 3, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `id_produto` int NOT NULL,
  `preco_venda` double NOT NULL,
  `data_validade` date NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `distribuidor_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id_produto`, `preco_venda`, `data_validade`, `descricao`, `distribuidor_id`) VALUES
(1, 25.96, '2022-02-02', 'Produto A', 1),
(2, 8963.63, '2023-05-05', 'Produto C', 3),
(3, 896.63, '2021-02-05', 'Produto B', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `id_venda` int NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `hora` timestamp NOT NULL,
  `total` int NOT NULL,
  `cliente_id` int NOT NULL,
  `forma_pagamento_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`id_venda`, `descricao`, `hora`, `total`, `cliente_id`, `forma_pagamento_id`) VALUES
(1, 'Venda 1', '2022-06-09 00:50:12', 90, 1, 1),
(2, 'Venda 2', '2022-06-09 00:50:29', 70, 2, 2),
(3, 'Venda 3', '2022-01-01 03:00:01', 891, 3, 3);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices para tabela `distribuidor`
--
ALTER TABLE `distribuidor`
  ADD PRIMARY KEY (`id_distribuidor`);

--
-- Índices para tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  ADD PRIMARY KEY (`id_forma_pagamento`);

--
-- Índices para tabela `item_venda`
--
ALTER TABLE `item_venda`
  ADD KEY `venda_id` (`venda_id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id_produto`),
  ADD KEY `distribuidor_id` (`distribuidor_id`);

--
-- Índices para tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`id_venda`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `forma_pagamento_id` (`forma_pagamento_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `distribuidor`
--
ALTER TABLE `distribuidor`
  MODIFY `id_distribuidor` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  MODIFY `id_forma_pagamento` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id_produto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `id_venda` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `item_venda`
--
ALTER TABLE `item_venda`
  ADD CONSTRAINT `item_venda_ibfk_1` FOREIGN KEY (`venda_id`) REFERENCES `venda` (`id_venda`),
  ADD CONSTRAINT `item_venda_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`id_produto`);

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`distribuidor_id`) REFERENCES `distribuidor` (`id_distribuidor`);

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `venda_ibfk_2` FOREIGN KEY (`forma_pagamento_id`) REFERENCES `forma_pagamento` (`id_forma_pagamento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
