# SQL Store Analytics 🛒

*[Read in English below / Leia em português abaixo]*

## 🇧🇷 Português

Projeto de portfólio em SQL simulando o banco de dados de uma loja fictícia (e-commerce simplificado), com foco em modelagem relacional e queries analíticas de negócio.

Rodado em SQLite por enquanto — a escolha foi proposital: o foco neste momento é entender a linguagem SQL e a lógica por trás das queries (JOINs, agregações, filtros), sem a complexidade de configurar um servidor de banco de dados. Conforme o projeto evoluir, pretendo migrar para PostgreSQL e outros SGBDs, explorando recursos mais avançados (window functions completas, tipos de dados mais ricos, performance em escala).

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

### Como rodar

```bash
sqlite3 store.db < schema.sql
sqlite3 store.db < seed_data.sql
sqlite3 store.db < queries/queries.sql
```

Ou, dentro do modo interativo do SQLite:

```bash
sqlite3 store.db
.mode column
.headers on
.read queries/queries.sql
```

### Conceitos demonstrados até aqui

- Modelagem relacional (1:N, chaves estrangeiras)
- JOINs (INNER, encadeados com múltiplas tabelas)
- Agregações (`SUM`, `GROUP BY`)
- Filtros combinados com JOIN (`WHERE` aplicado após junção)
- Ordenação e limitação de resultados (`ORDER BY`, `LIMIT`)
- Tratamento de ponto flutuante (`ROUND`)

### Próximos passos

- Produtos com estoque baixo
- Receita mensal (série temporal)
- Ticket médio por pedido
- Clientes que nunca compraram (`LEFT JOIN`)
- Window functions (`RANK`, soma acumulada)

---

## 🇬🇧 English

SQL portfolio project simulating a fictional store's (e-commerce) database, focused on relational modeling and business analysis queries.

Currently run on SQLite — a deliberate choice: the focus right now is understanding SQL as a language and the logic behind queries (JOINs, aggregations, filters), without the overhead of setting up a database server. As the project evolves, I plan to migrate to PostgreSQL and other DBMSs, exploring more advanced features (full window function support, richer data types, performance at scale).

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

### How to run

```bash
sqlite3 store.db < schema.sql
sqlite3 store.db < seed_data.sql
sqlite3 store.db < queries/queries.sql
```

Or, inside SQLite's interactive mode:

```bash
sqlite3 store.db
.mode column
.headers on
.read queries/queries.sql
```

### Concepts demonstrated so far

- Relational modeling (1:N, foreign keys)
- JOINs (INNER, chained across multiple tables)
- Aggregations (`SUM`, `GROUP BY`)
- Filters combined with JOINs (`WHERE` applied after joining)
- Sorting and limiting results (`ORDER BY`, `LIMIT`)
- Floating point handling (`ROUND`)

### Next steps

- Low stock products
- Monthly revenue (time series)
- Average order ticket
- Customers who never purchased (`LEFT JOIN`)
- Window functions (`RANK`, running total)

---

## License

MIT — see [LICENSE](LICENSE)
