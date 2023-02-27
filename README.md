# Projeto Banco Biblioteca #

**Introdução:** 
Este projeto foi criado durante o curso de DBA, todo o desenvolvimento do projeto foi feito por mim, José Marcos, incluindo MER, DER, Scripts, Alters e Inserts. Consiste em um Banco de Dados para o gerenciamento de uma **Biblioteca** 

**Objetivo do Banco:**
Inicialmente, a biblioteca deseja armazenar para os livros as seguintes características: ISBN, Título, Ano de Lançamento, Editora e Autores deste livro. 

**Regras de Negócio:**
A biblioteca deseja manter as informações sobre seus Livros e Autores.

- Para os autores deseja manter: Nome, Nacionalidade e Quantidade de Livros Publicados;
- Cabe salientar que um autor pode ter vários livros, assim como um livro pode ser escrito por vários autores; 
- Cada Livro da Biblioteca pertence a uma categoria; 
- A biblioteca deseja manter um cadastro de todas as categorias existentes, com informações como: Código da Categoria e Descrição; 
- Uma Categoria pode ter vários livros associados a ela;
- Deseja-se saber qual Editora publicou o livro, apenas o nome da Editora;

**Modelo Conceitual**
![Modelo_Conceitual](https://user-images.githubusercontent.com/112916915/209599300-80e26a4f-96f7-48cd-9fa4-c9fe7e671183.png)

**Relacionamentos**

![Relacionamentos](https://user-images.githubusercontent.com/112916915/209599330-1e6c1233-f4e6-4ee3-abac-70f8bb1a2b64.png)

**Modelo Lógico**

![Modelo lógico](https://user-images.githubusercontent.com/112916915/209599416-ce828754-a3a1-44c0-a420-146d283a9e3a.png)
