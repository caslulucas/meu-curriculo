<?php
 //iniciar uma nova sessão

 session_start();

 // Chamar conexao

require_once 'conexao.php';


 if(isset($_POST['bt_cadastrar'])) {
    //pegar dados postados e fazer escape

    $nome = mysqli_real_escape_string($con, $_POST['nome']);
    $nacionalidade = mysqli_real_escape_string($con, $_POST['nacionalidade']);
    $estado_civil = mysqli_real_escape_string($con, $_POST['estado_civil']);
    $idade = mysqli_real_escape_string($con, $_POST['idade']);
    $endereco = mysqli_real_escape_string($con, $_POST['endereco']);
    $telefone = mysqli_real_escape_string($con, $_POST['telefone']);
    $email = mysqli_real_escape_string($con, $_POST['email']);
    $senha = md5(mysqli_real_escape_string($con, $_POST['senha']));


    $sql = "INSERT INTO usuarios (nome, nacionalidade, estado_civil, idade, endereco, telefone, email, senha) VALUES ('$nome', '$nacionalidade', '$estado_civil', '$idade', '$endereco', '$telefone', '$email', '$senha',)";


    if(mysqli_query($con, $sql)) {
        $_SESSION['mensagem'] = "Cadastro realizado com sucesso!";
        $_SESSION['status'] = "success";
        header('Location: ../index.php');
    } else {
        $_SESSION['mensagem'] = "Não foi possivel cadastrar!";
        $_SESSION['status'] = "danges";
        header('Location: ../index.php');
    }

    mysqli_close($con);
};

?>
