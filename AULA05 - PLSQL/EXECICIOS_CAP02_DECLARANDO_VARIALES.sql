/*exercicios - CAP 02 - Declaração de variaveis*/

/*
1. Identifique se os nomes dos identificadores são válidos ou inválidos:

a. today - VALIDO
b. last_name - VALIDO
c. today’s_date - INVALIDO 
d. Number_of_days_in_February_this_year - INVALIDO
e. Isleap$year - VALIDO
f. #number - INVALIDO 
g. NUMBER# - VALIDO
h. number1to7 - VALIDO

*/

/*
2. Identifique se a declaração de variável e a inicialização é válida ou inválida:
a. printer_name constant VARCHAR2(10); - INVALIDA(Variavel não inicializada)
b. deliver_to VARCHAR2(10):=Johnson; - INVALIDA(faltou aspas ou utilizar o DEFINA, pois é uma variavel char)
c. by_when DATE:= SYSDATE+1 - VALIDA;
*/

/*
3. Examine o seguinte bloco anônimo e escolha a resposta correta apropriada.
        SET SERVEROUTPUT ON
        DECLARE
            fname VARCHAR2(20);
            lname VARCHAR2(15) DEFAULT 'fernandez';
        BEGIN
            DBMS_OUTPUT.PUT_LINE( FNAME ||' ' ||lname);
        END;

a. O bloco será executado com sucesso mas não será impresso nada.
b. O bloco retornará um erro porque a variável fname é declarada sem ser iniciada.
c. O bloco será executado com sucesso e irá imprimir 'fernandez'.
d. O bloco retornará um erro porque você não pode usar a palavra-chave DEFAULT
para inicializar uma variável do tipo VARCHAR2.
e. O bloco retornará um erro porque a variável FNAME não foi declarada.

ALTERNATIVA CERTA --> C
*/

SET SERVEROUTPUT ON
DECLARE
    fname VARCHAR2(20);
    lname VARCHAR2(15) DEFAULT 'fernandez';
BEGIN
    DBMS_OUTPUT.PUT_LINE( FNAME ||' ' ||lname);
END;

/*
4. Crie um bloco anônimo. Carregue o script da aula 01 lab_01_02_soln.sql, que você
criou na pergunta 2 do exercício 1.

a. Adicione a seção DECLARE nesse bloco PL/SQL. Na seção DECLARE declare
as seguintes variáveis:
        1. Variável today do tipo DATE. Inicializar today com SYSDATE
        2. Variável tomorrow do tipo today. Use o atributo%TYPE para declarar essa variável.
b. Na seção executável inicialize a variável tomorrow com uma expressão que calcula a data 
de tomorrow (adicione um ao valor de today). Exiba o valor de today e tomorrow após de imprimir 'Hello World‘

c. Execute e salve este script como lab_02_04_soln.sql. Um exemplo da saída é mostrada a seguir.

hello world
TODAY IS : 12-JAN-04
TOMORROW IS: 13-JAN-04

*/
DECLARE
    today DATE;
    tomorrow today%TYPE;
BEGIN 
    today := SYSDATE;
    tomorrow := SYSDATE + 1;
    DBMS_OUTPUT.PUT_LINE ('Hello word');
    DBMS_OUTPUT.PUT_LINE ('TODAY IS:' || today);
    DBMS_OUTPUT.PUT_LINE ('TOMORROW IS: ' || tomorrow);
END;

/*
5. Edite o script lab_02_04_soln.sql.

a. Crie as bind variables basic_percent e pf_percent do tipo NUMBER.

b. Na seção executável do bloco PL/SQL atribua os valores 45 e 12 a basic_percent

e pf_percent, respectivamente.

c. Encerre o bloco PL/SQL com "/" e exiba o valor das bind variables utilizando o
comando PRINT.

d. Execute e salve seu arquivo de script como lab_02_05_soln.sql.

Na seção executável do bloco PL/SQL atribua os valores 45 e 12 a basic_percent e
pf_percent, respectivamente. Encerre o bloco PL/SQL com "/" e exibir o valor das variáveis de ligação usando o
comando PRINT.

Execute e salve seu arquivo de script como lab_02_05_soln.sql. 

*/

VARIABLE basic_percent NUMBER
VARIABLE pf_percent NUMBER

DECLARE
    today DATE;
    tomorrow today%TYPE;
BEGIN 
    :basic_percent := 45;
    :pf_percent := 12;
    
    today := SYSDATE;
    tomorrow := SYSDATE + 1;
    DBMS_OUTPUT.PUT_LINE ('Hello word');
    DBMS_OUTPUT.PUT_LINE ('TODAY IS:' || today);
    DBMS_OUTPUT.PUT_LINE ('TOMORROW IS: ' || tomorrow);
END;
/
PRINT basic_percent
PRINT pf_percent
