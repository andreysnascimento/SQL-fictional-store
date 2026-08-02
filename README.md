# SQL Store Analytics 🛒

*[Read in English below / Leia em português abaixo]*

## 🇧🇷 Português

Projeto de portfólio em SQL simulando o banco de dados de uma loja fictícia (e-commerce simplificado), com foco em modelagem relacional e queries analíticas de negócio.

Rodado em PostgreSQL. O projeto começou em SQLite, focado em fixar a linguagem SQL sem a fricção de configurar um servidor, e foi migrado para PostgreSQL conforme avancei para tópicos mais próximos de produção (tipos de dados mais robustos e regras mais rígidas de agregação).

### Estrutura do banco

- **customers** — clientes cadastrados
- **categories** — categorias de produto
- **products** — catálogo de produtos, com preço e estoque
- **orders** — pedidos, com status (completed / pending / cancelled)
- **order_items** — itens de cada pedido (tabela associativa entre orders e products)

### Arquivos

| Arquivo | Descrição |
|---|---|
| `schema.sql` | Criação das tabelas, chaves primárias/estrangeiras, constraints e índices |
| `seed_data.sql` | Dados fictícios para popular o banco (10 clientes, 10 produtos, 15 pedidos, 20 itens) |
| `queries/queries.sql` | 6 queries de análise de negócio, ordenadas da mais simples para a mais avançada, com comentários bilíngues explicando o objetivo de cada uma |

### Queries implementadas

As queries estão ordenadas por complexidade crescente:

1. **Produtos com estoque baixo** — produtos com menos de 30 unidades em estoque
2. **Receita total por categoria** — soma de receita agrupada por categoria, considerando apenas pedidos `completed`
3. **Top 5 clientes por valor total gasto** — ranking dos clientes que mais gastaram, considerando apenas pedidos `completed`
4. **Clientes que nunca compraram** — usando `LEFT JOIN` para identificar clientes sem nenhum pedido
5. **Ticket médio por pedido** — valor médio gasto por pedido, usando subquery, considerando apenas pedidos `completed`
6. **Ranking de produtos mais vendidos** — usando a window function `RANK()` para posicionar cada produto por quantidade vendida

### Como rodar

```bash
createdb store
psql -d store -f schema.sql
psql -d store -f seed_data.sql
psql -d store -f queries/queries.sql
```

### Conceitos demonstrados

- Modelagem relacional (1:N, chaves estrangeiras)
- JOINs (INNER, encadeados com múltiplas tabelas, e LEFT JOIN)
- Agregações (`SUM`, `AVG`, `GROUP BY`)
- Filtros combinados com JOIN (`WHERE` aplicado após junção)
- Ordenação e limitação de resultados (`ORDER BY`, `LIMIT`)
- Subqueries (consulta dentro de consulta)
- Window functions (`RANK() OVER (...)`)
- Tratamento de ponto flutuante (`ROUND`)
- Diferenças de comportamento entre SQLite e PostgreSQL (rigor de `GROUP BY`, ambiguidade de colunas)

---

## 🇬🇧 English

SQL portfolio project simulating a fictional store's (e-commerce) database, focused on relational modeling and business analysis queries.

Run on PostgreSQL. The project started on SQLite, focused on mastering the SQL language itself without the overhead of setting up a server, and was migrated to PostgreSQL as I moved on to more production-oriented topics (richer data types and stricter aggregation rules).

### Database structure

- **customers** — registered customers
- **categories** — product categories
- **products** — product catalog, with price and stock
- **orders** — orders, with status (completed / pending / cancelled)
- **order_items** — items in each order (junction table between orders and products)

### Files

| File | Description |
|---|---|
| `schema.sql` | Table creation, primary/foreign keys, constraints and indexes |
| `seed_data.sql` | Fictional data to populate the database (10 customers, 10 products, 15 orders, 20 items) |
| `queries/queries.sql` | 6 business analysis queries, ordered from simplest to most advanced, with bilingual comments explaining the purpose of each one |

### Queries implemented

Queries are ordered by increasing complexity:

1. **Low stock products** — products with fewer than 30 units in stock
2. **Total revenue by category** — revenue summed and grouped by category, only for `completed` orders
3. **Top 5 customers by total spending** — ranking of customers who spent the most, only for `completed` orders
4. **Customers who never purchased** — using `LEFT JOIN` to identify customers with no orders
5. **Average order ticket** — average amount spent per order, using a subquery, only for `completed` orders
6. **Top selling products ranking** — using the `RANK()` window function to position each product by units sold

### How to run

```bash
createdb store
psql -d store -f schema.sql
psql -d store -f seed_data.sql
psql -d store -f queries/queries.sql
```

### Concepts demonstrated

- Relational modeling (1:N, foreign keys)
- JOINs (INNER, chained across multiple tables, and LEFT JOIN)
- Aggregations (`SUM`, `AVG`, `GROUP BY`)
- Filters combined with JOINs (`WHERE` applied after joining)
- Sorting and limiting results (`ORDER BY`, `LIMIT`)
- Subqueries (query within a query)
- Window functions (`RANK() OVER (...)`)
- Floating point handling (`ROUND`)
- Behavioral differences between SQLite and PostgreSQL (`GROUP BY` strictness, column ambiguity)

---

## License

MIT — see [LICENSE](LICENSE)
