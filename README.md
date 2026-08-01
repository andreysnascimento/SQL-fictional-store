# SQL Store Analytics 🛒

*[Read in English below / Leia em português abaixo]*

## 🇧🇷 Português

Projeto de portfólio em SQL simulando o banco de dados de uma loja fictícia (e-commerce simplificado), com foco em modelagem relacional e queries analíticas de negócio.

Rodado em PostgreSQL. O projeto começou em SQLite, focado em fixar a linguagem SQL sem a fricção de configurar um servidor, e foi migrado para PostgreSQL conforme avancei para tópicos mais próximos de produção (tipos de dados mais robustos, regras mais rígidas de agregação, e futuramente window functions completas e performance em escala).

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
| `queries/queries.sql` | Queries de análise de negócio |

### Queries já implementadas

1. **Receita total por categoria** — soma de receita agrupada por categoria, considerando apenas pedidos com status `completed`
2. **Top 5 clientes por valor total gasto** — ranking dos clientes que mais gastaram, considerando apenas pedidos `completed`
3. **Produtos com estoque baixo** — produtos com menos de 30 unidades em estoque
4. **Ticket médio por pedido** — valor médio gasto por pedido, usando subquery, considerando apenas pedidos `completed`

### Como rodar

```bash
createdb store
psql -d store -f schema.sql
psql -d store -f seed_data.sql
psql -d store -f queries/queries.sql
```

### Conceitos demonstrados até aqui

- Modelagem relacional (1:N, chaves estrangeiras)
- JOINs (INNER, encadeados com múltiplas tabelas)
- Agregações (`SUM`, `GROUP BY`)
- Filtros combinados com JOIN (`WHERE` aplicado após junção)
- Ordenação e limitação de resultados (`ORDER BY`, `LIMIT`)
- Tratamento de ponto flutuante (`ROUND`)

### Próximos passos

- Receita mensal (série temporal, usando `DATE_TRUNC`)
- Clientes que nunca compraram (`LEFT JOIN`)
- Window functions (`RANK`, soma acumulada)

---

## 🇬🇧 English

SQL portfolio project simulating a fictional store's (e-commerce) database, focused on relational modeling and business analysis queries.

Run on PostgreSQL. The project started on SQLite, focused on mastering the SQL language itself without the overhead of setting up a server, and was migrated to PostgreSQL as I moved on to more production-oriented topics (stricter aggregation rules, richer data types, and eventually full window function support and performance at scale).

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
| `queries/queries.sql` | Business analysis queries |

### Queries implemented so far

1. **Total revenue by category** — revenue summed and grouped by category, only for `completed` orders
2. **Top 5 customers by total spending** — ranking of customers who spent the most, only for `completed` orders
3. **Low stock products** — products with fewer than 30 units in stock
4. **Average order ticket** — average amount spent per order, using a subquery, only for `completed` orders

### How to run

```bash
createdb store
psql -d store -f schema.sql
psql -d store -f seed_data.sql
psql -d store -f queries/queries.sql
```

### Concepts demonstrated so far

- Relational modeling (1:N, foreign keys)
- JOINs (INNER, chained across multiple tables)
- Aggregations (`SUM`, `GROUP BY`)
- Filters combined with JOINs (`WHERE` applied after joining)
- Sorting and limiting results (`ORDER BY`, `LIMIT`)
- Floating point handling (`ROUND`)

### Next steps

- Monthly revenue (time series, using `DATE_TRUNC`)
- Customers who never purchased (`LEFT JOIN`)
- Window functions (`RANK`, running total)

---

## License

MIT — see [LICENSE](LICENSE)
