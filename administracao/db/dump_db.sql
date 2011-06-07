SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

-- --------------------------------------------------------

--
-- Estrutura da tabela `campus`
--

CREATE TABLE IF NOT EXISTS `campus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(128) DEFAULT NULL,
  `ativo` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

CREATE TABLE IF NOT EXISTS `curso` (
  `cod_curso` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `ativo` tinyint(4) DEFAULT '1',
  `campus` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_curso`),
  KEY `fk_curso_campus` (`campus`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=73 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `inscrito`
--

CREATE TABLE IF NOT EXISTS `inscrito` (
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
  `localprova` int(11) DEFAULT NULL,
  `numinscricao` varchar(45) NOT NULL,
  `pagamento` varchar(45) DEFAULT NULL,
  `especial_prova` varchar(10) DEFAULT NULL,
  `especial_prova_descricao` varchar(128) DEFAULT NULL,
  `vaga_especial` varchar(10) DEFAULT NULL,
  `vaga_rede_publica` varchar(10) DEFAULT NULL,
  `vaga_rural` varchar(10) DEFAULT NULL,
  `campus` int(11) DEFAULT NULL,
  `cadastro_unico` varchar(11) DEFAULT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  `ultima_alteracao` datetime DEFAULT NULL,
  `curso` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_inscrito_curso` (`curso`),
  KEY `fk_inscrito_campus` (`campus`),
  KEY `fk_inscrito_localprova` (`localprova`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2292 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `inscrito_curso`
--

CREATE TABLE IF NOT EXISTS `inscrito_curso` (
  `id_inscrito` int(11) NOT NULL,
  `cod_curso` int(11) NOT NULL,
  PRIMARY KEY (`id_inscrito`,`cod_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `localprova`
--

CREATE TABLE IF NOT EXISTS `localprova` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `ativo` tinyint(4) DEFAULT '1',
  `campus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_localprova_campus` (`campus`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamentos`
--

CREATE TABLE IF NOT EXISTS `pagamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_inscrito` varchar(45) DEFAULT NULL,
  `arqretorno` varchar(45) DEFAULT NULL,
  `datapagamento` date DEFAULT NULL,
  `dataretorno` date DEFAULT NULL,
  `dataimportacao` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID_INSCRITO` (`id_inscrito`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=718 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `usuario` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL,
  PRIMARY KEY (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `fk_curso_campus` FOREIGN KEY (`campus`) REFERENCES `campus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `inscrito`
--
ALTER TABLE `inscrito`
  ADD CONSTRAINT `fk_inscrito_campus` FOREIGN KEY (`campus`) REFERENCES `campus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inscrito_localprova` FOREIGN KEY (`localprova`) REFERENCES `localprova` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `localprova`
--
ALTER TABLE `localprova`
  ADD CONSTRAINT `fk_localprova_campus` FOREIGN KEY (`campus`) REFERENCES `campus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
