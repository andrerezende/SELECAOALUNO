SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

SET AUTOCOMMIT=0;
START TRANSACTION;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

-- --------------------------------------------------------

--
-- Estrutura da tabela `campus`
--

CREATE TABLE `campus` (
  `id` int(11) NOT NULL,
  `nome` varchar(128) DEFAULT NULL,
  `ativo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

CREATE TABLE `curso` (
  `cod_curso` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(128) NOT NULL,
  `ativo` char(50) DEFAULT NULL,
  `campus` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_curso`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `inscrito`
--

CREATE TABLE `inscrito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(128) NOT NULL,
  `endereco` varchar(128) NOT NULL,
  `bairro` varchar(128) NOT NULL,
  `cep` varchar(128) NOT NULL,
  `cidade` varchar(128) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `email` varchar(128) DEFAULT NULL,
  `cpf` varchar(18) DEFAULT NULL,
  `rg` varchar(11) NOT NULL,
  `especial` varchar(15) DEFAULT NULL,
  `senha` varchar(20) NOT NULL,
  `nacionalidade` varchar(128) DEFAULT NULL,
  `telefone` varchar(128) NOT NULL,
  `telefone2` varchar(128) DEFAULT NULL,
  `celular` varchar(128) DEFAULT NULL,
  `datanascimento` varchar(10) DEFAULT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  `estadocivil` varchar(45) DEFAULT NULL,
  `orgaoexpedidor` varchar(45) DEFAULT NULL,
  `uf` varchar(45) DEFAULT NULL,
  `dataexpedicao` varchar(10) DEFAULT NULL,
  `especial_descricao` varchar(128) DEFAULT NULL,
  `responsavel` varchar(128) DEFAULT NULL,
  `isencao` varchar(45) DEFAULT NULL,
  `declaracao` varchar(128) DEFAULT NULL,
  `localprova` varchar(128) DEFAULT NULL,
  `numinscricao` varchar(45) NOT NULL,
  `pagamento` varchar(45) DEFAULT NULL,
  `especial_prova` varchar(10) DEFAULT NULL,
  `especial_prova_descricao` varchar(128) DEFAULT NULL,
  `vaga_especial` varchar(10) DEFAULT NULL,
  `vaga_rede_publica` varchar(10) DEFAULT NULL,
  `vaga_rural` varchar(10) DEFAULT NULL,
  `campus` varchar(128) DEFAULT NULL,
  `cadastro_unico` varchar(11) DEFAULT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  `ultima_alteracao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `inscrito_curso`
--

CREATE TABLE `inscrito_curso` (
  `id_inscrito` int(11) NOT NULL,
  `cod_curso` int(11) NOT NULL,
  PRIMARY KEY (`id_inscrito`,`cod_curso`),
  KEY `cod_curso` (`cod_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `localprova`
--

CREATE TABLE `localprova` (
  `id` int(11) NOT NULL,
  `nome` varchar(128) DEFAULT NULL,
  `ativo` varchar(45) DEFAULT NULL,
  `campus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamentos`
--

CREATE TABLE `pagamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_inscrito` varchar(45) DEFAULT NULL,
  `arqretorno` varchar(45) DEFAULT NULL,
  `datapagamento` date DEFAULT NULL,
  `dataretorno` date DEFAULT NULL,
  `dataimportacao` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID_INSCRITO` (`id_inscrito`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `usuario` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL,
  PRIMARY KEY (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
