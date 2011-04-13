<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Processo Seletivo para Professor Substituto - 2011</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<link href="../../estilo_selecao.css" rel="stylesheet" type="text/css" />

<?php
header("Content-Type: text/html; charset=ISO-8859-1", true);
include("../classes/DB.php");
include("../classes/Inscrito.php");
include("../classes/Inscrito_Curso.php");

$nome                 = addslashes(strtoupper($_POST['nome']));
$endereco             = addslashes(strtoupper($_POST['endereco']));
$bairro               = addslashes(strtoupper($_POST['bairro']));
$cep                  = addslashes($_POST['cep']);
$cidade               = addslashes(strtoupper($_POST['cidade']));
$estado               = addslashes($_POST['estado']);
$email                = addslashes(strtoupper($_POST['email']));
$cpf                  = addslashes($_POST['cpf']);
$rg                   = addslashes($_POST['rg']);
$especial             = addslashes($_POST['especial']);
$senha                = addslashes($_POST['senha']);
$nacionalidade        = addslashes(strtoupper($_POST['nacionalidade']));
$telefone             = addslashes($_POST['telefone']);
$celular              = addslashes($_POST['celular']);
$datanascimento       = addslashes(strtoupper($_POST['datanascimento']));
$sexo                 = addslashes($_POST['sexo']);
$estadocivil          = addslashes($_POST['estadocivil']);
$orgaoexpedidor       = addslashes(strtoupper($_POST['orgaoexpedidor']));
$uf                   = addslashes($_POST['uf']);
$dataexpedicao        = addslashes($_POST['dataexpedicao']);
$especial_descricao   = addslashes(strtoupper($_POST['especial_descricao']));
$isencao              = addslashes($_POST['isencao']);
$declaracao           = addslashes($_POST['declaracao']);
$curso                = addslashes($_POST['curso']);
$especial_prova       = addslashes($_POST['especial_prova']);
$especial_prova_descricao = addslashes($_POST['especial_prova_descricao']);
$vaga_especial        = addslashes($_POST['vaga_especial']);
$campus               = addslashes($_POST['campus']);

/*Acesso ao banco de dados */
$banco    = DB::getInstance();
$conexao  = $banco->ConectarDB();

$resultado = $banco->ExecutaQueryGenerica('SELECT MAX(id) +1 AS novo_id FROM inscrito');
$resultado = mysql_fetch_assoc($resultado);
$id = $resultado['novo_id'];
$numinscricao = substr($cpf, 0,4).$id;

/*Verificar se possui cadastrado na base*/
$inscrito = new Inscrito($nome, $endereco, $bairro, $cep, $cidade, $estado,
			$email, $cpf, $rg, $especial, $senha, $nacionalidade, $telefone, null, $celular, $datanascimento,
			$sexo, $estadocivil, $orgaoexpedidor, $uf, $dataexpedicao, $especial_descricao, null,
			$isencao, $declaracao, null, $numinscricao, $especial_prova, $especial_prova_descricao,
			$vaga_especial, null, null, $campus);
$existe = $inscrito->Existe($conexao);

if ($existe) {
	echo("<div align='center'");
		echo("<img src="."../../imgs/topo2/topo_formulario.png"." alt="."Instituto Federal Baiano"." />");
		echo("<h2>Requerimento de Inscri&ccedil;&atilde;o</h2>");
		echo("<table border='0'>");
		echo("	<tr>");
		echo("		<td><div align='center'>Problemas ao preencher o requerimento de inscri&ccedil;&atilde;o. O CPF informado (<b>".$cpf."</b>) encontra-se associado a outro candidato.<br/>Caso ocorra algum problema, favor entrar em contato (P&aacute;gina Inicial / Contato).</div></td>");
		echo("	</tr>");
		echo("	<tr>");
		echo("		<td><br /><div align='center'><a href="."javascript:window.history.go(-1)".">Voltar</a>"." - "."<a href="."../../index.php".">P&aacute;gina Inicial</a></div></td>");
		echo("	</tr>");
		echo("</table>");
	echo("</div>");
} else {
	$resultado = $inscrito->Inserir($conexao);
	if ($resultado > 0) {
		$inscrito_curso = new Inscrito_Curso(null,null,$resultado);
		$resultado = $inscrito_curso->Inserir($conexao, $curso);

		echo("<div align=".'"'."center".'"'.">");
			echo("<img src=".'"'."../../imgs/topo2/topo_formulario.png".'"'." alt=".'"'."Instituto Federal Baiano".'"'." />");
			echo("<table border='0'>");
			echo("	<tr>");
			echo("		<td><div>Ficha de Inscri&ccedil;&atilde;o preenchido com sucesso. Utilize o n&uacute;mero do CPF informado (<b>".$cpf."</b>) para imprimir a ficha de inscri&ccedil;&atilde;o.</div></td>");
			echo("	</tr>");
			echo("	<tr>");
?>
					<tr>
						<td>
							<div align='center'>
								<form id="frmeditar" name="frmeditar" action="editar.php" method="post">
									<input type="hidden" name="id" value="<?php echo($id);?>" />
									<a href="#" onclick="document.forms['frmeditar'].submit();">Editar Inscri&ccedil;&atilde;o</a>
								</form>
							</div>
						</td>
					</tr>
                        <tr>
                        <td>
                            <div align='center'>
                                <form id='frmboleto' name='frmboleto' action='../boleto/boleto_bb.php' method='post'>
                                    <input type='hidden' name='id' value="<?php echo($id);?>" />
                                    <a href='#' onclick="document.forms['frmboleto'].submit();">Imprimir Boleto para Pagamento</a>
                                </form>
                            </div>
                        </td>
                        </tr>
<?php
			echo("		<td align=".'"'."center".'"'.">"."<br /><div><a href="."javascript:window.history.go(-1)".">Voltar</a>"." - "."<a href="."../../index.php".">P&aacute;gina Inicial</a></div></td>");
			echo("	</tr>");
			echo("</table>");
			echo("</div>");
} else {
	echo("<div align='center'");
		echo("<img src="."../../imgs/topo2/topo_formulario.png"." alt="."Instituto Federal Baiano"." />");
		echo("<h2>Ficha de Inscri&ccedil;&atilde;o</h2>");
		echo("<table border='0'>");
		echo("	<tr>");
		echo("		<td><br /><div align='center'><a href='#'>Problemas ao efetuar inscri&ccedil;&atilde;o</div></td>");
		echo("	</tr>");
		echo("</table>");
	echo("</div>");
	}
}

$banco->DesconectarDB($conexao);

?>
</head>
