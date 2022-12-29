CREATE TABLE `curriculo`.`usuarios` (
    `idusuario` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(50) NULL,
        `nacionalidade` VARCHAR(50) NULL,
            `estado_civil` VARCHAR(20) NULL,
                `idade` VARCHAR(2) NULL,
                    `endereco` VARCHAR(255) NULL,
                        `telefone` INT(15) NULL,
                            `email` VARCHAR(50) NULL,
                                `senha` VARCHAR(255) NULL,
                                    `foto` VARCHAR(255) NULL DEFAULT `foto-perfil.jpg`,
                        PRIMARY KEY (`idusuario`)
);


-- tabela CURSOS

CREATE TABLE `curriculo`.`cursos` (
    `idcurso` INT NOT NULL AUTO_INCREMENT,
    `nome_curso` VARCHAR(50) NULL,
        `instituicao` VARCHAR(50) NULL,
            `ano_curso` YEAR(4) NULL,
                `idusuario` INT NULL,
                        PRIMARY KEY (`idcurso`)
);

ALTER TABLE `curriculo`.`cursos`
ADD INDEX `idusuario_idx` (`idusuario` ASC) VISIBLE;

ALTER TABLE `curriculo`.`cursos`
ADD CONSTRAINT `idusuario`
FOREIGN KEY (`idusuario`)
REFERENCES `curriculo`.`usuarios` (`idusuario`)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- TABELA FORMAÇÃO

CREATE TABLE `curriculo`.`formacoes` (
    `idformacao` INT NOT NULL AUTO_INCREMENT,
    `nivel` VARCHAR(50) NULL,
        `nome_curso` VARCHAR(50) NULL,
            `instituicao` VARCHAR(50) NULL,
                `ano_inicio` YEAR(4) NULL,
                    `ano_termino` YEAR(4) NULL,
                        `situacao` VARCHAR(20) NULL,
                            `idusuario` INT NULL,
                        PRIMARY KEY (`idformacao`)

                    INDEX `idusuario2_idx` (`idusuario` ASC) VISIBLE,
                    CONSTRAINT `idusuario2`
                    FOREIGN KEY (`idusuario`)
                    REFERENCES `curriculo`.`usuario` (`idusuario`)
                    ON DELETE CASCADE
                    ON UPDATE CASCADE
);