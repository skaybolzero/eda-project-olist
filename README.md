# Análise Exploratória e Governança de Dados no E-Commerce (Olist) — v1.0

## Visão Geral do Projeto
Este projeto consiste na **Análise Exploratória de Dados (EDA)** e **Auditoria de Qualidade de Cadastro** no ecossistema de e-commerce da Olist. O objetivo principal desta versão 1.0 foi investigar a consistência dos dados de catálogo, padrões de vendas por categoria e comportamento de precificação utilizando **SQL**.

---

## Principais Achados & Insights de Negócio

### 1. Governança e Qualidade de Cadastros (Data Hygiene)
* **Achado:** Mapeamento de produtos comercializados sem categoria cadastrada (`NULL` / vazios).
* **Impacto Comercial:** Produtos sem categoria afetam o motor de busca do marketplace, gerando "pontos cegos" de venda e prejudicando a experiência de navegação do cliente.

### 2. Mix de Vendas e Categorias Líderes
* **Achado:** Identificação do Top 10 de categorias em volume de vendas (ex: *cama_mesa_banho*, *beleza_saude*), aplicando filtro de exclusão dos registros órfãos mapeados na etapa de governança.
* **Impacto Comercial:** Permite concentrar esforços de estoque e campanhas de marketing nas categorias que realmente movem a receita.

### 3. Estrutura e Dispersão de Precificação
* **Achado:** Mapeamento de variação de preços praticados para um mesmo SKU (`product_id`).
* **Impacto Comercial:** Evidencia a dinâmica de concorrência entre múltiplos *sellers* ofertando o mesmo item e potenciais ajustes sazonais de preço.

---

## Tecnologias e Conceitos Utilizados
* **Linguagem:** SQL (MySQL)
* **Técnicas Aplicadas:** Agregações (`SUM`, `COUNT`, `AVG`), Junções (`INNER JOIN`), Agregação Condicional (`CASE WHEN`), Filtros em Agregados (`HAVING`) e Limpeza de Dados.

---

## Próximos Passos (Backlog v2.0)
- [ ] Exportar as tabelas consolidadas para criação de um Dashboard Executivo no Power BI.
- [ ] Analisar a correlação entre tempo de entrega (`freight_value` / prazo) e taxa de satisfação do cliente.