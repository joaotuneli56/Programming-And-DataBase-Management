
SELECT * FROM pf0645.especies_marinhas;
SELECT * FROM pf0645.condicoes_ambientais;
SELECT * FROM pf0645.poluicoes;
SELECT * FROM pf0645.localizacoes;

DESCRIBE pf0645.localizacoes;
DESCRIBE pf0645.especies_marinhas;
DESCRIBE pf0645.condicoes_ambientais;
DESCRIBE pf0645.poluicoes;

-- exercicio1

WITH TemperaturaMedia AS (
    SELECT
        LOCALIZACAO_ID,
        AVG(TEMPERATURA) AS MEDIA_TEMPERATURA
    FROM pf0645.condicoes_ambientais
    GROUP BY LOCALIZACAO_ID
)
SELECT
    l.NOME AS LOCAL_NOME,
    ROUND(tm.MEDIA_TEMPERATURA,2)
FROM pf0645.localizacoes l
JOIN TemperaturaMedia tm ON l.LOCALIZACAO_ID = tm.LOCALIZACAO_ID;

-- exercicio2

SELECT
    L.NOME AS NOME_LOCALIZACAO,
    C.DATA AS DATA_CONDICAO,
    P.TIPO_POLUENTE,
    AVG(c.TEMPERATURA) AS MEDIA_TEMPERATURA
FROM pf0645.localizacoes L
JOIN pf0645.condicoes_ambientais C ON L.LOCALIZACAO_ID = C.LOCALIZACAO_ID
JOIN pf0645.poluicoes P ON L.LOCALIZACAO_ID = P.LOCALIZACAO_ID
WHERE 
    L.NOME IN ('Baía de Guanabara', 'Recife de Tubbataha')
    AND P.TIPO_POLUENTE IN ('Sedimentos', 'Mercúrio')
GROUP BY
    L.NOME,
    C.DATA,
    P.TIPO_POLUENTE
ORDER BY
    L.NOME,
    C.DATA,
    P.TIPO_POLUENTE;
    
-- exercicio 3 

drop table poluicoes_grave;
drop table poluicoes_comum;

CREATE TABLE poluicoes_grave 
(
	poluicao_id INT PRIMARY KEY,
	localizacao_id INT,
	data DATE,
	tipo_poluente VARCHAR2(50),
	concentracao FLOAT,
	descricao CLOB,
	nome_localizacao VARCHAR2(100),
	FOREIGN KEY(localizacao_id) REFERENCES localizacoes(localizacao_id)
);


CREATE TABLE poluicoes_comum
(
	poluicao_id INT PRIMARY KEY,
	localizacao_id INT,
	data DATE,
	tipo_poluente VARCHAR2(50),
	concentracao FLOAT,
	descricao CLOB,
	nome_localizacao VARCHAR2(100),
	FOREIGN KEY (localizacao_id) REFERENCES localizacoes(localizacao_id)
);

INSERT ALL
  WHEN CONCENTRACAO > 10 THEN
    INTO poluicoes_grave (id, localizacao_id, data, tipo_poluente, concentracao, descricao)
    VALUES (id, localizacao_id, data, tipo_poluente, concentracao, descricao)
  WHEN CONCENTRACAO <= 10 THEN
    INTO poluicoes_comum (id, localizacao_id, data, tipo_poluente, concentracao, descricao)
    VALUES (id, localizacao_id, data, tipo_poluente, concentracao, descricao)
SELECT id, localizacao_id, data, tipo_poluente, concentracao, descricao
FROM pf0645.poluicoes;

-- exercicio 4

CREATE VIEW VisaoPoluicao AS
SELECT
    l.NOME AS NOME_LOCALIZACAO,
    p.DATA AS DATA_OCORRENCIA,
    p.TIPO_POLUENTE,
    p.CONCENTRACAO
FROM
    LOCALIZACOES l
JOIN
    POLUICOES p ON l.LOCALIZACAO_ID = p.LOCALIZACAO_ID
ORDER BY
    p.CONCENTRACAO ASC
WITH READ ONLY;

    


    