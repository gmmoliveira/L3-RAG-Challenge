# L3-RAG-Challenge
Solução de RAG para o desafio proposto no processo seletivo da L3

### Autor: Guilherme Oliveira
### Contato: gmmoliveira1@gmail.com
### Data: 18 de agosto de 2025

# Definição do Problema

Criar uma implementação de Retrieval-Augmented Generation (RAG) que utilize como base de conhecimentos arquivos PDF. Quaisquer ferramentas e frameworks podem ser utilizados.

# O que foi implementado

Foram implementados os seguintes recursos:

- Retrieval-Augmented Generation (RAG) utilizando como base `function tool calling`;
- Busca híbrida no banco de dados vetorial contemplando query e palavras-chave;
- Worflow simplificado com um único agente atuando em 2 etapas:
  1. Simplificação da query e escolha de palavras-chave;
  2. Busca na base de dados utilizando a query e as palavras-chave e subsequente formulação da resposta baseado nos resultados da busca;

Neste exemplo, é utilizado o modelo Qwen 3 de 32 bilhões de parâmetros pré-treinados cujo conhecimento foi destilado do Deepseek R1. Trata-se de um excelente modelo que requer uma GPU poderosa.

## Premissas

1. Existe um diretório onde residem um ou mais arquivos PDF que devem ser integrados à base de conhecimento.
2. Será utilizado um único modelo LLM de deploy local e consiste em alguma versão do Qwen 3 destilado do DeepSeek-R1

# Requisitos

Verifique o arquivo `recursos/requirements.txt` para ver detalhes dos pacotes python. Para o Retrieval-Augmented Generation com o framework stack escolhido será necessário instalar e rodar um banco de dados vetorial, neste caso escolhi o PostgreSQL empoderado com o PgVector. Para facilitar sua configuração e isolar seu funcionamento de demais componentes do sistema, escolhi a criação de um container Docker onde o banco de dados vetorial irá residir.

Construa a imagem do container docker:
```
sudo docker build -t rag_postgres .
```

Execute o container docker criado, ajuste os argumentos em acordo com as necessidades (e.g., para redirecionar a porta 5432 do container para 5000, utilize o argumento `-p 5432:5000`):
```
sudo docker run -d --name rag_postgres -p 5432:5432 -v pgdata:/var/lib/postgresql/data rag-postgres
```

Comandos auxiliares para ver os containers criados, parar a execução de um container e remover um container:
```
sudo docker ps -a
sudo docker stop rag_postgres
sudo docker remove rag_postgres
```

Existem algumas variáveis que são persistidas entre diferentes execuções do container, para modificá-las é necessário limpá-las:
```
sudo docker volume rm pgdata
```

Agora o banco de dados está executando, podemos executar o jupyter notebook `main.ipynb`.

# Sistemas Utilizados & Requisitos

Foram utilizados os seguintes sistemas:

- python 3.11.11
- PostgreSQL 17
- PgVector 0.8.0
- Ubuntu 22.04

Para detalhes dos pacotes python, verifique o arquivo `requirements.txt`.

# Declaração do Uso de IA

Declaro que, neste projeto, não utilizei ferramentas de inteligência artificial para gerar o código-fonte por mim e, desta forma, sou o autor deste trabalho em sua integralidade. Declaro que utilizei IA para criar algumas perguntas de exemplo que encontram-se no arquivo `recursos/sample_questions.json`.