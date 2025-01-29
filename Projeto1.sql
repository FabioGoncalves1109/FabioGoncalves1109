```sql
CREATE TABLE IF NOT EXISTS `meu_banco_de_dados`.`Produto_has_Pedido` (
  `Pedido_idPedido` INT NOT NULL,
  `Quantidade` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Produto_idProduto`, `Pedido_idPedido`),
  INDEX `fk_Produto_has_Pedido_Pedido1_idx` (`Pedido_idPedido` ASC) VISIBLE,
  INDEX `fk_Produto_has_Pedido_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Pedido_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `meu_banco_de_dados`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_tem_Pedido_Pedido1`
    FOREIGN KEY (`Pedido_idPedido`)
    REFERENCES `meu_banco_de_dados`.`Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `meu_banco_de_dados`.`Terceiro_Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meu_banco_de_dados`.`Terceiro_Vendedor` (
  `idTerceiro_Vendedor` INT NOT NULL,
  `Razao_Social` VARCHAR(45) NULL DEFAULT NULL,
  `Local` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idTerceiro_Vendedor`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `meu_banco_de_dados`.`Relacao_Produtos_por_Vendedor_Terceiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meu_banco_de_dados`.`Relacao_Produtos_por_Vendedor_Terceiro` (
  `Terceiro_Vendedor_idTerceiro_Vendedor` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  `Quantidade` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Terceiro_Vendedor_idTerceiro_Vendedor`, `Produto_idProduto`),
  INDEX `fk_Terceiro_Vendedor_has_Produto_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  INDEX `fk_Terceiro_Vendedor_has_Produto_Terceiro_Vendedor1_idx` (`Terceiro_Vendedor_idTerceiro_Vendedor` ASC) VISIBLE,
  CONSTRAINT `fk_Terceiro_Vendedor_has_Produto_Terceiro_Vendedor1`
    FOREIGN KEY (`Terceiro_Vendedor_idTerceiro_Vendedor`)
    REFERENCES `meu_banco_de_dados`.`Terceiro_Vendedor` (`idTerceiro_Vendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Terceiro_Vendedor_has_Produto_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `meu_banco_de_dados`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `meu_banco_de_dados`.`Pessoa_Fisica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meu_banco_de_dados`.`Pessoa_Fisica` (
  `idPessoa_Fisica` INT NOT NULL,
  `CPF` VARCHAR(45) NOT NULL,
  `Data_Nascimento` DATE NULL DEFAULT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idPessoa_Fisica`, `CPF`, `Cliente_idCliente`),
  INDEX `fk_Pessoa_Fisica_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Pessoa_Fisica_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `meu_banco_de_dados`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `meu_banco_de_dados`.`Pessoa_Juridica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meu_banco_de_dados`.`Pessoa_Juridica` (
  `idPessoa_Juridica` INT NOT NULL,
  `CNPJ` VARCHAR(45) NOT NULL,
  `Razao_Social` VARCHAR(45) NULL DEFAULT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idPessoa_Juridica`, `CNPJ`, `Cliente_idCliente`),
  INDEX `fk_Pessoa_Juridica_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Pessoa_Juridica_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `meu_banco_de_dados`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `meu_banco_de_dados`.`Forma_Pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meu_banco_de_dados`.`Forma_Pagamento` (
  `idForma_Pagamento` INT NOT NULL,
  `Descricao` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idForma_Pagamento`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `meu_banco_de_dados`.`Forma_Pagamento_has_Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meu_banco_de_dados`.`Forma_Pagamento_has_Pedido` (
  `Forma_Pagamento_idForma_Pagamento` INT NOT NULL,
  `Pedido_idPedido` INT NOT NULL,
  `Forma_Pagamento_has_Pedidocol` VARCHAR(45) NULL DEFAULT NULL,
  `valor_pagamento` INT(2) NOT NULL,
  PRIMARY KEY (`Forma_Pagamento_idForma_Pagamento`, `Pedido_idPedido`),
  INDEX `fk_Forma_Pagamento_has_Pedido_Pedido1_idx` (`Pedido_idPedido` ASC) VISIBLE,
  INDEX `fk_Forma_Pagamento_has_Pedido_Forma_Pagamento1_idx` (`Forma_Pagamento_idForma_Pagamento` ASC) VISIBLE,
  CONSTRAINT `fk_Forma_Pagamento_has_Pedido_Forma_Pagamento1`
    FOREIGN KEY (`Forma_Pagamento_idForma_Pagamento`)
    REFERENCES `meu_banco_de_dados`.`Forma_Pagamento` (`idForma_Pagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Forma_Pagamento_has_Pedido_Pedido1`
    FOREIGN KEY (`Pedido_idPedido`)
    REFERENCES `meu_banco_de_dados`.`Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
