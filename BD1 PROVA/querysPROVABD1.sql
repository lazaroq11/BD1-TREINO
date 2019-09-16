/*a)Insere um registro na tabela empregador*/
insert into empregador (cpf_empregador, nome, telefone, rua, cod_bairro, numero, email) values (1111111, "Lázaro Queiroz", "33127900", "Rua 6 de Janeiro", 1,"16", "lazaroq11@gmail.com");

/*b)Reajuste em 10% do salario dos empregados que possuem escolaridade "ensino superior completo" */
select cpf, data_nascimento, salario,escolaridade.nome, ((salario*0.1)+salario) as reajuste from empregado
inner join escolaridade on empregado.escolaridade = escolaridade.cod_escolaridade
where escolaridade.nome like 'Superio Completo';
select *from empregado;


/*c)Excluir a guia do mês 3/2011 do empregado de cpf 234234*/
DELETE  FROM guia where mes = 3 and ano = 2011 and empregado_guia = 234234 ;


/*d)Listar todos os empregados (cpf e salario) que estão afastado atualmente, ou seja cuja data de termino
do afastamento não está preenchida*/
select cpf,salario from empregado inner join afastamento on empregado.cpf = afastamento.empregado_afastamento
where data_termino = NULL; 


/*e)Listar todos os funcionários (cpf e telefone) cujos patrões moram no em “Salvador”(COMO SOU FODA, ACRESCENTEI
O NOME DO PATRON E O NOME DA CIDADE QUE O PATRONO MORA)*/;
select *From empregado;
select empregado.cpf,empregado.telefone, empregador.nome ,cidade.nome from empregado
inner join empregador on empregado.empregador_empregado = empregador.cpf_empregador 
inner join bairro on empregador.cod_bairro = bairro.cod_bairro 
inner join cidade on bairro.cod_cidade = cidade.cod_cidade where cidade.nome like 'Salvador'


/*g)Lista todos os funcionário que pediram afastamento de feveiro de 2019 a fevereiro de 2022 (independente de ainda
estarem ou não afastados) por motivo de doença, acidente de trabalho ou licença maternidade*/;
select empregado_afastamento,motivo_afastamento.nome from empregado 
inner join afastamento on empregado.cpf = afastamento.empregado_afastamento
inner join motivo_afastamento on afastamento.motivo = motivo_afastamento.idmotivo_afastamento
where motivo_afastamento.nome like 'Doença'or  motivo_afastamento.nome like 'Acidente de Trabalho' or motivo_afastamento.nome like  'Licença maternidade';

/*h) Listar todos os impostos (nome do imposto e percentual) pagos pelo empregado de cpf 12345*/
select nome_imposto, percentual,empregado_imposto from imposto
 inner join imposto_empregado on imposto.cod_imposto = imposto_empregado.cod_imposto 
 where imposto_empregado.empregado_imposto = 12345;
 
/*i) Listar todos os empregados cadastrados (cpf, salario, nível de escolaridade), em ordem alfabética de
nível de escolaridade e ordem decrescente de salario, ou seja, do maior salário para o menor salário*/
SELECT cpf,salario,escolaridade.nome from empregado 
inner join escolaridade on empregado.escolaridade = escolaridade.cod_escolaridade
 order by escolaridade.nome asc, empregado.salario desc;

/*j)Listar o percentual de empregados por nível de escolaridade*/
SELECT empregado.cpf,percentual,nome from empregado 
inner join imposto_empregado on empregado.cpf = imposto_empregado.empregado_imposto
inner join imposto on imposto_empregado.cod_imposto = imposto.cod_imposto
inner join escolaridade on empregado.escolaridade = escolaridade.cod_escolaridade
order by nome;


/*f) Calcular o total já pago por cada funcionário (mostrar o total e o cpf) do empregador de cpf 5678(DUVIDA)*/
