#GameStore — Banco de Dados

Projeto acadêmico de banco de dados relacional para uma loja digital de jogos, inspirado em plataformas como Steam, PlayStation Store e Xbox Store.

##Objetivo

Desenvolver um banco de dados utilizando MySQL para gerenciar jogos, desenvolvedoras, categorias, usuários, pedidos, pagamentos, bibliotecas digitais e avaliações.

##Tecnologias

- **MySQL Server:** gerenciamento do banco de dados.
- **MySQL Workbench:** criação e execução dos comandos SQL.
- **SQL:** consultas e manipulação dos dados.

##Estrutura do banco

O banco `GameStore` possui 10 tabelas:

| Tabela | Função |
|---|---|
| `Usuario` | Cadastro de usuários. |
| `Desenvolvedora` | Cadastro das desenvolvedoras. |
| `Jogo` | Catálogo de jogos e preços. |
| `Categoria` | Gêneros dos jogos. |
| `JogoCategoria` | Relacionamento entre jogos e categorias. |
| `Pedido` | Registro de pedidos. |
| `ItemPedido` | Jogos incluídos nos pedidos. |
| `Pagamento` | Informações de pagamento. |
| `Biblioteca` | Jogos adquiridos pelos usuários. |
| `Avaliacao` | Notas e comentários dos jogos. |

##Relacionamentos

- Uma desenvolvedora pode possuir vários jogos.
- Jogos podem pertencer a várias categorias.
- Um usuário pode realizar vários pedidos.
- Pedidos podem conter vários jogos.
- Cada pedido pode possuir um registro de pagamento.
- Usuários podem adquirir jogos e avaliá-los.

Os relacionamentos utilizam chaves primárias (`PRIMARY KEY`) e estrangeiras (`FOREIGN KEY`).

##Scripts SQL

O projeto possui 10 scripts independentes:

1. `01_jogos_desenvolvedoras.sql` — consulta com `JOIN`.
2. `02_jogos_categorias.sql` — jogos e categorias.
3. `03_catalogo_completo.sql` — junção de várias tabelas.
4. `04_jogos_por_categoria.sql` — contagem com `COUNT` e `GROUP BY`.
5. `05_preco_medio_desenvolvedora.sql` — agregações com `AVG` e `HAVING`.
6. `06_filtros_catalogo.sql` — filtros com `WHERE`, `BETWEEN`, `LIKE` e `ORDER BY`.
7. `07_atualizar_preco.sql` — atualização com `UPDATE`.
8. `08_remover_categoria_jogo.sql` — exclusão de relacionamento com `DELETE`.
9. `09_criar_view_executiva.sql` — criação da View `vw_painel_executivo`.
10. `10_consultar_view_executiva.sql` — consulta dos indicadores da View.

##Como executar

1. Abra o MySQL Workbench e conecte-se ao servidor.
2. Selecione o banco com `USE GameStore;`.
3. Execute os scripts SQL individualmente.
4. Confira os resultados das consultas.
5. Execute o script 09 antes do script 10.

**Atenção:** os scripts de atualização e exclusão modificam os dados existentes. Execute-os com cuidado.

##View executiva

A View `vw_painel_executivo` apresenta indicadores gerais do sistema, incluindo quantidade de jogos, desenvolvedoras, categorias, usuários e pedidos, além do preço médio dos jogos e do valor total registrado nos pedidos.

##Informações acadêmicas

- **Curso:** Análise e Desenvolvimento de Sistemas (ADS)
- **Disciplina:** Modelagem de Banco de Dados
- **Integrantes:** *Preencher com os nomes da equipe*
- **Instituição:** *Preencher com o nome da instituição*

##Conclusão

O projeto demonstra a aplicação de conceitos de bancos de dados relacionais, relacionamentos entre tabelas, consultas SQL, funções de agregação, manipulação de dados e criação de relatórios utilizando Views.
