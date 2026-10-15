use `project-olist`;

-- =====================================================================
-- BLOCO 1: ANÁLISE DE MIX DE PRODUTOS E PERFORMANCE COMERCIAL
-- Objetivo: Mapear as 10 categorias de produtos com maior volume de vendas 
-- na plataforma, cruzando a base de itens pedidos com o catálogo.
-- =====================================================================
SELECT
opd.product_category_name,
COUNT(opd.product_id) as Qtd_vendas
FROM olist_order_items_dataset ooid
	INNER JOIN olist_products_dataset opd ON ooid.product_id = opd.product_id
WHERE opd.product_category_name IS NOT NULL 
  AND opd.product_category_name != ''
GROUP BY opd.product_category_name
ORDER BY Qtd_vendas DESC
LIMIT 10;


-- =====================================================================
-- BLOCO 2: AUDITORIA DE QUALIDADE DE DADOS E GOVERNANÇA DE CATÁLOGO
-- Objetivo: Identificar a integridade do cadastro de produtos, verificando 
-- o volume de itens com e sem categoria definida na base da Olist.
-- =====================================================================
SELECT
	SUM(CASE WHEN opd.product_category_name IS NOT NULL AND opd.product_category_name != '' THEN 1 ELSE 0 END) AS produto_com_categoria,
	SUM(CASE WHEN opd.product_category_name IS NULL OR opd.product_category_name = '' = FALSE THEN 0 ELSE 1 END) AS produto_sem_categoria,
	COUNT(*) AS total_produtos
FROM olist_products_dataset opd;


-- =====================================================================
-- BLOCO 3: ESTRUTURA E DISPERSÃO DE PREÇOS POR PRODUTO
-- Objetivo: Identificar os produtos que apresentaram variação de preço 
-- de venda no catálogo, medindo a dispersão entre o menor e o maior valor.
-- =====================================================================
SELECT 
    product_id,
    ROUND(AVG(price), 2) AS avg_price,
    MIN(price) AS min_price,
    MAX(price) AS max_price,
    ROUND(MAX(price) - MIN(price), 2) AS valor_variacao
FROM olist_order_items_dataset
GROUP BY product_id
HAVING MAX(price) > MIN(price)
ORDER BY valor_variacao DESC;


-- =====================================================================
-- BLOCO 4: COMPORTAMENTO DE PAGAMENTO DO CONSUMIDOR
-- Objetivo: Analisar a preferência dos clientes quanto às formas de 
-- pagamento e volume de parcelamento médio.
-- =====================================================================
SELECT 
    payment_type,
    COUNT(order_id) AS total_pedidos,
    ROUND(AVG(payment_installments), 1) AS media_parcelas
FROM olist_order_payments_dataset
GROUP BY payment_type
ORDER BY total_pedidos DESC;

