-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14-Set-2024 às 03:25
-- Versão do servidor: 10.4.21-MariaDB
-- versão do PHP: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sg`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `filiais`
--

CREATE TABLE `filiais` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `filial` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedores`
--

CREATE TABLE `fornecedores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `fornecedores`
--

INSERT INTO `fornecedores` (`id`, `nome`, `site`, `created_at`, `updated_at`, `uf`, `email`, `deleted_at`) VALUES
(1, 'Marcelo', 'marcelo.com.br', '2024-09-01 23:29:39', '2024-09-01 23:29:39', 'SP', 'contato@marcelo.com.br', NULL),
(2, 'Jose', 'jose.com.br', '2024-09-01 23:29:39', '2024-09-01 23:29:39', 'BA', 'contato@jose.com.br', NULL),
(3, 'Maria', 'maria.com.br', NULL, NULL, 'MG', 'contato@maria.com.br', NULL),
(4, 'Marcelo', 'marcelo.com.br', '2024-09-11 17:44:10', '2024-09-11 17:44:10', 'SP', 'contato@marcelo.com.br', NULL),
(5, 'Jose', 'jose.com.br', '2024-09-11 17:44:10', '2024-09-11 17:44:10', 'BA', 'contato@jose.com.br', NULL),
(6, 'Maria', 'maria.com.br', NULL, NULL, 'MG', 'contato@maria.com.br', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2021_04_27_174545_create_site_contatos_table', 1),
(4, '2021_05_05_185952_create_fornecedores_table', 1),
(5, '2021_05_05_191652_alter_fornecedores_novas_colunas', 1),
(6, '2021_05_07_134026_create_produtos_table', 1),
(7, '2021_05_07_135759_create_produto_detalhes_table', 1),
(8, '2021_05_07_142451_create_unidades_table', 1),
(9, '2021_05_08_133711_ajuste_produtos_filiais', 1),
(10, '2021_05_08_141237_alter_fornecedores_nova_coluna_site_com_after', 1),
(11, '2021_05_09_202039_alter_fornecedores_softdelete', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `peso` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unidade_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_detalhes`
--

CREATE TABLE `produto_detalhes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `produto_id` bigint(20) UNSIGNED NOT NULL,
  `comprimento` double(8,2) NOT NULL,
  `largura` double(8,2) NOT NULL,
  `altura` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unidade_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_filiais`
--

CREATE TABLE `produto_filiais` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `filial_id` bigint(20) UNSIGNED NOT NULL,
  `produto_id` bigint(20) UNSIGNED NOT NULL,
  `preco_venda` decimal(8,2) NOT NULL,
  `estoque_minimo` int(11) NOT NULL,
  `estoque_maximo` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `site_contatos`
--

CREATE TABLE `site_contatos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `motivo_contato` int(11) NOT NULL,
  `mensagem` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `site_contatos`
--

INSERT INTO `site_contatos` (`id`, `created_at`, `updated_at`, `nome`, `telefone`, `email`, `motivo_contato`, `mensagem`) VALUES
(1, '2024-09-01 23:29:39', '2024-09-01 23:29:39', 'Sistema SG', '(11) 99999-8888', 'contato@sg.com.br', 1, 'Seja bem-vindo ao sistema Super Gestão'),
(2, '2024-09-11 17:44:10', '2024-09-11 17:44:10', 'Sistema SG', '(11) 99999-8888', 'contato@sg.com.br', 1, 'Seja bem-vindo ao sistema Super Gestão');

-- --------------------------------------------------------

--
-- Estrutura da tabela `unidades`
--

CREATE TABLE `unidades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unidade` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `filiais`
--
ALTER TABLE `filiais`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produtos_unidade_id_foreign` (`unidade_id`);

--
-- Índices para tabela `produto_detalhes`
--
ALTER TABLE `produto_detalhes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `produto_detalhes_produto_id_unique` (`produto_id`),
  ADD KEY `produto_detalhes_unidade_id_foreign` (`unidade_id`);

--
-- Índices para tabela `produto_filiais`
--
ALTER TABLE `produto_filiais`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produto_filiais_filial_id_foreign` (`filial_id`),
  ADD KEY `produto_filiais_produto_id_foreign` (`produto_id`);

--
-- Índices para tabela `site_contatos`
--
ALTER TABLE `site_contatos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `unidades`
--
ALTER TABLE `unidades`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `filiais`
--
ALTER TABLE `filiais`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto_detalhes`
--
ALTER TABLE `produto_detalhes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto_filiais`
--
ALTER TABLE `produto_filiais`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `site_contatos`
--
ALTER TABLE `site_contatos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `unidades`
--
ALTER TABLE `unidades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_unidade_id_foreign` FOREIGN KEY (`unidade_id`) REFERENCES `unidades` (`id`);

--
-- Limitadores para a tabela `produto_detalhes`
--
ALTER TABLE `produto_detalhes`
  ADD CONSTRAINT `produto_detalhes_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  ADD CONSTRAINT `produto_detalhes_unidade_id_foreign` FOREIGN KEY (`unidade_id`) REFERENCES `unidades` (`id`);

--
-- Limitadores para a tabela `produto_filiais`
--
ALTER TABLE `produto_filiais`
  ADD CONSTRAINT `produto_filiais_filial_id_foreign` FOREIGN KEY (`filial_id`) REFERENCES `filiais` (`id`),
  ADD CONSTRAINT `produto_filiais_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
